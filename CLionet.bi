#ifndef __CLIONET_BI__
#define __CLIONET_BI__
#include once "windows.bi"
#include once "win/winsock2.bi"
#undef opensocket

enum CLIONET_MODE
    CLAM_BLOCK
    CLAM_EVENTSELECT
end enum
type CLionet extends object
  public:
    declare constructor()
    declare virtual destructor()
    declare static  function startup() as integer
    declare static  function cleanup() as integer
    declare static  function error() as integer
#ifdef UNICODE
    declare static  function error_string() as wstring ptr
#else
    declare static  function error_string() as zstring ptr
#endif
    declare virtual function opensocket() as integer
    declare virtual function closesocket() as integer
    declare virtual function connect( addr as string, port as ushort ) as integer
    declare virtual function connect( addr as uinteger, port as ushort ) as integer
    declare virtual function bind( port as ushort ) as integer
    declare virtual function bind( addr as string, port as ushort ) as integer
    declare virtual function bind( addr as uinteger, port as ushort ) as integer
    declare virtual function listen() as integer
    declare virtual function listen( port as ushort ) as integer
    declare virtual function listen( addr as string, port as ushort ) as integer
    declare virtual function listen( addr as uinteger, port as ushort ) as integer
    declare virtual function accept() as integer
    declare virtual function accept( scklistener as CLionet ptr ) as integer
    declare virtual function accept( scklistener as SOCKET ) as integer
    declare virtual function send( in_buf as any ptr, length as integer ) as integer
    declare virtual function recv( out_buf as any ptr, length as integer, f_peek as integer = 0 ) as integer
    declare property thesocket() as SOCKET
    declare property remoteip() as zstring ptr
    declare property remoteport() as ushort
    declare property localip() as zstring ptr
    declare property localport() as ushort
    declare property async( mode as CLIONET_MODE )
    declare property async() as  CLIONET_MODE
    onSocket as sub ( boku as CLionet ptr, msg as integer, errcode as integer )
    onAccept as sub ( boku as CLionet ptr, errcode as integer )
    onConnect as sub ( boku as CLionet ptr, errcode as integer )
    onRead as sub ( boku as CLionet ptr, errcode as integer )
    onWrite as sub ( boku as CLionet ptr, errcode as integer )
    onClose as sub ( boku as CLionet ptr, errcode as integer )
  protected:
    declare static  function eventThread( boku as CLionet ptr ) as integer
    declare virtual function connect( lpName as any ptr ) as integer
    declare virtual function bind( lpName as any ptr ) as integer
    declare virtual sub attachEvent()
    declare virtual sub detachEvent()
    m_socket as SOCKET
    m_event  as HANDLE
    m_thread as HANDLE
    async_mode as integer
    flag_thread as integer
end type

#endif