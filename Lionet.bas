#ifdef __SERVER__
'Server
#include "CLionet.bi"
sub OnB ( boku as CLionet ptr, msg as integer, errcode as integer )
    select case msg
        case FD_READ
            print "READ"
            dim p as zstring * 50
            boku->recv(@p,50)
            print "data:["& p &"]"
        case FD_CLOSE
            print "CLOSE"
            boku->async = CLAM_BLOCK
            boku->closesocket()
            delete boku
            CLionet.exitEventThread()
    end select
end sub
sub OnA ( boku as CLionet ptr, msg as integer, errcode as integer )
    select case msg
        case FD_ACCEPT
            print "ACCEPT"
            dim as CLionet ptr cc = new CLionet()
            cc->onSocket = procptr(OnB)
            cc->async = CLAM_EVENTSELECT
            cc->accept(boku)
    end select
end sub

CLionet.startup()
dim as CLionet ptr cl = new CLionet()
cl->onSocket = procptr(OnA)
cl->async = CLAM_EVENTSELECT
cl->listen(85)
do:sleep_ 0:loop
end

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
