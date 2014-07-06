#include "CLionet.bi"
CLionet._startup()
dim as CLionet ptr cl = new CLionet(), cc = new CLionet()

        #if 0
        cl->_connect("127.0.0.1",82)
        dim p as string = !"Hello World!\r\n"
        cl->_send(strptr(p),len(p))
        
        sleep 'wait 4 a key
        #endif

cl->_listen(82)
cc->_accept(cl->_getSocket)
print "x"
dim p as zstring * 50
cc->_recv(@p,50)
print WSAGETLASTERROR()
print "==="
print p
print "==="
sleep
cl->_close()
cc->_close()
delete cc
delete cl
CLionet._cleanup()