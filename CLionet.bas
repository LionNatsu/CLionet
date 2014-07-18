#include "CLionet.bi"

#include once "windows.bi"
#include once "win/winsock2.bi"
#undef opensocket

constructor CLionet()
    this.opensocket()
end constructor

destructor CLionet()
    this.closesocket()
end destructor

function CLionet.startup() as integer
    dim as WSADATA wsadata
    return .WSAStartup( &h0202, @wsadata )
end function

function CLionet.cleanup() as integer
    return .WSACleanup()
end function

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

function CLionet.eventThread( boku as CLionet ptr ) as integer
        print "thread"
    dim as WSANETWORKEVENTS event_info
    do
        if boku->flag_thread = 2 then boku->flag_thread = 0 : exit do
        if WSAWaitForMultipleEvents( 1, @boku->m_event, -1, 1000, -1 ) = WSA_WAIT_TIMEOUT then continue do
        WSAEnumNetworkEvents( boku->m_socket, boku->m_event, @event_info )
        #macro ROUTER( fnc, evtmsk, bitmsk )
        if ( event_info.lNetworkEvents and evtmsk ) <> 0 then
            if boku->onSocket <> 0 then
                boku->onSocket( boku, evtmsk, event_info.iErrorCode( bitmsk ) )
            elseif boku->fnc <> 0 then
                boku->fnc( boku, event_info.iErrorCode( bitmsk ) )
            endif
        endif
        #endmacro
        ROUTER (onAccept,FD_ACCEPT,FD_ACCEPT_BIT)
        ROUTER (onConnect,FD_CONNECT,FD_CONNECT_BIT)
        ROUTER (onRead,FD_READ,FD_READ_BIT)
        ROUTER (onWrite,FD_WRITE,FD_WRITE_BIT)
        ROUTER (onClose,FD_CLOSE,FD_CLOSE_BIT)
        #undef ROUTER
        sleep_ 0
    loop
    return 0
end function

function CLionet.accept() as integer
    dim newsocket as SOCKET
    this.detachEvent()
    newsocket = .accept( this.m_socket, null, null )
    this.closesocket()
    this.m_socket = newsocket
    this.attachEvent()
    return this.m_socket
end function

function CLionet.accept( scklistener as CLionet ptr ) as integer
    return this.accept( scklistener->thesocket )
end function

function CLionet.accept( scklistener as SOCKET ) as integer
    this.detachEvent()
    this.closesocket()
    this.m_socket = .accept( scklistener, null, null )
    this.attachEvent()
    return this.m_socket
end function

function CLionet.listen( port as ushort ) as integer
    if this.bind( INADDR_ANY, port ) = SOCKET_ERROR then return SOCKET_ERROR
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
    return .listen( this.m_socket, 5 )
end function

function CLionet.bind( port as ushort ) as integer
    return this.bind( INADDR_ANY, port )
end function

function CLionet.bind( addr as string, port as ushort ) as integer
    return this.bind( .inet_addr( addr ), port )
end function

function CLionet.bind( addr as uinteger, port as ushort ) as integer
    dim as sockaddr_in serveraddr
    with serveraddr
        .sin_family = AF_INET
        .sin_addr.S_addr = addr
    end with
        serveraddr.sin_port = .htons( port )
    return this.bind( cast( sockaddr ptr, @serveraddr ) )
end function

function CLionet.bind( lpName as any ptr ) as integer
    return .bind( this.m_socket, lpName, sizeof( sockaddr_in ) )
end function

function CLionet.connect( addr as string, port as ushort ) as integer
    return this.connect( .inet_addr( addr ), port )
end function

function CLionet.connect( addr as uinteger, port as ushort ) as integer
    dim as sockaddr_in serveraddr
    with serveraddr
        .sin_family = AF_INET
        .sin_addr.S_addr = addr
    end with
        serveraddr.sin_port = .htons( port )
    return this.connect( cast( sockaddr ptr, @serveraddr ) )
end function

function CLionet.connect( lpName as any ptr ) as integer
    return .connect( this.m_socket, lpName, sizeof( sockaddr_in ) )
end function

function CLionet.send( in_buf as any ptr, length as integer ) as integer
    return .send( this.m_socket, in_buf, length, 0 )
end function

function CLionet.recv( out_buf as any ptr, length as integer, f_peek as integer ) as integer
    dim as integer flag
    if f_peek then flag = MSG_PEEK
    return .recv( this.m_socket, out_buf, length, flag )
end function

function CLionet.opensocket() as integer
    if this.m_socket then if this.closesocket() = 0 then return SOCKET_ERROR
    this.m_socket = .socket_( AF_INET, SOCK_STREAM, IPPROTO_TCP )
    this.attachEvent()
    return this.m_socket
end function

function CLionet.closesocket() as integer
    this.detachEvent()
    return .closesocket( this.m_socket )
end function

property CLionet.thesocket() as SOCKET
    return this.m_socket
end property

property CLionet.async( mode as CLIONET_MODE )
    if this.async_mode = mode then exit property
    select case mode
        case CLIONET_MODE.CLAM_EVENTSELECT
            if this.flag_thread <> 0 then exit property
            this.async_mode = mode
            this.m_event = WSACreateEvent()
            this.attachEvent()
            dim as integer ThreadID
            this.flag_thread = 1
            CreateThread( 0, 0, _
                cast( LPTHREAD_START_ROUTINE, procptr( CLionet.eventThread ) ), _
                @this, 0, @ThreadID )
        case CLIONET_MODE.CLAM_BLOCK
            this.async_mode = mode
            this.detachEvent()
            this.flag_thread = 2
            WSACloseEvent( this.m_event )
    end select
end property

property CLionet.async() as CLIONET_MODE
    return this.async_mode
end property

sub CLionet.exitEventThread()
    ExitThread( 0 )
end sub

sub CLionet.attachEvent()
    if this.async_mode <> CLIONET_MODE.CLAM_EVENTSELECT then exit sub
    WSAEventSelect( this.m_socket, this.m_event, FD_READ or FD_CLOSE or FD_CONNECT or FD_ACCEPT or FD_WRITE )
end sub

sub CLionet.detachEvent()
    if this.async_mode <> CLIONET_MODE.CLAM_EVENTSELECT then exit sub
    WSAEventSelect( this.m_socket, this.m_event, 0 )
end sub

property CLionet.remoteip() as zstring ptr
    dim remoteAddr as sockaddr_in, i as integer = sizeof( sockaddr_in )
    .getpeername( this.m_socket, cast( sockaddr ptr, @remoteAddr ), @i )
    return .inet_ntoa( remoteAddr.sin_addr )
end property

property CLionet.remoteport() as ushort
    dim remoteAddr as sockaddr_in, i as integer = sizeof( sockaddr_in )
    .getpeername( this.m_socket, cast( sockaddr ptr, @remoteAddr ), @i )
    return .ntohs( remoteAddr.sin_port )
end property

property CLionet.localip() as zstring ptr
    dim localAddr as sockaddr_in, i as integer = sizeof( sockaddr_in )
    .getsockname( this.m_socket, cast( sockaddr ptr, @localAddr ), @i )
    return .inet_ntoa( localAddr.sin_addr )
end property

property CLionet.localport() as ushort
    dim localAddr as sockaddr_in, i as integer = sizeof( sockaddr_in )
    .getsockname( this.m_socket, cast( sockaddr ptr, @localAddr ), @i )
    return .ntohs( localAddr.sin_port )
end property
