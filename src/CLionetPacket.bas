#include "CLionetHttp.bi"
#define NEWLINE !"\r\n"

#ifdef __DEBUG__
    #define WHAT_THE_HELL(x) print "[FATAL ERROR] in " & __FILE__ & " (" & __FUNCTION__ & ") line " & __LINE__ & " : " & x :sleep: ExitProcess( -1 )
    #define DEBUG_PRINT(x) print "[DEBUG] in " & __FILE__ & " (" & __FUNCTION__ & ") line " & __LINE__ & " : " & NEWLINE & x
    #define HERE_I_AM print "[MILESTONE] in " & __FILE__ & " (" & __FUNCTION__ & ") line " & __LINE__
#else
    #define WHAT_THE_HELL(x) sleep:ExitProcess( -1 )
    #define DEBUG_PRINT(x)
    #define HERE_I_AM
#endif

#include "base64.bi"

enum RECV_STATE
    HEAD_NOTCOMPLETE
    HEAD_COMPLETED
end enum

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
    EnterCriticalSection( @this.m_header_critical )
    EnterCriticalSection( @this.m_buffer_critical )
    deallocate( this.m_4k_buffer )
    deallocate( this.m_recv_header )
    deallocate( this.m_recv_buffer )
    deallocate( this.m_recv_chunk )
    this.m_4k_buffer = 0
    this.m_recv_header = 0
    this.m_recv_buffer = 0
    this.m_recv_chunk = 0
    LeaveCriticalSection( @this.m_buffer_critical )
    LeaveCriticalSection( @this.m_header_critical )
    CloseHandle( this.m_event_statechange )
    DeleteCriticalSection( @this.m_header_critical )
    DeleteCriticalSection( @this.m_buffer_critical )
end destructor

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
            if boku->m_state = CLHS_COMPLETED then WHAT_THE_HELL( "WHAT? MADAKA?" )
            boku->SetState( CLHS_RECEIVING )
            dim as byte ptr _4kbuffer = boku->m_4k_buffer
            dim as integer _size = boku->m_socket->recv( _4kbuffer, 4096 )
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
                    'set the flag
                    boku->m_recv_header_state = HEAD_COMPLETED
                    boku->parseResponseHeader()
                    'content
                    if boku->m_chunked then
                        boku->m_recv_chunk = reallocate( boku->m_recv_chunk, _size - header_ending_pos )
                        CopyMemory( boku->m_recv_chunk, @_4kbuffer[header_ending_pos], _size - header_ending_pos )
                        boku->m_recv_chunk_length = _size - header_ending_pos
                        if boku->parseChunk() = 0 then boku->SetState( CLHS_COMPLETED )
                    else
                        EnterCriticalSection( @boku->m_buffer_critical )
                            boku->m_recv_buffer = reallocate( boku->m_recv_buffer, _size - header_ending_pos )
                            CopyMemory( boku->m_recv_buffer, @_4kbuffer[header_ending_pos], _size - header_ending_pos )
                            boku->m_recv_length = _size - header_ending_pos
                        LeaveCriticalSection( @boku->m_buffer_critical )
                        if boku->m_recv_length = boku->m_recv_expected_length then boku->SetState( CLHS_COMPLETED )
                        if boku->m_recv_length > boku->m_recv_expected_length then WHAT_THE_HELL( "RECEIVED A LARGER PACKET" )
                    endif
                    'process completed.
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
                if boku->m_chunked then
                    boku->m_recv_chunk = reallocate( boku->m_recv_chunk, boku->m_recv_chunk_length + _size )
                    CopyMemory( @boku->m_recv_chunk[ boku->m_recv_chunk_length ], _4kbuffer, _size )
                    boku->m_recv_chunk_length += _size
                    if boku->parseChunk() = 0 then boku->SetState( CLHS_COMPLETED )
                else
                    EnterCriticalSection( @boku->m_buffer_critical )
                        boku->m_recv_buffer = reallocate( boku->m_recv_buffer, boku->m_recv_length + _size )
                        CopyMemory( @boku->m_recv_buffer[ boku->m_recv_length ], _4kbuffer, _size )
                        boku->m_recv_length += _size
                    LeaveCriticalSection( @boku->m_buffer_critical )
                    if boku->m_recv_length = boku->m_recv_expected_length then boku->SetState( CLHS_COMPLETED )
                    if boku->m_recv_length > boku->m_recv_expected_length then WHAT_THE_HELL( "RECEIVED A LARGER PACKET" )
                endif
            endif
    end select
