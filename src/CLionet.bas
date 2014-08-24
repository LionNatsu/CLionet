#include "../inc/CLionet.bi"

#include once "windows.bi"
#include once "win/winsock2.bi"
#undef opensocket

'//////////////////   {con|de}structor   //////////////////////////
constructor CLionet()
    this.startup()
    this.opensocket()
end constructor

destructor CLionet()
    this.closesocket()
    this.async = CLIONET_MODE.CLM_BLOCK
end destructor
' Start up but will not clean up (for others)

'//////////////////   WSA-Startup/Cleanup   //////////////////////////
function CLionet.startup() as integer
    dim as WSADATA wsadata
    return .WSAStartup( &h0202, @wsadata )
end function

function CLionet.cleanup() as integer
    return .WSACleanup()
end function

'//////////////////   error   //////////////////////////
function CLionet.error() as integer
    return .WSAGetLastError()
end function

#ifdef UNICODE
function CLionet.error_string() as wstring ptr
	static message as wstring * ( 1024 + 1 )
	dim dwFlags as uinteger = FORMAT_MESSAGE_FROM_SYSTEM or FORMAT_MESSAGE_IGNORE_INSERTS or FORMAT_MESSAGE_MAX_WIDTH_MASK
	dim dwLanguageId as uinteger = MAKELANGID( LANG_NEUTRAL, SUBLANG_DEFAULT )
	FormatMessage( dwFlags, 0, CLionet.error(), dwLanguageId, @message, 1024, 0 )
	return @message
end function
#else
function CLionet.error_string() as zstring ptr
	static message as zstring * ( 1024 + 1 )
	dim dwFlags as uinteger = FORMAT_MESSAGE_FROM_SYSTEM or FORMAT_MESSAGE_IGNORE_INSERTS or FORMAT_MESSAGE_MAX_WIDTH_MASK
	dim dwLanguageId as uinteger = MAKELANGID( LANG_NEUTRAL, SUBLANG_DEFAULT )
	FormatMessage( dwFlags, 0, CLionet.error(), dwLanguageId, @message, 1024, 0 )
	return @message
end function
#endif

'//////////////////   parse IP string or domain to net-long   //////////////////////////
function CLionet.parseAddress( address as string ) as uinteger
    dim as uinteger dwAddress = inet_addr( address )
    if dwAddress <> INADDR_NONE then return dwAddress
	dim as hostent ptr host = gethostbyname( address )
	if host = 0 then return 0
	return *(host->h_addr)
end function

'//////////////////   accept   //////////////////////////
'to itself
function CLionet.accept() as integer
    dim newsocket as SOCKET
    this.detachEvent()
    newsocket = .accept( this.m_socket, null, null )
    this.closesocket()
    this.m_socket = newsocket
    this.attachEvent()
    return this.m_socket
end function

'from class CLionet
function CLionet.accept( scklistener as CLionet ptr ) as integer
    return this.accept( scklistener->thesocket )
end function

'from native socket
function CLionet.accept( scklistener as SOCKET ) as integer
    this.detachEvent()
    this.closesocket()
    this.m_socket = .accept( scklistener, null, null )
    this.attachEvent()
    return this.m_socket
end function

'//////////////////   listen   //////////////////////////
function CLionet.listen( port as ushort ) as integer
    if this.bind( port ) = SOCKET_ERROR then return SOCKET_ERROR
    return this.listen()
end function

function CLionet.listen( addr as string, port as ushort ) as integer
    if this.bind( addr, port ) = SOCKET_ERROR then return SOCKET_ERROR
    return this.listen()
end function

function CLionet.listen( addr as uinteger, port as ushort ) as integer
    if this.bind( addr, port ) = SOCKET_ERROR then return SOCKET_ERROR
    return this.listen()
end function

function CLionet.listen() as integer
    return .listen( this.m_socket, SOMAXCONN )
end function

'//////////////////   bind   //////////////////////////
function CLionet.bind( port as ushort ) as integer
    return this.bind( htonl(INADDR_ANY), port )
end function

function CLionet.bind( addr as string, port as ushort ) as integer
    return this.bind( CLionet.parseAddress( addr ), port )
end function

function CLionet.bind( addr as uinteger, port as ushort ) as integer
    dim as sockaddr_in serveraddr
    with serveraddr
        .sin_family = AF_INET
        .sin_addr.S_addr = addr
        .sin_port = htons( port )
    end with
    return this.bind( cast( sockaddr ptr, @serveraddr ) )
