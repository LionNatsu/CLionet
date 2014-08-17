#include "datetime.bi"
#include "string.bi"
#include "windows.bi"
#include "../inc/CLionet.bi"

sub onSocket( boku as CLionet ptr, msg as integer, errcode as integer )
    select case msg
        case CLE_ACCEPT
            print "AC!"
            boku->accept()
        case CLE_CLOSE
            print "CL!"
            boku->reopensocket()
            boku->listen(80)
        case CLE_READ
            dim as byte buffer(4096)
            dim as integer size = boku->recv(@buffer(0),4096)
            if instr(left(*cast(zstring ptr,@buffer(0)),size),"GET /NetTest.html HTTP/1.1") then
                print "TEST!"
                open "nettest.txt" for binary as #1
                redim as byte filebuf(lof(1)-1)
                get #1,1,filebuf()
                boku->send(@filebuf(0),lof(1))
                close #1
            elseif instr(left(*cast(zstring ptr,@buffer(0)),size),"<login") then
                print "LOGIN!"
                open "netlogin.txt" for binary as #1
                redim as byte filebuf(lof(1)-1)
                get #1,1,filebuf()
                boku->send(@filebuf(0),lof(1))
                close #1
            elseif instr(left(*cast(zstring ptr,@buffer(0)),size),"<getPaperList") then
                print "PAPER!"
                open "netpaper.txt" for binary as #1
                redim as byte filebuf(lof(1)-1)
                get #1,1,filebuf()
                boku->send(@filebuf(0),lof(1))
                close #1
            elseif instr(left(*cast(zstring ptr,@buffer(0)),size),"<getPatch") then
                print "PATCH!"
                open "netpatch.txt" for binary as #1
                redim as byte filebuf(lof(1)-1)
                get #1,1,filebuf()
                boku->send(@filebuf(0),lof(1))
                close #1
            elseif instr(left(*cast(zstring ptr,@buffer(0)),size),"<getXtgg") then
                print "XTGG!"
                open "netxtgg.txt" for binary as #1
                redim as byte filebuf(lof(1)-1)
                get #1,1,filebuf()
                boku->send(@filebuf(0),lof(1))
                close #1
            elseif instr(left(*cast(zstring ptr,@buffer(0)),size),"<checkToken") then
                print "CHECK!"
                open "netcheck.txt" for binary as #1
                redim as byte filebuf(lof(1)-1)
                get #1,1,filebuf()
                boku->send(@filebuf(0),lof(1))
                close #1
            elseif instr(left(*cast(zstring ptr,@buffer(0)),size),"<getSystemTime") then
                print "TIME!"
                dim as string sendstr
                scope
                    dim as string h1,h2,b1,b2,b
                    open "nettime0.txt" for binary as #1
                    redim as byte filebuf(lof(1))
                    get #1,1,filebuf()
                    h1=*cast(zstring ptr,@filebuf(0))
                    close #1
                    open "nettime1.txt" for binary as #1
                    redim as byte filebuf(lof(1))
                    get #1,1,filebuf()
                    h2=*cast(zstring ptr,@filebuf(0))
                    close #1
                    open "nettime2.txt" for binary as #1
                    redim as byte filebuf(lof(1))
                    get #1,1,filebuf()
                    b1=*cast(zstring ptr,@filebuf(0))
                    close #1
                    open "nettime3.txt" for binary as #1
                    redim as byte filebuf(lof(1))
                    get #1,1,filebuf()
                    b2=*cast(zstring ptr,@filebuf(0))
                    close #1
                    b=b1 & format(now(),"yyyy-mm-dd hh:mm:ss") & b2
                    sendstr=h1 & len(b) & h2 & b
                end scope
                boku->send(strptr(sendstr),len(sendstr))
                close #1
            else
                print "RE! " & left(*cast(zstring ptr,@buffer(0)),size)
            endif
    end select
end sub

dim as CLionet k
k.onSocket=procptr(onSocket)
k.async=CLM_EVENTSELECT
k.listen(80)

do
    sleep_ 1000
loop
