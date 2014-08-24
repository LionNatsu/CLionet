#include "CTieba.bi"
dim as string nam, current_bduss
    open "list.bduss" for input as #1
    do until eof(1)
        input #1, nam, current_bduss
        dim as CTieba.CTiebaMe lion
        lion.login(current_bduss)
        if lion.is_err() then continue do
        print nam, lion.user->name
        lion.refreshBarsList()
        dim bars as CTieba.CTiebaBarArray ptr = lion.bars
        for i as integer = 1 to bars->count
            dim bar as CTieba.CTiebaBar ptr = bars->index( i )
            if bar->is_sign = 0 then
                dim ret as CTieba.CTiebaSignResult
                lion.signBar( *bar, ret )
                if lion.is_err() = 0 then
                    print "签到成功:", bar->name, "+"; ret.bonus
                else
                    print "签到失败:", bar->name, lion.get_err()
                endif
            else
                'print "已经签到:", bar->name
            endif
        next
    loop
    close #1
'dim as CTieba.CTiebaMe lion
'lion.login(LION_BDUSS)

print "PAKTE."
sleep
