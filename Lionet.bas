#include "CLionet.bi"
CLionet.startup()
dim as CLionet ptr cl = new CLionet(), cc = new CLionet()

        #if 0
        cl->_connect("127.0.0.1",82)
        dim p as string = !"Hello World!\r\n"
        cl->_send(strptr(p),len(p))
        
        sleep 'wait 4 a key
        #endif

cl->listen(82)
cc->accept(cl->getSocket)
'print *CLionet.error_string()
print "x"
dim p as zstring * 50
cc->recv(@p,50)
print *CLionet.error_string()
print "==="
print p
print "==="
sleep
cl->closesocket()
cc->closesocket()
delete cc
delete cl
CLionet.cleanup()