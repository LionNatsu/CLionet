#include "CLionet.bi"

#include once "windows.bi"
#include once "new_inc/winsock2.bi"

constructor CLionet()
    this.opensocket()
end constructor

destructor CLionet()
    this.closesocket()
end destructor

function CLionet.startup() as integer
    dim as WSADATA wsadata
    return WSAStartup_( &h0202, @wsadata )
end function

function CLionet.cleanup() as integer
    return WSACleanup_()
end function

function CLionet.error() as integer
    return WSAGetLastError_()
end function

#ifdef UNICODE
function CLionet.error_string() as wstring ptr
	static message as wstring * (1024 + 1)
	dim dwFlags as uinteger = FORMAT_MESSAGE_FROM_SYSTEM or FORMAT_MESSAGE_IGNORE_INSERTS or FORMAT_MESSAGE_MAX_WIDTH_MASK
	dim dwLanguageId as uinteger = MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT)
	FormatMessage(dwFlags, NULL, CLionet.error(), dwLanguageId, @message, 1024, NULL)
	return @message
end function
#else
function CLionet.error_string() as zstring ptr
	static message as zstring * (1024 + 1)
	dim dwFlags as uinteger = FORMAT_MESSAGE_FROM_SYSTEM or FORMAT_MESSAGE_IGNORE_INSERTS or FORMAT_MESSAGE_MAX_WIDTH_MASK
	dim dwLanguageId as uinteger = MAKELANGID( LANG_NEUTRAL, SUBLANG_DEFAULT )
	FormatMessage( dwFlags, NULL, CLionet.error(), dwLanguageId, @message, 1024, NULL )
	return @message
end function
#endif

function CLionet.accept() as integer
    dim newsocket as SOCKET
    newsocket = accept_( this.m_socket, null, null )
    this.closesocket()
    this.m_socket = newsocket
    return this.m_socket
end function

function CLionet.accept( scklistener as CLionet ptr ) as integer
    this.closesocket()
    this.m_socket = accept_( scklistener->thesocket, null, null )
    return this.m_socket
end function

function CLionet.accept( scklistener as SOCKET ) as integer
    
    this.closesocket()
    this.m_socket = accept_( scklistener, null, null )
    return this.m_socket
end function

function CLionet.listen( port as ushort ) as integer
    if this.bind( INADDR_ANY, port ) = SOCKET_ERROR then return 0
    return this.listen()
end function

function CLionet.listen( addr as string, port as ushort ) as integer
    if this.bind( addr, port ) = SOCKET_ERROR then return 0
    return this.listen()
end function

function CLionet.listen( addr as uinteger, port as ushort ) as integer
    if this.bind( addr, port ) = SOCKET_ERROR then return 0
    return this.listen()
end function

function CLionet.listen() as integer
    return listen_( this.m_socket, 5 )
end function

function CLionet.bind( port as ushort ) as integer
    return this.bind( INADDR_ANY, port )
end function

function CLionet.bind( addr as string, port as ushort ) as integer
    return this.bind( inet_addr_( addr ), port )
end function

function CLionet.bind( addr as uinteger, port as ushort ) as integer
    dim as sockaddr_in serveraddr
    with serveraddr
        .sin_family = AF_INET
        .sin_addr.S_addr = addr
        .sin_port = htons_( port )
    end with
    return this.bind( cast( sockaddr ptr, @serveraddr ) )
end function

function CLionet.bind( lpName as any ptr ) as integer
    return bind_( this.m_socket, lpName, sizeof( sockaddr_in ) )
end function

function CLionet.connect( addr as string, port as ushort ) as integer
    return this.connect( inet_addr_( addr ), port )
end function

function CLionet.connect( addr as uinteger, port as ushort ) as integer
    dim as sockaddr_in serveraddr
    with serveraddr
        .sin_family = AF_INET
        .sin_addr.S_addr = addr
        .sin_port = htons_( port )
    end with
    return this.connect( cast( sockaddr ptr, @serveraddr ) )
end function

function CLionet.connect( lpName as any ptr ) as integer
    return connect_( this.m_socket, lpName, sizeof( sockaddr_in ) )
end function

function CLionet.send( in_buf as any ptr, length as integer ) as integer
    return send_( this.m_socket, in_buf, length, 0 )
end function

function CLionet.recv( out_buf as any ptr, length as integer, f_peek as integer ) as integer
    dim as integer flag
    if f_peek then flag = MSG_PEEK
    return recv_( this.m_socket, out_buf, length, flag )
end function

function CLionet.opensocket() as integer
    if this.m_socket then if this.closesocket() = 0 then return SOCKET_ERROR
    this.m_socket = socket_( AF_INET, SOCK_STREAM, IPPROTO_TCP )
    return this.m_socket
end function

function CLionet.closesocket() as integer
    return closesocket_( this.m_socket )
end function

property CLionet.thesocket() as SOCKET
    return this.m_socket
end property

property CLionet.remoteip() as zstring ptr
    dim remoteAddr as sockaddr_in, i as integer = sizeof( sockaddr_in )
    getpeername_( this.m_socket, cast( sockaddr ptr, @remoteAddr ), @i )
    return inet_ntoa_(remoteAddr.sin_addr)
end property

property CLionet.remoteport() as ushort
    dim remoteAddr as sockaddr_in, i as integer = sizeof( sockaddr_in )
    getpeername_( this.m_socket, cast( sockaddr ptr, @remoteAddr ), @i )
    return ntohs_(remoteAddr.sin_port)
end property

property CLionet.localip() as zstring ptr
    dim localAddr as sockaddr_in, i as integer = sizeof( sockaddr_in )
    getsockname_( this.m_socket, cast( sockaddr ptr, @localAddr ), @i )
    return inet_ntoa_(localAddr.sin_addr)
end property

property CLionet.localport() as ushort
    dim localAddr as sockaddr_in, i as integer = sizeof( sockaddr_in )
    getsockname_( this.m_socket, cast( sockaddr ptr, @localAddr ), @i )
    return ntohs_( localAddr.sin_port )
end property