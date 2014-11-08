	.intel_syntax noprefix

	#examples\Test.bas' compilation started at 21:07:28 (FreeBASIC 0.90.0)

.section .text
.balign 16

.globl _main
_main:
push ebp
mov ebp, esp
and esp, 0xFFFFFFF0
sub esp, 7072
push ebx
mov dword ptr [ebp-4], 0
call ___main
push 0
push dword ptr [ebp+12]
push dword ptr [ebp+8]
call _fb_Init@12
.Lt_0002:
mov dword ptr [ebp-16], 0
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov dword ptr [ebp-28], 0
mov dword ptr [ebp-24], 0
mov dword ptr [ebp-20], 0
push 0
push 1
push 0
push 0
push 2
push 10
push offset _Lt_00CA
call _fb_StrAllocTempDescZEx@8
push eax
call _fb_FileOpen@24
push 1
call _fb_FileInput@4
push 0
push -1
lea eax, [ebp-16]
push eax
call _fb_InputString@12
push 0
push -1
lea eax, [ebp-28]
push eax
call _fb_InputString@12
push 1
call _fb_FileClose@4
lea eax, [ebp-6524]
push eax
call __ZN6CTIEBA8CTIEBAMEC1Ev
add esp, 4
lea eax, [ebp-6788]
push eax
call __ZN6CTIEBA9CTIEBABARC1Ev
add esp, 4
push 1
push 5
lea eax, [ebp-28]
push eax
call _fb_LEFT@8
push eax
push 0
call _fb_PrintString@12
lea eax, [ebp-28]
push eax
lea eax, [ebp-6524]
push eax
call __ZN6CTIEBA8CTIEBAME5LOGINER8FBSTRING@8
push 1
lea eax, [ebp-120]
push eax
push 0
call _fb_PrintString@12
push 1
mov dword ptr [ebp-7064], 0
mov dword ptr [ebp-7060], 0
mov dword ptr [ebp-7056], 0
push 0
push 9
push offset _Lt_00CC
push -1
lea eax, [ebp-7064]
push eax
call _fb_StrAssign@20
lea eax, [ebp-7064]
push eax
lea eax, [ebp-6524]
push eax
lea eax, [ebp-7052]
push eax
call __ZN6CTIEBA8CTIEBAME6GETBARER8FBSTRINGi@12
lea ebx, [ebp-7064]
push ebx
mov ebx, eax
call _fb_StrDelete@4
push ebx
lea ebx, [ebp-6788]
push ebx
call __ZN6CTIEBA9CTIEBABARaSERS_
add esp, 8
lea ebx, [ebp-7052]
push ebx
call __ZN6CTIEBA9CTIEBABARD1Ev
add esp, 4
push 1
push 24
push offset _Lt_00CE
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
mov dword ptr [ebp-7068], 1
lea eax, [ebp-6572]
push eax
call __ZN6CTIEBA11CTIEBAARRAY12COUNT__get__Ev@4
mov dword ptr [ebp-7072], eax
jmp .Lt_00D0
.Lt_00D3:
push 1
push dword ptr [ebp-7068]
lea eax, [ebp-6572]
push eax
call __ZN6CTIEBA11CTIEBAARRAY5INDEXEi@8
push eax
push 0
call _fb_PrintUInt@12
.Lt_00D1:
inc dword ptr [ebp-7068]
.Lt_00D0:
mov eax, dword ptr [ebp-7072]
cmp dword ptr [ebp-7068], eax
jle .Lt_00D3
.Lt_00D2:
push 1
push dword ptr [ebp-6728]
push 0
call _fb_PrintInt@12
push -1
call _fb_Sleep@4
lea eax, [ebp-6788]
push eax
call __ZN6CTIEBA9CTIEBABARD1Ev
add esp, 4
lea eax, [ebp-6524]
push eax
call __ZN6CTIEBA8CTIEBAMED1Ev
add esp, 4
lea eax, [ebp-28]
push eax
call _fb_StrDelete@4
lea eax, [ebp-16]
push eax
call _fb_StrDelete@4
.Lt_0003:
push 0
call _fb_End@4
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16
__ZN7CLIONETaSERS_:
push ebp
mov ebp, esp
push ebx
.Lt_0075:
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ebp+12]
mov ecx, dword ptr [ebx]
mov dword ptr [eax], ecx
mov ebx, dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
mov ecx, dword ptr [ebx+4]
mov dword ptr [eax+4], ecx
mov ecx, dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ecx+8]
mov dword ptr [eax+8], ebx
mov ebx, dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
mov ecx, dword ptr [ebx+12]
mov dword ptr [eax+12], ecx
mov ecx, dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ecx+16]
mov dword ptr [eax+16], ebx
mov ebx, dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
mov ecx, dword ptr [ebx+20]
mov dword ptr [eax+20], ecx
mov ecx, dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ecx+24]
mov dword ptr [eax+24], ebx
mov ebx, dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
mov ecx, dword ptr [ebx+28]
mov dword ptr [eax+28], ecx
mov ecx, dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ecx+32]
mov dword ptr [eax+32], ebx
mov ebx, dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
mov ecx, dword ptr [ebx+36]
mov dword ptr [eax+36], ecx
mov ecx, dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ecx+40]
mov dword ptr [eax+40], ebx
mov ebx, dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
mov ecx, dword ptr [ebx+44]
mov dword ptr [eax+44], ecx
mov ecx, dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ecx+48]
mov dword ptr [eax+48], ebx
mov ebx, dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
mov ecx, dword ptr [ebx+52]
mov dword ptr [eax+52], ecx
mov ecx, dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ecx+56]
mov dword ptr [eax+56], ebx
.Lt_0076:
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16
__ZN11CLIONETHTTPaSERS_:
push ebp
mov ebp, esp
push ebx
.Lt_007E:
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ebp+12]
mov ecx, dword ptr [ebx]
mov dword ptr [eax], ecx
mov ebx, dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
mov ecx, dword ptr [ebx+4]
mov dword ptr [eax+4], ecx
mov ecx, dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ecx+8]
mov dword ptr [eax+8], ebx
push 0
push -1
mov ebx, dword ptr [ebp+12]
lea eax, [ebx+12]
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+12]
push ebx
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ebx, [eax+24]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+24]
push eax
call _fb_StrAssign@20
mov eax, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov cx, word ptr [eax+36]
mov word ptr [ebx+36], cx
push 0
push -1
mov ecx, dword ptr [ebp+12]
lea ebx, [ecx+40]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea ecx, [ebx+40]
push ecx
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ecx, [eax+52]
push ecx
push -1
mov ecx, dword ptr [ebp+8]
lea eax, [ecx+52]
push eax
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ecx, [eax+64]
push ecx
push -1
mov ecx, dword ptr [ebp+8]
lea eax, [ecx+64]
push eax
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ecx, [eax+76]
push ecx
push -1
mov ecx, dword ptr [ebp+8]
lea eax, [ecx+76]
push eax
call _fb_StrAssign@20
mov eax, dword ptr [ebp+12]
mov ecx, dword ptr [ebp+8]
mov ebx, dword ptr [eax+88]
mov dword ptr [ecx+88], ebx
mov ebx, dword ptr [ebp+12]
mov ecx, dword ptr [ebp+8]
mov eax, dword ptr [ebx+92]
mov dword ptr [ecx+92], eax
mov eax, dword ptr [ebp+12]
mov ecx, dword ptr [ebp+8]
mov ebx, dword ptr [eax+96]
mov dword ptr [ecx+96], ebx
mov ebx, dword ptr [ebp+12]
mov ecx, dword ptr [ebp+8]
mov eax, dword ptr [ebx+100]
mov dword ptr [ecx+100], eax
mov eax, dword ptr [ebp+12]
mov ecx, dword ptr [ebp+8]
mov ebx, dword ptr [eax+104]
mov dword ptr [ecx+104], ebx
mov ebx, dword ptr [ebp+12]
mov ecx, dword ptr [ebp+8]
mov eax, dword ptr [ebx+108]
mov dword ptr [ecx+108], eax
mov eax, dword ptr [ebp+12]
mov ecx, dword ptr [ebp+8]
mov ebx, dword ptr [eax+112]
mov dword ptr [ecx+112], ebx
mov ebx, dword ptr [ebp+12]
mov ecx, dword ptr [ebp+8]
mov eax, dword ptr [ebx+116]
mov dword ptr [ecx+116], eax
mov eax, dword ptr [ebp+12]
mov ecx, dword ptr [ebp+8]
mov ebx, dword ptr [eax+120]
mov dword ptr [ecx+120], ebx
mov ebx, dword ptr [ebp+12]
mov ecx, dword ptr [ebp+8]
mov eax, dword ptr [ebx+124]
mov dword ptr [ecx+124], eax
mov eax, dword ptr [ebp+12]
mov ecx, dword ptr [ebp+8]
mov ebx, dword ptr [eax+128]
mov dword ptr [ecx+128], ebx
mov ebx, dword ptr [ebp+12]
mov ecx, dword ptr [ebp+8]
mov eax, dword ptr [ebx+132]
mov dword ptr [ecx+132], eax
mov eax, dword ptr [ebp+8]
lea ecx, [eax+136]
mov eax, dword ptr [ebp+12]
lea ebx, [eax+136]
push ecx
push edi
push esi
mov edi, ecx
mov esi, ebx
mov ecx, 6
rep movsd
pop esi
pop edi
pop ecx
mov ebx, dword ptr [ebp+8]
lea ecx, [ebx+160]
mov ebx, dword ptr [ebp+12]
lea eax, [ebx+160]
push ecx
push edi
push esi
mov edi, ecx
mov esi, eax
mov ecx, 6
rep movsd
pop esi
pop edi
pop ecx
mov eax, dword ptr [ebp+12]
mov ecx, dword ptr [ebp+8]
mov ebx, dword ptr [eax+184]
mov dword ptr [ecx+184], ebx
mov ebx, dword ptr [ebp+12]
mov ecx, dword ptr [ebp+8]
mov eax, dword ptr [ebx+188]
mov dword ptr [ecx+188], eax
.Lt_007F:
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16
__ZN6CTIEBA18CTIEBAGOODCLASSIFYaSERS_:
push ebp
mov ebp, esp
push ebx
.Lt_0085:
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ebx, [eax]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx]
push eax
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ebx, [eax+12]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+12]
push eax
call _fb_StrAssign@20
mov eax, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [eax+24]
mov dword ptr [ebx+24], ecx
.Lt_0086:
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16
__ZN6CTIEBA10CTIEBAUSERC1Ev:
push ebp
mov ebp, esp
mov eax, dword ptr [ebp+8]
mov dword ptr [eax], 0
mov dword ptr [eax+4], 0
mov dword ptr [eax+8], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+12], 0
mov dword ptr [eax+16], 0
mov dword ptr [eax+20], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+24], 0
mov dword ptr [eax+28], 0
mov dword ptr [eax+32], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+36], 0
.Lt_0089:
.Lt_008A:
mov esp, ebp
pop ebp
ret
.balign 16
__ZN6CTIEBA10CTIEBAUSERaSERS_:
push ebp
mov ebp, esp
push ebx
.Lt_008D:
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ebx, [eax]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx]
push eax
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ebx, [eax+12]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+12]
push eax
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ebx, [eax+24]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+24]
push eax
call _fb_StrAssign@20
mov eax, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [eax+36]
mov dword ptr [ebx+36], ecx
.Lt_008E:
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16
__ZN6CTIEBA10CTIEBAUSERD1Ev:
push ebp
mov ebp, esp
push ebx
.Lt_008F:
.Lt_0090:
mov eax, dword ptr [ebp+8]
lea ebx, [eax+24]
push ebx
call _fb_StrDelete@4
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+12]
push eax
call _fb_StrDelete@4
mov eax, dword ptr [ebp+8]
lea ebx, [eax]
push ebx
call _fb_StrDelete@4
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16
__ZN6CTIEBA9CTIEBABARC1Ev:
push ebp
mov ebp, esp
push ebx
mov eax, dword ptr [ebp+8]
mov dword ptr [eax], 0
mov dword ptr [eax+4], 0
mov dword ptr [eax+8], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+12], 0
mov dword ptr [eax+16], 0
mov dword ptr [eax+20], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+24], 0
mov dword ptr [eax+28], 0
mov dword ptr [eax+32], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+36], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+40], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+44], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+48], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+52], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+56], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+60], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+64], 0
mov dword ptr [eax+68], 0
mov dword ptr [eax+72], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+76], 0
mov dword ptr [eax+80], 0
mov dword ptr [eax+84], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+88], 0
mov dword ptr [eax+92], 0
mov dword ptr [eax+96], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+100], 0
mov dword ptr [eax+104], 0
mov dword ptr [eax+108], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+112], 0
mov dword ptr [eax+116], 0
mov dword ptr [eax+120], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+124], 0
mov dword ptr [eax+128], 0
mov dword ptr [eax+132], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+136], 0
mov dword ptr [eax+140], 0
mov dword ptr [eax+144], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+148], 0
mov dword ptr [eax+152], 0
mov dword ptr [eax+156], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+160], 0
mov dword ptr [eax+164], 0
mov dword ptr [eax+168], 0
mov eax, dword ptr [ebp+8]
lea ebx, [eax+172]
push edi
mov edi, ebx
xor eax, eax
mov ecx, 5
rep stosd
pop edi
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+192]
push eax
push edi
mov edi, eax
xor eax, eax
mov ecx, 5
rep stosd
pop edi
pop eax
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+212], 0
mov eax, dword ptr [ebp+8]
lea ebx, [eax+216]
push edi
mov edi, ebx
xor eax, eax
mov ecx, 5
rep stosd
pop edi
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+236]
push eax
push edi
mov edi, eax
xor eax, eax
mov ecx, 6
rep stosd
pop edi
pop eax
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+260], 0
.Lt_0091:
.Lt_0092:
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16
__ZN6CTIEBA9CTIEBABARaSERS_:
push ebp
mov ebp, esp
push ebx
.Lt_0095:
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ebx, [eax]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx]
push eax
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ebx, [eax+12]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+12]
push eax
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ebx, [eax+24]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+24]
push eax
call _fb_StrAssign@20
mov eax, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [eax+36]
mov dword ptr [ebx+36], ecx
mov ecx, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ecx+40]
mov dword ptr [ebx+40], eax
mov eax, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [eax+44]
mov dword ptr [ebx+44], ecx
mov ecx, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ecx+48]
mov dword ptr [ebx+48], eax
mov eax, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [eax+52]
mov dword ptr [ebx+52], ecx
mov ecx, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ecx+56]
mov dword ptr [ebx+56], eax
mov eax, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [eax+60]
mov dword ptr [ebx+60], ecx
push 0
push -1
mov ecx, dword ptr [ebp+12]
lea ebx, [ecx+64]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea ecx, [ebx+64]
push ecx
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ecx, [eax+76]
push ecx
push -1
mov ecx, dword ptr [ebp+8]
lea eax, [ecx+76]
push eax
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ecx, [eax+88]
push ecx
push -1
mov ecx, dword ptr [ebp+8]
lea eax, [ecx+88]
push eax
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ecx, [eax+100]
push ecx
push -1
mov ecx, dword ptr [ebp+8]
lea eax, [ecx+100]
push eax
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ecx, [eax+112]
push ecx
push -1
mov ecx, dword ptr [ebp+8]
lea eax, [ecx+112]
push eax
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ecx, [eax+124]
push ecx
push -1
mov ecx, dword ptr [ebp+8]
lea eax, [ecx+124]
push eax
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ecx, [eax+136]
push ecx
push -1
mov ecx, dword ptr [ebp+8]
lea eax, [ecx+136]
push eax
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ecx, [eax+148]
push ecx
push -1
mov ecx, dword ptr [ebp+8]
lea eax, [ecx+148]
push eax
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ecx, [eax+160]
push ecx
push -1
mov ecx, dword ptr [ebp+8]
lea eax, [ecx+160]
push eax
call _fb_StrAssign@20
mov eax, dword ptr [ebp+12]
lea ecx, [eax+172]
push ecx
mov ecx, dword ptr [ebp+8]
lea eax, [ecx+172]
push eax
call __ZN6CTIEBA11CTIEBAARRAYaSERS_@8
mov eax, dword ptr [ebp+12]
lea ecx, [eax+192]
push ecx
mov ecx, dword ptr [ebp+8]
lea eax, [ecx+192]
push eax
call __ZN6CTIEBA11CTIEBAARRAYaSERS_@8
mov eax, dword ptr [ebp+12]
mov ecx, dword ptr [ebp+8]
mov ebx, dword ptr [eax+212]
mov dword ptr [ecx+212], ebx
mov ebx, dword ptr [ebp+12]
lea ecx, [ebx+216]
push ecx
mov ecx, dword ptr [ebp+8]
lea ebx, [ecx+216]
push ebx
call __ZN6CTIEBA11CTIEBAARRAYaSERS_@8
mov ebx, dword ptr [ebp+8]
lea ecx, [ebx+236]
mov ebx, dword ptr [ebp+12]
lea eax, [ebx+236]
push ecx
push edi
push esi
mov edi, ecx
mov esi, eax
mov ecx, 6
rep movsd
pop esi
pop edi
pop ecx
mov eax, dword ptr [ebp+12]
mov ecx, dword ptr [ebp+8]
mov ebx, dword ptr [eax+260]
mov dword ptr [ecx+260], ebx
.Lt_0096:
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16
__ZN6CTIEBA9CTIEBABARD1Ev:
push ebp
mov ebp, esp
push ebx
.Lt_0097:
.Lt_0098:
mov eax, dword ptr [ebp+8]
lea ebx, [eax+216]
push ebx
call __ZN6CTIEBA11CTIEBAARRAYD1Ev
add esp, 4
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+192]
push eax
call __ZN6CTIEBA11CTIEBAARRAYD1Ev
add esp, 4
mov eax, dword ptr [ebp+8]
lea ebx, [eax+172]
push ebx
call __ZN6CTIEBA11CTIEBAARRAYD1Ev
add esp, 4
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+160]
push eax
call _fb_StrDelete@4
mov eax, dword ptr [ebp+8]
lea ebx, [eax+148]
push ebx
call _fb_StrDelete@4
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+136]
push eax
call _fb_StrDelete@4
mov eax, dword ptr [ebp+8]
lea ebx, [eax+124]
push ebx
call _fb_StrDelete@4
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+112]
push eax
call _fb_StrDelete@4
mov eax, dword ptr [ebp+8]
lea ebx, [eax+100]
push ebx
call _fb_StrDelete@4
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+88]
push eax
call _fb_StrDelete@4
mov eax, dword ptr [ebp+8]
lea ebx, [eax+76]
push ebx
call _fb_StrDelete@4
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+64]
push eax
call _fb_StrDelete@4
mov eax, dword ptr [ebp+8]
lea ebx, [eax+24]
push ebx
call _fb_StrDelete@4
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+12]
push eax
call _fb_StrDelete@4
mov eax, dword ptr [ebp+8]
lea ebx, [eax]
push ebx
call _fb_StrDelete@4
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16
__ZN6CTIEBA10CTIEBAPOSTaSERS_:
push ebp
mov ebp, esp
push ebx
.Lt_009F:
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ebx, [eax]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx]
push eax
call _fb_StrAssign@20
mov eax, dword ptr [ebp+12]
lea ebx, [eax+12]
push ebx
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+12]
push eax
call __ZN6CTIEBA10CTIEBAUSERaSERS_
add esp, 8
mov eax, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [eax+52]
mov dword ptr [ebx+52], ecx
.Lt_00A0:
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16
__ZN6CTIEBA13CTIEBASUBPOSTaSERS_:
push ebp
mov ebp, esp
push ebx
.Lt_00A7:
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ebx, [eax]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx]
push eax
call _fb_StrAssign@20
mov eax, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [eax+12]
mov dword ptr [ebx+12], ecx
.Lt_00A8:
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16
__ZN6CTIEBA10CTIEBAHTTPaSERS_:
push ebp
mov ebp, esp
sub esp, 24
push ebx
.Lt_00AD:
mov eax, dword ptr [ebp+12]
lea ebx, [eax]
push ebx
mov ebx, dword ptr [ebp+8]
lea eax, [ebx]
push eax
call __ZN11CLIONETHTTPaSERS_
add esp, 8
mov eax, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [eax+192]
mov dword ptr [ebx+192], ecx
push 0
push -1
mov ecx, dword ptr [ebp+12]
lea ebx, [ecx+196]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea ecx, [ebx+196]
push ecx
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ecx, [eax+208]
push ecx
push -1
mov ecx, dword ptr [ebp+8]
lea eax, [ecx+208]
push eax
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ecx, [eax+220]
push ecx
push -1
mov ecx, dword ptr [ebp+8]
lea eax, [ecx+220]
push eax
call _fb_StrAssign@20
mov eax, dword ptr [ebp+8]
lea ecx, [eax+232]
mov dword ptr [ebp-8], ecx
mov ecx, dword ptr [ebp+12]
lea eax, [ecx+232]
mov dword ptr [ebp-12], eax
mov dword ptr [ebp-4], 0
.Lt_00B0:
push 0
push -1
push dword ptr [ebp-12]
push -1
push dword ptr [ebp-8]
call _fb_StrAssign@20
add dword ptr [ebp-8], 12
add dword ptr [ebp-12], 12
inc dword ptr [ebp-4]
cmp dword ptr [ebp-4], 256
jne .Lt_00B0
mov eax, dword ptr [ebp+8]
lea ecx, [eax+3304]
mov dword ptr [ebp-20], ecx
mov ecx, dword ptr [ebp+12]
lea eax, [ecx+3304]
mov dword ptr [ebp-24], eax
mov dword ptr [ebp-16], 0
.Lt_00B4:
push 0
push -1
push dword ptr [ebp-24]
push -1
push dword ptr [ebp-20]
call _fb_StrAssign@20
add dword ptr [ebp-20], 12
add dword ptr [ebp-24], 12
inc dword ptr [ebp-16]
cmp dword ptr [ebp-16], 256
jne .Lt_00B4
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ecx, [eax+6376]
push ecx
push -1
mov ecx, dword ptr [ebp+8]
lea eax, [ecx+6376]
push eax
call _fb_StrAssign@20
mov eax, dword ptr [ebp+12]
mov ecx, dword ptr [ebp+8]
mov ebx, dword ptr [eax+6388]
mov dword ptr [ecx+6388], ebx
.Lt_00AE:
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16
__ZN6CTIEBA16CTIEBASIGNRESULTaSERS_:
push ebp
mov ebp, esp
push ebx
.Lt_00C2:
mov eax, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [eax]
mov dword ptr [ebx], ecx
mov ecx, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ecx+4]
mov dword ptr [ebx+4], eax
mov eax, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [eax+8]
mov dword ptr [ebx+8], ecx
mov ecx, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ecx+12]
mov dword ptr [ebx+12], eax
mov eax, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [eax+16]
mov dword ptr [ebx+16], ecx
mov ecx, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ecx+20]
mov dword ptr [ebx+20], eax
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ebx, [eax+24]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+24]
push eax
call _fb_StrAssign@20
mov eax, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [eax+36]
mov dword ptr [ebx+36], ecx
.Lt_00C3:
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16
__ZN6CTIEBA8CTIEBAMEaSERS_:
push ebp
mov ebp, esp
push ebx
.Lt_00C8:
mov eax, dword ptr [ebp+12]
lea ebx, [eax]
push ebx
mov ebx, dword ptr [ebp+8]
lea eax, [ebx]
push eax
call __ZN6CTIEBA10CTIEBAHTTPaSERS_
add esp, 8
mov eax, dword ptr [ebp+12]
lea ebx, [eax+6392]
push ebx
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+6392]
push eax
call __ZN6CTIEBA10CTIEBAUSERaSERS_
add esp, 8
mov eax, dword ptr [ebp+12]
lea ebx, [eax+6432]
push ebx
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+6432]
push eax
call __ZN6CTIEBA11CTIEBAARRAYaSERS_@8
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ebx, [eax+6452]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+6452]
push eax
call _fb_StrAssign@20
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ebx, [eax+6464]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+6464]
push eax
call _fb_StrAssign@20
mov eax, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [eax+6476]
mov dword ptr [ebx+6476], ecx
mov ecx, dword ptr [ebp+12]
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ecx+6480]
mov dword ptr [ebx+6480], eax
push 0
push -1
mov eax, dword ptr [ebp+12]
lea ebx, [eax+6484]
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+6484]
push eax
call _fb_StrAssign@20
.Lt_00C9:
pop ebx
mov esp, ebp
pop ebp
ret
	#examples\Test.bas' compilation took 0.2536728903911012 secs

