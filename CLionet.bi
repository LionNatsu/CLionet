#include once "windows.bi"
#include once "win/winsock2.bi"

#ifndef __CLIONET_BI__
#define __CLIONET_BI__

enum CLIONET_ASYNC_MODE
    CLAM_SYNC
    CLAM_ASYNC_NORMAL
    CLAM_ASYNC_EVENT
    CLAM_ASYNC_WINDOW
end enum


type CLionet extends object

  public:

    declare constructor()
    declare virtual destructor()

    declare static function _startup() as integer
    declare static function _cleanup() as integer

    declare virtual function _open() as integer
    declare virtual function _close( f_reopen as integer = 1 ) as integer
    
    declare virtual function _connect( addr as string, port as ushort ) as integer
    declare virtual function _connect( addr as uinteger, port as ushort ) as integer
    
    declare virtual function _listen( port as ushort ) as integer
    declare virtual function _listen( addr as string, port as ushort ) as integer
    declare virtual function _listen( addr as uinteger, port as ushort ) as integer
    declare virtual function _accept( scklistener as SOCKET ) as integer
    
    declare virtual function _send( in_buf as any ptr, length as integer ) as integer
    declare virtual function _recv( out_buf as any ptr, length as integer, f_peek as integer = 0 ) as integer


    declare property _getSocket() as SOCKET
    declare property _asynMode( mode as CLIONET_ASYNC_MODE )

  protected:
    declare virtual function _connect( lpName as sockaddr ptr ) as integer
    declare virtual function _bind( port as ushort ) as integer
    declare virtual function _bind( addr as string, port as ushort ) as integer
    declare virtual function _bind( addr as uinteger, port as ushort ) as integer
    declare virtual function _bind( lpName as sockaddr ptr ) as integer
    declare virtual function _listen() as integer

    m_socket as SOCKET

end type

#endif