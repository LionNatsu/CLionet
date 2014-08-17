#ifndef __CLIONETHTTP_BI__
#define __CLIONETHTTP_BI__
#include "CLionet.bi"
enum CLIONETHTTP_STATE
    CLHS_STANDBY
    CLHS_CONNECTING
    CLHS_CONNECTED
    CLHS_SENDING
    CLHS_WAITING
    CLHS_RECEIVING
    CLHS_COMPLETED
end enum

type CLionetHttp extends object
  public:
    declare constructor()
    declare virtual destructor()
    
    declare virtual function open( url as string, method as string = "GET", async as integer = 0, timeout as integer = 10000 ) as integer
    declare virtual sub setRequestHeader( key as string, value as string )
    declare virtual sub removeRequestHeader( key as string )
    declare virtual function send( body as string = "", mime_type as string = "application/x-www-form-urlencoded" ) as integer
    
    declare virtual function getResponseHeader( key as string ) as string
    
    declare virtual property responseRAWHeader() as string
    declare virtual property responseNumber() as integer
    declare virtual property responseDescription() as string
    declare virtual property responseString() as string
    declare virtual property responseBytes() as byte ptr
    declare virtual property responseLength() as integer
    declare virtual property state() as CLIONETHTTP_STATE
    
  protected:
    declare static sub onSocket( boku as CLionet ptr, msg as integer, errcode as integer )
    declare virtual sub parseResponseHeader()
    m_socket as CLionet ptr
    m_state as CLIONETHTTP_STATE
    
    m_method as string
    m_host as string
    m_port as ushort
    m_url as string
    m_auth as string
    m_header as string
    
    m_responseHeader as string
    m_async as integer
    m_timeout as integer
    
  private:
    declare sub WaitForState( stat as CLIONETHTTP_STATE, timeout as integer )
    declare sub SetState( stat as CLIONETHTTP_STATE )
    m_4k_buffer as byte ptr
    
    m_recv_header as byte ptr
    m_recv_header_length as integer
    m_recv_header_state as integer
    
    m_recv_buffer as byte ptr
    m_recv_length as integer
    m_recv_expected_length as integer
    
    m_chunked as integer
    m_recv_chunk as byte ptr
    m_recv_chunk_length as integer
    declare function _parseChunk() as integer
    declare function parseChunk() as integer
    
    
    m_header_critical as CRITICAL_SECTION
    m_buffer_critical as CRITICAL_SECTION
    m_event_statechange as HANDLE
    m_event_waitfor as CLIONETHTTP_STATE
end type

#endif