.section .data
.balign 4
__ZTS7CLIONET:
.long 0
.int _Lt_0070
.int ___fb_ZTS6Object
.balign 4
_Lt_0070:	.ascii	"7CLIONET\0"
.balign 4
__ZTV7CLIONET:
.long 0
.int __ZTS7CLIONET
.int __ZN7CLIONETD1Ev
.int __ZN7CLIONET10OPENSOCKETEv@4
.int __ZN7CLIONET12REOPENSOCKETEv@4
.int __ZN7CLIONET11CLOSESOCKETEv@4
.int __ZN7CLIONET3UDPEv@4
.int __ZN7CLIONET7CONNECTER8FBSTRINGt@12
.int __ZN7CLIONET7CONNECTEjt@12
.int __ZN7CLIONET4BINDEt@8
.int __ZN7CLIONET4BINDER8FBSTRINGt@12
.int __ZN7CLIONET4BINDEjt@12
.int __ZN7CLIONET6LISTENEjt@12
.int __ZN7CLIONET6LISTENER8FBSTRINGt@12
.int __ZN7CLIONET6LISTENEt@8
.int __ZN7CLIONET6LISTENEv@4
.int __ZN7CLIONET6ACCEPTEv@4
.int __ZN7CLIONET6ACCEPTEPS_@8
.int __ZN7CLIONET6ACCEPTEj@8
.int __ZN7CLIONET4SENDEPvi@12
.int __ZN7CLIONET4RECVEPvii@16
.int __ZN7CLIONET6SENDTOEPviR8FBSTRINGt@20
.int __ZN7CLIONET6SENDTOEPvijt@20
.int __ZN7CLIONET8RECVFROMEPviPj@16
.int __ZN7CLIONET8RECVFROMEPviPPc@16
.int __ZN7CLIONET16THESOCKET__get__Ev@4
.int __ZN7CLIONET15REMOTEIP__get__Ev@4
.int __ZN7CLIONET17REMOTEPORT__get__Ev@4
.int __ZN7CLIONET14LOCALIP__get__Ev@4
.int __ZN7CLIONET16LOCALPORT__get__Ev@4
.int __ZN7CLIONET12ASYNC__set__E12CLIONET_MODE@8
.int __ZN7CLIONET12ASYNC__get__Ev@4
.int __ZN7CLIONET7CONNECTEPv@8
.int __ZN7CLIONET4BINDEPv@8
.int __ZN7CLIONET11ATTACHEVENTEv@4
.int __ZN7CLIONET11DETACHEVENTEv@4
.balign 4
__ZTS11CLIONETHTTP:
.long 0
.int _Lt_0079
.int ___fb_ZTS6Object
.balign 4
_Lt_0079:	.ascii	"11CLIONETHTTP\0"
.balign 4
__ZTV11CLIONETHTTP:
.long 0
.int __ZTS11CLIONETHTTP
.int __ZN11CLIONETHTTPD1Ev
.int __ZN11CLIONETHTTP4OPENER8FBSTRINGS1_ii@20
.int __ZN11CLIONETHTTP16SETREQUESTHEADERER8FBSTRINGS1_@12
.int __ZN11CLIONETHTTP19REMOVEREQUESTHEADERER8FBSTRING@8
.int __ZN11CLIONETHTTP4SENDER8FBSTRINGS1_@12
.int __ZN11CLIONETHTTP17GETRESPONSEHEADERER8FBSTRING@8
.int __ZN11CLIONETHTTP24RESPONSERAWHEADER__get__Ev@4
.int __ZN11CLIONETHTTP21RESPONSENUMBER__get__Ev@4
.int __ZN11CLIONETHTTP26RESPONSEDESCRIPTION__get__Ev@4
.int __ZN11CLIONETHTTP21RESPONSESTRING__get__Ev@4
.int __ZN11CLIONETHTTP20RESPONSEBYTES__get__Ev@4
.int __ZN11CLIONETHTTP21RESPONSELENGTH__get__Ev@4
.int __ZN11CLIONETHTTP12STATE__get__Ev@4
.int __ZN11CLIONETHTTP19PARSERESPONSEHEADEREv@4
.balign 4
_Lt_00CA:	.ascii	"list.bduss\0"
.balign 4
_Lt_00CC:	.ascii	"\320\343\310\253\326\320\321\247\0"
.balign 4
_Lt_00CE:	.ascii	"FFFFFFFFFFFFFFFFFFFFFFFF\0"
