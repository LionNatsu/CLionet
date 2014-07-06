#include "CLionet.bi"

#include once "windows.bi"
#include once "inc/winsock2.bi"

constructor CLionet()
    this._open()
end constructor

destructor CLionet()
    this._close( 0 )
end destructor

function CLionet._startup() as integer
    dim as WSADATA wsadata
    return WSAStartup( &h0202, @wsadata )
end function

function CLionet._cleanup() as integer
    return WSACleanup()
end function

function CLionet._accept( scklistener as SOCKET ) as integer
    this._close( 0 )
    this.m_socket = accept( scklistener, 0, 0 )
    return this.m_socket
end function

function CLionet._listen() as integer
    return listen( this.m_socket, 5 )
end function

function CLionet._bind( port as ushort ) as integer
    return this._bind( INADDR_ANY, port )
end function

function CLionet._bind( addr as string, port as ushort ) as integer
    return this._bind( inet_addr( addr ), port )
end function

function CLionet._bind( addr as uinteger, port as ushort ) as integer
    dim as sockaddr_in serveraddr
    with serveraddr
        .sin_family = AF_INET
        .sin_addr.S_addr = addr
        .sin_port = htons( port )
    end with
    return this._bind( cast( sockaddr ptr, @serveraddr ) )
end function

function CLionet._bind( lpName as sockaddr ptr ) as integer
    return bind( this.m_socket, lpName, sizeof(sockaddr_in) )
end function

function CLionet._connect( addr as string, port as ushort ) as integer
    return this._connect( inet_addr( addr ), port )
end function

function CLionet._connect( addr as uinteger, port as ushort ) as integer
    dim as sockaddr_in serveraddr
    with serveraddr
        .sin_family = AF_INET
        .sin_addr.S_addr = addr
        .sin_port = htons( port )
    end with
    return this._connect( cast( sockaddr ptr, @serveraddr ) )
end function

function CLionet._connect( lpName as sockaddr ptr ) as integer
    return connect( this.m_socket, lpName, sizeof(sockaddr_in) )
end function

function CLionet._send( in_buf as any ptr, length as integer ) as integer
    return send( this.m_socket, in_buf, length, 0 )
end function

function CLionet._recv( out_buf as any ptr, length as integer, f_peek as integer ) as integer
    dim as integer flag
    if f_peek then flag = MSG_PEEK
    return recv( this.m_socket, out_buf, length, flag )
end function

function CLionet._open() as integer
    this.m_socket = socket_( AF_INET, SOCK_STREAM, IPPROTO_TCP )
    return this.m_socket
end function

function CLionet._close( f_reopen as integer = 1 ) as integer
    dim as integer retval = closesocket( this.m_socket )
    if f_reopen then
        this._open()
    endif
    return retval
end function

property CLionet._getSocket() as SOCKET
    return this.m_socket
end property