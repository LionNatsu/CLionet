#include "CLionetHttp.bi"
#define NEWLINE !"\r\n"

#ifdef __FB_DEBUG__
    #define WHAT_THE_HELL(x) print "[FATAL ERROR] in " & __FILE__ & " (" & __FUNCTION__ & ") line " & __LINE__ & " : " & x : ExitProcess( -1 )
    #define DEBUG_PRINT(x) print "[DEBUG] in " & __FILE__ & " (" & __FUNCTION__ & ") line " & __LINE__ & " : " & NEWLINE & x
    #define HERE_I_AM print "[MILESTONE] in " & __FILE__ & " (" & __FUNCTION__ & ") line " & __LINE__
#else
    #define WHAT_THE_HELL(x) ExitProcess( -1 )
    #define DEBUG_PRINT(x)
    #define HERE_I_AM
#endif

declare function base64_encode( src as const string ) as string
declare function base64_decode( src as const string ) as string

enum RECV_STATE
    HEAD_NOTCOMPLETE
    HEAD_COMPLETED
end enum

sub CLionetHttp.onSocket( socketboku as CLionet ptr, msg as integer, errcode as integer )
    dim as CLionetHttp ptr boku = cast( CLionetHttp ptr, socketboku->g_key )
    select case msg
        case CLE_INIT
            boku->m_state = CLHS_STANDBY
        case CLE_CONNECT
            boku->SetState( CLHS_CONNECTED )
        case CLE_WRITE
            if boku->m_state = CLHS_SENDING then
                boku->m_state = CLHS_WAITING
            endif
        case CLE_READ
            boku->SetState( CLHS_RECEIVING )
            dim as byte ptr _4kbuffer = boku->m_4k_buffer
            dim as integer _size = boku->m_socket->recv( _4kbuffer, 10000 )
            if boku->m_recv_header_state = HEAD_NOTCOMPLETE then
                'Search the terminator of header
                dim as integer header_ending_pos
                'Search from the tail of the header
                if boku->m_recv_header_length > 0 then
                    'Element cat_buffer( 6 ) is reserved for \0
                    dim as byte cat_buffer( 6 )
                    CopyMemory( @cat_buffer( 0 ), @boku->m_recv_header[ boku->m_recv_header_length - 3 ], 3 )
                    if _size > 3 then
                        CopyMemory( @cat_buffer( 3 ), _4kbuffer, 3 )
                    else
                        CopyMemory( @cat_buffer( 3 ), _4kbuffer, _size )
                    endif
                    header_ending_pos = instr( *cast( zstring ptr, @cat_buffer( 0 ) ), NEWLINE & NEWLINE )
                endif
                if header_ending_pos = 0 then
                    dim as string _str = space( _size )
                    CopyMemory( strptr( _str ), _4kbuffer, _size )
                    header_ending_pos = instr( _str, NEWLINE & NEWLINE )
                    if header_ending_pos <> 0 then header_ending_pos += len(  NEWLINE & NEWLINE ) - 1
                endif
                if header_ending_pos <> 0 then
                    'There's the terminator.
                    'header
                    EnterCriticalSection( @boku->m_header_critical )
                        boku->m_recv_header = reallocate( boku->m_recv_header, boku->m_recv_header_length + header_ending_pos )
                        CopyMemory( @boku->m_recv_header[ boku->m_recv_header_length ], _4kbuffer, header_ending_pos )
                        boku->m_recv_header_length += header_ending_pos
                    LeaveCriticalSection( @boku->m_header_critical )
                    'content
                    EnterCriticalSection( @boku->m_buffer_critical )
                        boku->m_recv_buffer = allocate( _size - header_ending_pos )
                        CopyMemory( boku->m_recv_buffer, @_4kbuffer[header_ending_pos], _size - header_ending_pos )
                        boku->m_recv_length = _size - header_ending_pos
                    LeaveCriticalSection( @boku->m_buffer_critical )
                    'set the flag
                    boku->m_recv_header_state = HEAD_COMPLETED
                    boku->parseResponseHeader()
                    'process completed.
                    if boku->m_recv_length = boku->m_recv_expected_length then boku->m_state = CLHS_COMPLETED
                    if boku->m_recv_length > boku->m_recv_expected_length then WHAT_THE_HELL("RECEIVED A LARGER PACKET")
                else
                    'There's no the terminator yet.
                    'header
                    EnterCriticalSection( @boku->m_header_critical )
                        boku->m_recv_header = reallocate( boku->m_recv_header, boku->m_recv_header_length + _size )
                        CopyMemory( @boku->m_recv_header[ boku->m_recv_header_length ], _4kbuffer, _size )
                        boku->m_recv_header_length += _size
                    LeaveCriticalSection( @boku->m_header_critical )
                endif
            else
                'Receiving the content: Verify that the size is not overflow, and copy data to buffer.
                'content
                EnterCriticalSection( @boku->m_buffer_critical )
                    boku->m_recv_buffer = reallocate( boku->m_recv_buffer, boku->m_recv_length + _size )
                    CopyMemory( @boku->m_recv_buffer[ boku->m_recv_length ], _4kbuffer, _size )
                    boku->m_recv_length += _size
                LeaveCriticalSection( @boku->m_buffer_critical )
                if boku->m_recv_length = boku->m_recv_expected_length then boku->SetState( CLHS_COMPLETED )
                if boku->m_recv_length > boku->m_recv_expected_length then WHAT_THE_HELL("RECEIVED A LARGER PACKET")
            endif
    end select
