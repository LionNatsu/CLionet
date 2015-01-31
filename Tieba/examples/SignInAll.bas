#include "CTieba.bi"
dim as string nam, current_bduss
dim as CTieba.CTiebaMe lion
    open "list.bduss" for input as #1
    do until eof(1)
        input #1, nam, current_bduss
        lion.login(current_bduss)
        print nam
        if lion.isErr() then print "error", lion.getErr(): continue do
        lion.signAllBars()
        print nam, lion.user.name, lion.getErr()
    loop
    close #1