end function

function CLionet.bind( lpName as any ptr ) as integer
    return .bind( this.m_socket, lpName, sizeof( sockaddr_in ) )
end function

'//////////////////   connect   //////////////////////////
function CLionet.connect( addr as string, port as ushort ) as integer
    return this.connect( CLionet.parseAddress( addr ), port )
end function

function CLionet.connect( addr as uinteger, port as ushort ) as integer
    dim as sockaddr_in serveraddr
    with serveraddr
        .sin_family = AF_INET
        .sin_addr.S_addr = addr
        .sin_port = htons( port )
    end with
    return this.connect( cast( sockaddr ptr, @serveraddr ) )
end function

function CLionet.connect( lpName as any ptr ) as integer
    return .connect( this.m_socket, lpName, sizeof( sockaddr_in ) )
end function

'//////////////////   Sending and Receiving   //////////////////////////

function CLionet.send( in_buf as any ptr, length as integer ) as integer
    return .send( this.m_socket, in_buf, length, 0 )
end function

function CLionet.recv( out_buf as any ptr, length as integer, f_peek as integer ) as integer
    dim as integer flag
    if f_peek then flag = MSG_PEEK
    return .recv( this.m_socket, out_buf, length, flag )
end function

function CLionet.sendto( in_buf as any ptr, length as integer, addr as string, port as ushort ) as integer
    dim as sockaddr_in serveraddr
    with serveraddr
        .sin_family = AF_INET
        .sin_addr.S_addr = CLionet.parseAddress( addr )
        .sin_port = htons( port )
    end with
    return .sendto( this.m_socket, in_buf, length, 0, cast( sockaddr ptr, @serveraddr ), sizeof( sockaddr_in ) )
end function

function CLionet.sendto( in_buf as any ptr, length as integer, addr as uinteger, port as ushort ) as integer
    dim as sockaddr_in serveraddr
    with serveraddr
        .sin_family = AF_INET
        .sin_addr.S_addr = addr
        .sin_port = htons( port )
    end with
    return .sendto( this.m_socket, in_buf, length, 0, cast( sockaddr ptr, @serveraddr ), sizeof( sockaddr_in ) )
end function

function CLionet.recvfrom( out_buf as any ptr, length as integer, out_addr as zstring ptr ptr ) as integer
    dim as sockaddr_in serveraddr
    dim as integer addrlen = sizeof( sockaddr_in )
    dim as integer ret = .recvfrom( this.m_socket, out_buf, length, 0, cast( sockaddr ptr, @serveraddr ), @addrlen )
    if out_addr then *out_addr = .inet_ntoa( serveraddr.sin_addr )
    return ret
end function

function CLionet.recvfrom( out_buf as any ptr, length as integer, out_addr as uinteger ptr ) as integer
    dim as sockaddr_in serveraddr
    dim as integer addrlen = sizeof( sockaddr_in )
    dim as integer ret = .recvfrom( this.m_socket, out_buf, length, 0, cast( sockaddr ptr, @serveraddr ), @addrlen )
    if out_addr then *out_addr = serveraddr.sin_addr.S_addr
    return ret
end function
'//////////////////   Creating and Closing   //////////////////////////
'TODO: shutdown(), instead for closesocket()

function CLionet.opensocket() as integer
    if this.m_socket then this.closesocket()
    this.m_socket = socket_( AF_INET, SOCK_STREAM, IPPROTO_TCP )
    this.attachEvent()
    return this.m_socket
end function

function CLionet.reopensocket() as integer
    return this.opensocket()
end function

function CLionet.udp() as integer
    if this.m_socket then this.closesocket()
    this.m_socket = socket_( AF_INET, SOCK_DGRAM, IPPROTO_UDP )
    this.attachEvent()
    return this.m_socket
end function

function CLionet.closesocket() as integer
    this.detachEvent()
    return .closesocket( this.m_socket )
end function

'return the socket.
property CLionet.thesocket() as SOCKET
    return this.m_socket
end property