end sub

constructor CLionetHttp()
    this.m_socket = new CLionet()
    this.m_socket->g_key = @this
    this.m_socket->onSocket = procptr( CLionetHttp.onSocket )
    this.m_4k_buffer = allocate( 4100 )
    this.m_event_waitfor = 0
    this.m_event_statechange = CreateEvent( 0, 0, 0, 0 )
    InitializeCriticalSection( @this.m_header_critical )
    InitializeCriticalSection( @this.m_buffer_critical )
    
    this.m_socket->async = CLM_EVENTSELECT
end constructor

destructor CLionetHttp()
    delete this.m_socket
    deallocate this.m_4k_buffer
    EnterCriticalSection( @this.m_header_critical )
    deallocate this.m_recv_header
    LeaveCriticalSection( @this.m_header_critical )
    EnterCriticalSection( @this.m_buffer_critical )
    deallocate this.m_recv_buffer
    LeaveCriticalSection( @this.m_buffer_critical )
    CloseHandle( this.m_event_statechange )
    DeleteCriticalSection( @this.m_header_critical )
    DeleteCriticalSection( @this.m_buffer_critical )
end destructor

sub CLionetHttp.WaitForState( stat as CLIONETHTTP_STATE, timeout as integer )
    this.m_event_waitfor = stat
    WaitForSingleObject( this.m_event_statechange, timeout )
end sub

sub CLionetHttp.SetState( stat as CLIONETHTTP_STATE )
    this.m_state = stat
    if this.m_event_waitfor <> 0 and this.m_event_waitfor = stat then SetEvent( this.m_event_statechange )
end sub

function CLionetHttp.open( url as string, method as string, async as integer, timeout as integer ) as integer
    'HTTP Only
    if lcase( left( url, 7 ) ) <> "http://" then return -1
    this.m_async = async
    this.m_timeout = timeout
    dim as string url_host, url_temp
    'String after "http://"
    url_temp = mid( url, 8 )
    'Fix the URL from "http://www.example.org" to "http://www.example.org/"
    if instr( url_temp, "/" ) = 0 then url_temp += "/"
    'String before "/", such as "www.example.org", "name:pswd@subdomain.example.com:80", etc.
    url_host = left( url_temp, instr( url_temp, "/" ) - 1 )
    'If it requests by an authentication.
    if instr( url_host, "@" ) then
        this.m_auth = base64_encode( left( url_host, instr( url_host, "@" ) - 1 ) )
        url_host = mid( url_host, instr( url_host, "@" ) + 1 )
    else
        this.m_auth = ""
    endif
    'If it requests by another port.
    if instr( url_host, ":" ) then
        this.m_port = valint( mid( url_host, instr( url_host, ":" ) + 1 ) )
        url_host = left( url_host, instr( url_host, ":" ) - 1 )
    else
        this.m_port = 80
    endif
    'Host
    this.m_host = url_host
    'URL: after "/" and including "/"
    this.m_url = mid( url_temp, instr( url_temp, "/" ) )
    'GET or POST
    this.m_method = ucase( method )
    'Construct the header --- except for "Content-Length" and "Content-Type"
    this.m_header = this.m_method & " " & this.m_url & " HTTP/1.1" & NEWLINE
    if this.m_port <> 80 then
        this.m_header+= "Host: " & this.m_host & ":" & this.m_port & NEWLINE
    else
        this.m_header+= "Host: " & this.m_host & NEWLINE
    endif
    
    this.m_header+= "Connection: keep-alive" & NEWLINE
    this.m_header+= "Accept: */*" & NEWLINE
    'Create a socket (Class CLionet)
    this.m_socket->connect( this.m_host, this.m_port )
    this.m_state = CLHS_CONNECTING
    if this.m_async = 0 then
        WaitForState( CLHS_CONNECTED, this.m_timeout )
    endif
    return 0
