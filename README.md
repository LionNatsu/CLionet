CLionet
=======

The package of Windows Socket in FreeBASIC.

```
dim as CLionetHttp p
do
    p.open("http://***:***@ddns.oray.com/ph/update?hostname=tsuna.wicp.net")
    p.setRequestHeader("User-Agent", "Chrome/36.0.1985.125")
    p.send()
    print "[DDNS] tsuna.wicp.net " & p.responseString
    sleep_ 3600 * 1000
loop
```

#include "CLionetHttp.bi"
#include "bdpost.bi"

#define LION_BDUSS "BDUSS=0hKa2FvUkRoSDh6RWFrRktHZVNrMklzNFRjTGF5SkdsbFZMSFVEWUtpejJYfmhUQVFBQUFBJCQAAAAAAAAAAAEAAAByrD0JeWRtX2JkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPbS0FP20tBTN"
#define FAKELION_BDUSS "BDUSS=3FHTmhQU3haMFUyeE1pNC1VUEVOdGpVdUNVNWpSNlVYT3dleGtobnFuS0hPZmhUQVFBQUFBJCQAAAAAAAAAAAEAAAByrD0JeWRtX2JkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIes0FOHrNBTS"



function get_tbs( BDUSS as string ) as string
    dim as CLionetHttp ptr c = new CLionetHttp()
    c->open("http://tieba.baidu.com/dc/common/tbs")
    c->setRequestHeader("Cookie",BDUSS)
    c->send()
    dim as string ret = c->responseString
    delete c
    return ret
end function

function get_likes( BDUSS as string ) as string
    dim as CLionetHttp ptr c = new CLionetHttp()
    c->open("http://c.tieba.baidu.com/c/f/forum/forumrecommend", "POST")
    c->setRequestHeader("Cookie","ka=open")
    c->setRequestHeader("sid",BDPostBody.sid())
    c->setRequestHeader("net","3")
    c->setRequestHeader("User-Agent","bdtb for Android 6.2.2")
    dim as BDPostBody bdp
    bdp.init(FAKELION_BDUSS)
    c->send( bdp.gen_forumrecommend() )
    dim as string ret = c->responseString
    
    delete c
    return ret
end function

print get_likes(LION_BDUSS)
sleep
