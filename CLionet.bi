#include once "windows.bi"
#include once "win/winsock2.bi"

#ifndef __CLIONET_BI__
#define __CLIONET_BI__

type CLionet extends object
    
  public:
  
    declare constructor()
    declare virtual destructor
    
    declare static function _startup() as integer
    declare static function _cleanup() as integer
    
    declare virtual function _connect( addr as string, port as ushort ) as integer
    declare virtual function _connect( addr as uinteger, length as u_short ) as integer
    declare virtual function _connect( lpName as sockaddr ptr, length as integer ) as integer
    declare virtual function _send( in_buf as any ptr, length as integer ) as integer
    declare virtual function _recv( out_buf as any ptr, length as integer, is_peeking as integer = 0 ) as integer
    
    declare property getSocket() as SOCKET
    
  protected:
  
    m_socket as SOCKET
    
end type

#endif