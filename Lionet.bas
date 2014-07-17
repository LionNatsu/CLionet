#ifdef __SERVER__
'Server
#include "CLionet.bi"

sub Onxxx ( boku as CLionet ptr, msg as integer, errcode as integer )
    select case msg
        case FD_ACCEPT
            print "ACCEPT"
            boku->accept()
        case FD_READ
            print "READ"
            dim p as zstring * 50
            boku->recv(@p,50)
            print "data:["& p &"]"
        case FD_CLOSE
            print "CLOSE"
            boku->closesocket()
            boku->opensocket()
            boku->listen(85)
            print "RE-LISTEN",CLionet.error,*CLionet.error_string
    end select
end sub

CLionet.startup()
dim as CLionet ptr cl = new CLionet()
cl->listen(85)
cl->onSocket = procptr(Onxxx)
cl->async = CLIONET_MODE.CLAM_EVENTSELECT

do
    sleep_ 0
Loop
end

cl->accept()
dim p as zstring * 50
cl->recv(@p,50)
print cl->localport
print p
sleep
delete cl
CLionet.cleanup()

#else
'Client
#include "CLionet.bi"
CLionet.startup()
dim as CLionet ptr cl = new CLionet()
cl->connect("127.0.0.1",85)
print *cl->error_string
print "connected"
dim p as string = "Hello World!"
cl->send(strptr(p),len(p))
print *cl->error_string
print "sent"
sleep
delete cl
CLionet.cleanup()
#endif
