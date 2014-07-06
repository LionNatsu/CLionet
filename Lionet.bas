#ifdef __SERVER__
'Server
#include "CLionet.bi"
CLionet.startup()
dim as CLionet ptr cl = new CLionet()
cl->listen(82)
cl->accept()
dim p as zstring * 50
cl->recv(@p,50)
print *cl->remoteip
print p
sleep
delete cl
CLionet.cleanup()

#else
'Client
#include "CLionet.bi"
CLionet.startup()
dim as CLionet ptr cl = new CLionet()
cl->connect("127.0.0.1",82)
dim p as string = !"Hello World!\r\n"
cl->send(strptr(p),len(p))
sleep
delete cl
CLionet.cleanup()
#endif