'//////////////////   WSAEventSelect or Normally Blocking   //////////////////////////
function CLionet.eventThread( boku as CLionet ptr ) as integer
    #macro ROUTER_INIT_EXIT( fnc, msg )
        if boku->onSocket <> 0 then
            boku->onSocket( boku, msg, 0 )
        elseif boku->fnc <> 0 then
            boku->fnc( boku )
        endif
    #endmacro
    #macro ROUTER( fnc, evtmsk, bitmsk, msg )
        if ( event_info.lNetworkEvents and evtmsk ) <> 0 then
            if boku->onSocket <> 0 then
                boku->onSocket( boku, msg, event_info.iErrorCode( bitmsk ) )
            elseif boku->fnc <> 0 then
                boku->fnc( boku, event_info.iErrorCode( bitmsk ) )
            endif
        endif
    #endmacro
    dim as WSANETWORKEVENTS event_info
    boku->flag_thread = 1
    ROUTER_INIT_EXIT( onInit, CLE_INIT )
    do
        if WSAWaitForMultipleEvents( 1, @boku->m_event, -1, 100, -1 ) = WSA_WAIT_TIMEOUT then continue do
        if GetLastError() = 6 then
            exit do
        endif
        WSAEnumNetworkEvents( boku->m_socket, boku->m_event, @event_info )
        ROUTER( onAccept, FD_ACCEPT, FD_ACCEPT_BIT, CLIONET_EVENT.CLE_ACCEPT )
        ROUTER( onConnect, FD_CONNECT, FD_CONNECT_BIT, CLIONET_EVENT.CLE_CONNECT )
        ROUTER( onRead, FD_READ, FD_READ_BIT, CLIONET_EVENT.CLE_READ )
        ROUTER( onWrite, FD_WRITE, FD_WRITE_BIT, CLIONET_EVENT.CLE_WRITE )
        ROUTER( onClose, FD_CLOSE,FD_CLOSE_BIT, CLIONET_EVENT.CLE_CLOSE )
        sleep_ 0
    loop
    ROUTER_INIT_EXIT( onExit, CLE_EXIT )
    boku->flag_thread = 0
    return 0
    #undef ROUTER_INIT_EXIT
    #undef ROUTER
end function

property CLionet.async( mode as CLIONET_MODE )
    if this.async_mode = mode then return
    select case mode
        case CLIONET_MODE.CLM_EVENTSELECT
            if this.flag_thread <> 0 then return
            this.async_mode = mode
            this.m_event = WSACreateEvent()
            this.attachEvent()
            dim as integer ThreadID
            this.m_thread = CreateThread( 0, 0, cast( LPTHREAD_START_ROUTINE, procptr( CLionet.eventThread ) ), @this, 0, @ThreadID )
        case CLIONET_MODE.CLM_BLOCK
            this.async_mode = mode
            this.detachEvent()
            WSACloseEvent( this.m_event )
            WaitForSingleObject( this.m_thread , 1000 )
            TerminateThread( this.m_thread, -1 )
    end select
end property

property CLionet.async() as CLIONET_MODE
    return this.async_mode
end property

sub CLionet.exitEventThread()
    ExitThread( 0 )
end sub

sub CLionet.attachEvent()
    if this.async_mode <> CLIONET_MODE.CLM_EVENTSELECT then return
    WSAEventSelect( this.m_socket, this.m_event, FD_READ or FD_CLOSE or FD_CONNECT or FD_ACCEPT or FD_WRITE )
end sub

sub CLionet.detachEvent()
    if this.async_mode <> CLIONET_MODE.CLM_EVENTSELECT then return
    WSAEventSelect( this.m_socket, this.m_event, 0 )
end sub

'//////////////////   IP and Port information   //////////////////////////

property CLionet.remoteip() as string
    dim remoteAddr as sockaddr_in, i as integer = sizeof( sockaddr_in )
    .getpeername( this.m_socket, cast( sockaddr ptr, @remoteAddr ), @i )
    return *.inet_ntoa( remoteAddr.sin_addr )
end property

property CLionet.remoteport() as ushort
    dim remoteAddr as sockaddr_in, i as integer = sizeof( sockaddr_in )
    .getpeername( this.m_socket, cast( sockaddr ptr, @remoteAddr ), @i )
    return .ntohs( remoteAddr.sin_port )
end property

property CLionet.localip() as string
    dim localAddr as sockaddr_in, i as integer = sizeof( sockaddr_in )
    .getsockname( this.m_socket, cast( sockaddr ptr, @localAddr ), @i )
    return *.inet_ntoa( localAddr.sin_addr )
end property

property CLionet.localport() as ushort
    dim localAddr as sockaddr_in, i as integer = sizeof( sockaddr_in )
    .getsockname( this.m_socket, cast( sockaddr ptr, @localAddr ), @i )
    return .ntohs( localAddr.sin_port )
end property
