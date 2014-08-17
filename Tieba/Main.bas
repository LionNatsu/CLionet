#include "CTieba.bi"

dim as string LION_BDUSS
    open "lion.bduss" for input as #1
    line input #1, LION_BDUSS
    close #1

dim as CTieba.CTiebaMe lion
lion.login(LION_BDUSS)
lion.refreshBarsList()

dim as CTieba.CTiebaBarArray ptr bars = lion.bars
for i as integer = 1 to bars->count
    if bars->index( i )->name = "utau" then
        lion.signBar(*bars->index( i ))
        exit for
    endif
next

print lion.user->name
sleep
