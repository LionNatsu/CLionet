#include "CLionet.bi"

#include once "windows.bi"
#include once "win/winsock2.bi"
#include once "win/ws2tcpip.bi"

constructor CLionet()
    this.m_socket = socket_( AF_INET, SOCK_STREAM, IPPROTO_TCP )
end constructor

destructor CLionet()
    closesocket( this.m_socket )
end destructor

function CLionet._startup() as integer
    dim as WSADATA wsadata
    return WSAStartup( &h0202, @wsadata )
end function

function CLionet._cleanup() as integer
    return WSACleanup()
end function

function CLionet._connect( addr as string, port as ushort ) as integer
    return this._connect( inet_addr( addr ), htons( port ) )
end function

function CLionet._connect( addr as uinteger, port as u_short ) as integer
    dim as sockaddr_in serveraddr
    with serveraddr
        .sin_family = AF_INET
        .sin_addr.S_addr = addr
        .sin_port = port
    end with
    return this._connect( cast( sockaddr ptr, @serveraddr ), sizeof(serveraddr) )
end function

function CLionet._connect( lpName as sockaddr ptr, length as integer ) as integer
    return connect( m_socket, lpName, length )
end function

function CLionet._send( in_buf as any ptr, length as integer ) as integer
    return send( m_socket, in_buf, length, 0 )
end function

function CLionet._recv( out_buf as any ptr, length as integer, is_peeking as integer ) as integer
    dim as integer flag
    if is_peeking then flag = MSG_PEEK
    return recv( m_socket, out_buf, length, flag )
end function