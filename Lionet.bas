'example for CLionet
#if 0
#ifdef __SERVER__
'Server
#include "CLionet.bi"
sub OnB ( boku as CLionet ptr, msg as integer, errcode as integer )
    select case msg
        case CLAE_READ
            print "  READ"
            dim p as zstring * 4096
            boku->recv(@p,4096)
            print "    data:["& p &"]"
        case CLAE_INIT
            print "  CONNECTED"
            dim p as string = "This is Server."
            boku->send(strptr(p), len(p))
        case CLAE_CLOSE
            print "  CLOSE"
            boku->async = CLAM_BLOCK
            boku->closesocket()
            delete boku
            CLionet.exitEventThread()
    end select
end sub
sub OnA ( boku as CLionet ptr, msg as integer, errcode as integer )
    select case msg
        case CLAE_ACCEPT
            print "ACCEPT"
            print boku->remoteip
            dim as CLionet ptr cc = new CLionet()
            cc->onSocket = procptr(OnB)
            cc->accept(boku)
            cc->async = CLAM_EVENTSELECT
    end select
end sub
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
cl->connect("reshh.gicp.net",85)
print "connected"
dim px as zstring * 4096
cl->recv(@px,4096)
print "    data:["& px &"]"
dim p as string = "Hello World!"
cl->send(strptr(p),len(p))
print "sent"
sleep
delete cl
CLionet.cleanup()
#endif
#endif

'example for CLionetHttp

#include "CLionetHttp.bi"
dim as CLionetHttp ptr c = new CLionetHttp()
c->open("http://www.baidu.com/img/baidu_sylogo1.gif")
c->send()
open "baidu.gif" for binary as 1
dim as byte buffer(c->responseLength-1)
copymemory(@buffer(0),c->responseBytes,c->responseLength)
put #1,1,buffer()
close 1
sleep
