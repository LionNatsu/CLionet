@echo off
d:\FreeBasic\fbc -s console -x "Main.exe" -g -d __DEBUG__ -mt "Main.bas" "..\src\CLionet.bas" "..\src\CLionetHttp.bas" "CTiebaHttp.bas" "CTiebaArray.bas" "CTiebaUtils.bas" "CTiebaMe.bas"
