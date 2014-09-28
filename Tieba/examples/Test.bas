#include "CTieba.bi"
#include "string.bi"
dim as string nam, current_bduss
    open "list.bduss" for input as #1
    input #1, nam, current_bduss
    close #1

dim as CTieba.CTiebaMe lion
dim as CTieba.CTiebaBar bar
print current_bduss
lion.login(current_bduss)
print lion.user.name
bar=lion.getBar("ĞãÈ«ÖĞÑ§")
print lion.user.name
'print bar.isManager
sleep