end function

function CLionetHttp.send( body as string, mime_type as string ) as integer
    if len(body) <> 0 then
        this.setRequestHeader( "Content-Type", mime_type )
        this.setRequestHeader( "Content-Length", str( len( body ) ) )
    endif
    this.m_header+= NEWLINE
    dim as string buffer = this.m_header & body
    print buffer
    
    this.m_recv_header_state = HEAD_NOTCOMPLETE
    this.m_recv_length = 0
    this.m_responseHeader = ""
    this.m_socket->send( strptr(buffer), len(buffer) )
    this.m_state = CLHS_SENDING
    if this.m_async = 0 then
        WaitForState( CLHS_COMPLETED, this.m_timeout )
    endif
    return 0
end function

sub CLionetHttp.parseResponseHeader()
    EnterCriticalSection( @this.m_header_critical )
        this.m_responseHeader = space( this.m_recv_header_length )
        CopyMemory( strptr( this.m_responseHeader ), this.m_recv_header, this.m_recv_header_length )
        deallocate(this.m_recv_header)
        this.m_recv_header_length = 0
        if this.getResponseHeader( "Content-Length" ) <> "" then
            this.m_recv_expected_length = valint( this.getResponseHeader( "Content-Length" ) )
        elseif lcase( this.getResponseHeader( "Transfer-Encoding" ) ) = "chunked" then
            WHAT_THE_HELL("I hate the chunked-mode.")
        else
            WHAT_THE_HELL("OMG! What's that?")
        endif
    LeaveCriticalSection( @this.m_header_critical )
end sub

sub CLionetHttp.removeRequestHeader( key as string )
    if instr( this.m_header, NEWLINE & key ) = 0 then exit sub
    dim as integer k_posA = instr( this.m_header, NEWLINE & key ) + ( len( NEWLINE ) - 1 )
    dim as integer k_posB = instr( k_posA, this.m_header, NEWLINE ) + ( len( NEWLINE ) - 1 )
    dim as string A_block = left( this.m_header, k_posA )
    dim as string B_block = mid( this.m_header, k_posB + 1 )
    this.m_header = A_block & B_block
end sub

sub CLionetHttp.setRequestHeader( key as string, value as string )
    this.removeRequestHeader( key )
    this.m_header+= key & ": " & value & NEWLINE
end sub

function CLionetHttp.getResponseHeader( key as string ) as string
    dim as integer k_posA = instr( this.m_responseHeader, NEWLINE & key ) + len( NEWLINE & key )
                   k_posA = instr( k_posA, this.m_responseHeader, ":" ) + 1
    dim as integer k_posB = instr( k_posA, this.m_responseHeader, NEWLINE )
    return trim( mid( this.m_responseHeader, k_posA + 1, k_posB - k_posA ) )
end function

property CLionetHttp.state() as CLIONETHTTP_STATE
    return this.m_state
end property

property CLionetHttp.responseRAWHeader() as string
    return this.m_responseHeader
end property

