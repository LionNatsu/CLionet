#ifndef __CLIONETPACKET_BI__
#define __CLIONETPACKET_BI__
#include "CLionet.bi"
enum CLIONETPACKET_STATE
    CLHS_STANDBY
    CLHS_SENDING
    CLHS_RECEIVING
end enum

type CLionetPacket extends object
  public:
    declare constructor()
    declare virtual destructor()
    
    declare virtual function connect( host as string, port as ushort ) as integer
    declare virtual function listen( port as ushort ) as integer
    declare virtual function send( body as string ) as integer
    declare virtual function close() as integer
    
    declare virtual property remoteip() as string
    declare virtual property remoteport() as ushort
    declare virtual property localip() as string
    declare virtual property localport() as ushort
    
    OnPacket  as sub( buffer as byte ptr, size as integer )
    OnClose   as sub()
    OnConnect as sub()
    
    g_timeout as integer
  protected:
    declare static sub onSocket( boku as CLionet ptr, msg as integer, errcode as integer )
    declare virtual sub parseResponseHeader()
    m_socket as CLionet ptr
    m_state as CLIONETHTTP_STATE
    
  private:
    declare sub WaitForState( stat as CLIONETHTTP_STATE, timeout as integer )
    declare sub SetState( stat as CLIONETHTTP_STATE )
    m_4k_buffer as byte ptr
    
    m_recv_chunk as byte ptr
    m_recv_chunk_length as integer
    declare function _parseChunk() as integer
    declare function parseChunk() as integer
    
    m_event_statechange as HANDLE
    m_event_waitfor as CLIONETHTTP_STATE
end type

#endif