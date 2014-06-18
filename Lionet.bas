#include "CLionet.bi"
CLionet._startup()
dim cl as CLionet ptr = new CLionet()
cl->_connect("127.0.0.1",82)
dim p as string = !"Hello World!\r\n"
cl->_send(strptr(p),len(p))

sleep 'wait 4 a key

delete cl
CLionet._cleanup()