end sub

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
    
    if this.m_auth <> "" then
        this.m_header+= "Authorization: Basic " & this.m_auth & NEWLINE
    endif
    
    this.m_header+= "Connection: close" & NEWLINE
    this.m_header+= "Accept: */*" & NEWLINE
    'Create a socket (Class CLionet)
    
    this.m_socket->closesocket()
    this.m_socket->opensocket()
    this.m_socket->connect( this.m_host, this.m_port )
    '
    EnterCriticalSection( @this.m_header_critical )
    EnterCriticalSection( @this.m_buffer_critical )
    deallocate( this.m_recv_header )
    deallocate( this.m_recv_buffer )
    deallocate( this.m_recv_chunk )
    this.m_recv_header = 0
    this.m_recv_buffer = 0
    this.m_recv_chunk = 0
    this.m_recv_header_length = 0
    this.m_recv_length = 0
    this.m_recv_chunk_length = 0
    LeaveCriticalSection( @this.m_buffer_critical )
    LeaveCriticalSection( @this.m_header_critical )
    this.m_recv_header_state = HEAD_NOTCOMPLETE
    this.m_responseHeader = ""
    
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
        deallocate( this.m_recv_header )
        this.m_recv_header = 0
        this.m_recv_header_length = 0
        if this.getResponseHeader( "Content-Length" ) <> "" then
            this.m_recv_expected_length = valint( this.getResponseHeader( "Content-Length" ) )
            this.m_chunked = 0
        elseif lcase( this.getResponseHeader( "Transfer-Encoding" ) ) = "chunked" then
            this.m_chunked = -1
        else
            WHAT_THE_HELL("OMG! What's that?")
        endif
    LeaveCriticalSection( @this.m_header_critical )
end sub

function CLionetHttp._parseChunk() as integer
        dim as string l_chunk_str = left( *cast(zstring ptr, this.m_recv_chunk), this.m_recv_chunk_length )
        dim as integer posA = instr( l_chunk_str, NEWLINE )
        if posA = 0 then return -1
        dim as integer l_recv_chunk_expected_length = valint( "&h" & left( l_chunk_str, posA - 1 ) )
        if l_recv_chunk_expected_length = 0 then deallocate( this.m_recv_chunk ) : this.m_recv_chunk = 0 : return 0
        dim as integer posB = posA + ( len( NEWLINE ) - 1 ) + l_recv_chunk_expected_length + len( NEWLINE )
        if this.m_recv_chunk_length >= posB then
            'print l_chunk_str
            EnterCriticalSection( @this.m_buffer_critical )
                this.m_recv_buffer = reallocate( this.m_recv_buffer, this.m_recv_length + l_recv_chunk_expected_length  )
                CopyMemory( @this.m_recv_buffer[ this.m_recv_length ], @this.m_recv_chunk[ posA + ( len( NEWLINE ) - 1 ) ], l_recv_chunk_expected_length )
                this.m_recv_length += l_recv_chunk_expected_length
            LeaveCriticalSection( @this.m_buffer_critical )
            this.m_recv_chunk_length = this.m_recv_chunk_length - posB
            CopyMemory( this.m_recv_chunk, @this.m_recv_chunk[ posB ], this.m_recv_chunk_length )
            this.m_recv_chunk = reallocate( this.m_recv_chunk, this.m_recv_chunk_length )
            return l_recv_chunk_expected_length
        endif
        return -1
end function

function CLionetHttp.parseChunk() as integer
    dim as integer ret
    do
        ret = this._parseChunk()
    loop until ret <= 0
    return ret
end function

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
    dim as integer k_posA = instr( this.m_responseHeader, NEWLINE & key )
    if k_posA = 0 then return ""
                   k_posA = instr( k_posA + len( NEWLINE & key ), this.m_responseHeader, ":" ) + 1
    dim as integer k_posB = instr( k_posA, this.m_responseHeader, NEWLINE )
    return trim( mid( this.m_responseHeader, k_posA + 1, k_posB - k_posA - 1 ) )
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