property CLionetHttp.responseNumber() as integer
    dim as integer posA = instr( this.m_responseHeader, " " )
    dim as integer posB = instr( posA + 1, this.m_responseHeader, " " )
    return valint( mid( this.m_responseHeader, posA + 1, posB - posA - 1 ) )
end property

property CLionetHttp.responseDescription() as string
    dim as integer posA = instr( this.m_responseHeader, " " )
                   posA = instr( posA + 1, this.m_responseHeader, " " )
    dim as integer posB = instr( posA + 1, this.m_responseHeader, NEWLINE )
    return mid( this.m_responseHeader, posA + 1, posB - posA - 1 )
end property

property CLionetHttp.responseString() as string
    EnterCriticalSection( @this.m_buffer_critical )
        dim as string l_responseContent = space( this.m_recv_length )
        CopyMemory( strptr( l_responseContent ), this.m_recv_buffer, this.m_recv_length )
    LeaveCriticalSection( @this.m_buffer_critical )
    return l_responseContent
end property

property CLionetHttp.responseBytes() as byte ptr
    return this.m_recv_buffer
end property

property CLionetHttp.responseLength() as integer
    return this.m_recv_length
end property

private function base64_encode( src as const string ) as string
#define E0(v1) ((v1) shr 2)
#define E1(v1,v2) ((((v1) and 3) shl 4) + ((v2) shr 4))
#define E2(v2,v3) ((((v2) and &h0F) shl 2) + ((v3) shr 6))
#define E3(v3) ((v3) and &h3F)
    static as string B64
    B64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    dim as integer l = len(src), k = 0, j = 0
    dim as string t = ""
    if l = 0 then return t
    t = string( ((l+2)\3)*4,"=" )
    for j = 0 to l - ((l mod 3)+1) step 3
        t[k+0]=B64[e0(src[j+0])]
        t[k+1]=B64[e1(src[j+0],src[j+1])]
        t[k+2]=B64[e2(src[j+1],src[j+2])]
        t[k+3]=B64[e3(src[j+2])]:k+=4
    next
    if (l mod 3) = 2 then
        t[k+0]=B64[e0(src[j+0])]
        t[k+1]=B64[e1(src[j+0],src[j+1])]
        t[k+2]=B64[e2(src[j+1],src[j+2])]
        t[k+3]=61
    elseif (l mod 3) = 1 then
        t[k+0]=B64[e0(src[j+0])]
        t[k+1]=B64[e1(src[j+0],src[j+1])]
        t[k+2]=61
        t[k+3]=61
    endif
    return t
#undef E0
#undef E1
#undef E2
#undef E3
end function
private function base64_decode( src as const string ) as string
    static _decode_tbl(255) as uinteger => { _
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, _              ' 0..31
    0,0,0,0,0,0,0,0,0,0,0, _                                                        ' 32..42
    62,0,0,0,63, _                                                                  ' 43 (+), 44..46, 47 (/)
    52,53,54,55,56,57,58,59,60,61, _                                                ' 48..57 (0..9)
    0,0,0,0,0,0,0, _                                                                ' 58..64
    0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25, _          ' 65..90 (A..Z)
    0,0,0,0,0,0, _                                                                  ' 91..96
    26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,_ ' 97..122 (a..z)
    0,0,0,0,0 }                                                                     ' 123..127
    dim as zstring ptr source = strptr( src )
    dim as integer source_length = len( src )
    dim as integer dest_length
    if source = 0 or source_length = 0 then return ""
    dest_length = (source_length \ 4) * 3
    if source_length mod 4 = 3 then : dest_length += 2
    elseif source_length mod 4 = 2 then : dest_length += 1
    endif
    dim as string dst = space( dest_length + 1 )
    dim as zstring ptr dest = strptr( dst )
    for src_ctr as integer = 0 to source_length \ 4 -1
        dim as uinteger buf = (_decode_tbl(source[0]) shl 18) or _
              (_decode_tbl(source[1]) shl 12) or _
              (_decode_tbl(source[2]) shl  6) or _
              (_decode_tbl(source[3]))
        dest[0] = buf shr 16
        dest[1] = (buf shr 8) and &hFF
        dest[2] = buf and &hFF
        source += 4
        dest += 3
    next
    return dst
end function
