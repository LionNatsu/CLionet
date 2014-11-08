	.intel_syntax noprefix

	#..\src\CLionetHttp.bas' compilation started at 21:07:29 (FreeBASIC 0.90.0)

.section .text
.balign 16

.globl __ZN11CLIONETHTTPC1Ev
__ZN11CLIONETHTTPC1Ev:
push ebp
mov ebp, esp
sub esp, 4
push ebx
.Lt_0080:
mov eax, dword ptr [ebp+8]
lea ebx, [eax]
push ebx
call __ZN10$fb_ObjectC1Ev
add esp, 4
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+4], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+8], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+12], 0
mov dword ptr [ebx+16], 0
mov dword ptr [ebx+20], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+24], 0
mov dword ptr [ebx+28], 0
mov dword ptr [ebx+32], 0
mov ebx, dword ptr [ebp+8]
mov word ptr [ebx+36], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+40], 0
mov dword ptr [ebx+44], 0
mov dword ptr [ebx+48], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+52], 0
mov dword ptr [ebx+56], 0
mov dword ptr [ebx+60], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+64], 0
mov dword ptr [ebx+68], 0
mov dword ptr [ebx+72], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+76], 0
mov dword ptr [ebx+80], 0
mov dword ptr [ebx+84], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+88], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+92], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+96], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+100], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+104], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+108], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+112], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+116], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+120], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+124], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+128], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+132], 0
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+136]
push eax
push edi
mov edi, eax
xor eax, eax
mov ecx, 6
rep stosd
pop edi
pop eax
mov eax, dword ptr [ebp+8]
lea ebx, [eax+160]
push edi
mov edi, ebx
xor eax, eax
mov ecx, 6
rep stosd
pop edi
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+184], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+188], 0
mov ebx, dword ptr [ebp+8]
mov eax, offset __ZTV11CLIONETHTTP + 8
mov dword ptr [ebx], eax
push 60
call __Znwj
add esp, 4
mov dword ptr [ebp-4], eax
push dword ptr [ebp-4]
call __ZN7CLIONETC1Ev
add esp, 4
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ebp-4]
mov dword ptr [eax+4], ebx
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebx+4]
mov ebx, dword ptr [ebp+8]
mov dword ptr [eax+36], ebx
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebx+4]
mov ebx, offset __ZN11CLIONETHTTP8ONSOCKETEP7CLIONETii@12
mov dword ptr [eax+4], ebx
push 4100
call _malloc
add esp, 4
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+96], eax
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+188], 0
push 0
push 0
push 0
push 0
call _CreateEventA@16
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+184], eax
mov eax, dword ptr [ebp+8]
lea ebx, [eax+136]
push ebx
call _InitializeCriticalSection@4
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+160]
push eax
call _InitializeCriticalSection@4
push 1
mov eax, dword ptr [ebp+8]
push dword ptr [eax+4]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax+4]
mov eax, dword ptr [ebx]
call dword ptr [eax+112]
.Lt_0081:
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16

.globl __ZN11CLIONETHTTPD1Ev
__ZN11CLIONETHTTPD1Ev:
push ebp
mov ebp, esp
push ebx
.Lt_0085:
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+4], 0
je .Lt_0087
mov eax, dword ptr [ebp+8]
push dword ptr [eax+4]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax+4]
mov eax, dword ptr [ebx]
call dword ptr [eax]
add esp, 4
mov eax, dword ptr [ebp+8]
push dword ptr [eax+4]
call __ZdlPv
add esp, 4
.Lt_0087:
mov eax, dword ptr [ebp+8]
lea ebx, [eax+136]
push ebx
call _EnterCriticalSection@4
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+160]
push eax
call _EnterCriticalSection@4
mov eax, dword ptr [ebp+8]
push dword ptr [eax+96]
call _free
add esp, 4
mov eax, dword ptr [ebp+8]
push dword ptr [eax+100]
call _free
add esp, 4
mov eax, dword ptr [ebp+8]
push dword ptr [eax+112]
call _free
add esp, 4
mov eax, dword ptr [ebp+8]
push dword ptr [eax+128]
call _free
add esp, 4
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+96], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+100], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+112], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+128], 0
mov eax, dword ptr [ebp+8]
lea ebx, [eax+160]
push ebx
call _LeaveCriticalSection@4
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+136]
push eax
call _LeaveCriticalSection@4
mov eax, dword ptr [ebp+8]
push dword ptr [eax+184]
call _CloseHandle@4
mov eax, dword ptr [ebp+8]
lea ebx, [eax+136]
push ebx
call _DeleteCriticalSection@4
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+160]
push eax
call _DeleteCriticalSection@4
.Lt_0086:
mov eax, dword ptr [ebp+8]
lea ebx, [eax+76]
push ebx
call _fb_StrDelete@4
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+64]
push eax
call _fb_StrDelete@4
mov eax, dword ptr [ebp+8]
lea ebx, [eax+52]
push ebx
call _fb_StrDelete@4
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+40]
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
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16

.globl __ZN11CLIONETHTTP8ONSOCKETEP7CLIONETii@12
__ZN11CLIONETHTTP8ONSOCKETEP7CLIONETii@12:
push ebp
mov ebp, esp
sub esp, 56
push ebx
.Lt_0089:
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax+36]
mov dword ptr [ebp-4], ebx
cmp dword ptr [ebp+12], 5
jne .Lt_008C
.Lt_008D:
mov ebx, dword ptr [ebp-4]
mov dword ptr [ebx+8], 0
jmp .Lt_008B
.Lt_008C:
cmp dword ptr [ebp+12], 1
jne .Lt_008E
.Lt_008F:
push 2
push dword ptr [ebp-4]
call __ZN11CLIONETHTTP8SETSTATEE17CLIONETHTTP_STATE@8
jmp .Lt_008B
.Lt_008E:
cmp dword ptr [ebp+12], 3
jne .Lt_0090
.Lt_0091:
mov ebx, dword ptr [ebp-4]
cmp dword ptr [ebx+8], 3
jne .Lt_0093
mov ebx, dword ptr [ebp-4]
mov dword ptr [ebx+8], 4
.Lt_0093:
.Lt_0092:
jmp .Lt_008B
.Lt_0090:
cmp dword ptr [ebp+12], 4
jne .Lt_0094
.Lt_0095:
mov ebx, dword ptr [ebp-4]
push dword ptr [ebx+4]
mov ebx, dword ptr [ebp-4]
mov eax, dword ptr [ebx+4]
mov ebx, dword ptr [eax]
call dword ptr [ebx+12]
jmp .Lt_008B
.Lt_0094:
cmp dword ptr [ebp+12], 2
jne .Lt_0097
.Lt_0098:
mov ebx, dword ptr [ebp-4]
cmp dword ptr [ebx+8], 6
jne .Lt_009A
push -1
call _fb_Sleep@4
push -1
call _ExitProcess@4
.Lt_009A:
push 5
push dword ptr [ebp-4]
call __ZN11CLIONETHTTP8SETSTATEE17CLIONETHTTP_STATE@8
mov ebx, dword ptr [ebp-4]
mov eax, dword ptr [ebx+96]
mov dword ptr [ebp-8], eax
push 0
push 4096
push dword ptr [ebp-8]
mov eax, dword ptr [ebp-4]
push dword ptr [eax+4]
mov eax, dword ptr [ebp-4]
mov ebx, dword ptr [eax+4]
mov eax, dword ptr [ebx]
call dword ptr [eax+72]
mov dword ptr [ebp-12], eax
mov eax, dword ptr [ebp-4]
cmp dword ptr [eax+108], 0
jne .Lt_009D
mov dword ptr [ebp-16], 0
mov eax, dword ptr [ebp-4]
cmp dword ptr [eax+104], 0
jle .Lt_009F
mov dword ptr [ebp-24], 0
mov word ptr [ebp-20], 0
mov byte ptr [ebp-18], 0
lea eax, [ebp-24]
mov dword ptr [ebp-56], eax
lea eax, [ebp-24]
mov dword ptr [ebp-52], eax
mov dword ptr [ebp-48], 7
mov dword ptr [ebp-44], 1
mov dword ptr [ebp-40], 1
mov dword ptr [ebp-36], 7
mov dword ptr [ebp-32], 0
mov dword ptr [ebp-28], 6
push 3
mov eax, dword ptr [ebp-4]
mov ebx, dword ptr [ebp-4]
mov ecx, dword ptr [eax+100]
add ecx, dword ptr [ebx+104]
add ecx, -3
push ecx
lea ecx, [ebp-24]
push ecx
call _memcpy
add esp, 12
cmp dword ptr [ebp-12], 3
jle .Lt_00A3
push 3
push dword ptr [ebp-8]
lea ecx, [ebp-21]
push ecx
call _memcpy
add esp, 12
jmp .Lt_00A2
.Lt_00A3:
push dword ptr [ebp-12]
push dword ptr [ebp-8]
lea ecx, [ebp-21]
push ecx
call _memcpy
add esp, 12
.Lt_00A2:
push 4
push offset _Lt_00A5
call _fb_StrAllocTempDescZEx@8
push eax
lea eax, [ebp-24]
push eax
call _fb_StrAllocTempDescZ@4
push eax
push 1
call _fb_StrInstr@12
mov dword ptr [ebp-16], eax
.Lt_009F:
.Lt_009E:
cmp dword ptr [ebp-16], 0
jne .Lt_00A7
push 0
push -1
push dword ptr [ebp-12]
call _fb_SPACE@4
push eax
push -1
lea eax, [ebp-28]
push eax
call _fb_StrInit@20
push dword ptr [ebp-12]
push dword ptr [ebp-8]
push dword ptr [ebp-28]
call _memcpy
add esp, 12
push 4
push offset _Lt_00A5
call _fb_StrAllocTempDescZEx@8
push eax
lea eax, [ebp-28]
push eax
push 1
call _fb_StrInstr@12
mov dword ptr [ebp-16], eax
cmp dword ptr [ebp-16], 0
je .Lt_00A9
add dword ptr [ebp-16], 3
.Lt_00A9:
lea eax, [ebp-28]
push eax
call _fb_StrDelete@4
.Lt_00A7:
.Lt_00A6:
cmp dword ptr [ebp-16], 0
je .Lt_00AB
mov eax, dword ptr [ebp-4]
lea ecx, [eax+136]
push ecx
call _EnterCriticalSection@4
mov ecx, dword ptr [ebp-4]
mov eax, dword ptr [ecx+104]
add eax, dword ptr [ebp-16]
mov ecx, eax
push ecx
mov ecx, dword ptr [ebp-4]
push dword ptr [ecx+100]
call _realloc
add esp, 8
mov ecx, dword ptr [ebp-4]
mov dword ptr [ecx+100], eax
push dword ptr [ebp-16]
push dword ptr [ebp-8]
mov eax, dword ptr [ebp-4]
mov ecx, dword ptr [ebp-4]
mov ebx, dword ptr [eax+100]
add ebx, dword ptr [ecx+104]
push ebx
call _memcpy
add esp, 12
mov ebx, dword ptr [ebp-4]
mov ecx, dword ptr [ebp-16]
add dword ptr [ebx+104], ecx
mov ecx, dword ptr [ebp-4]
lea ebx, [ecx+136]
push ebx
call _LeaveCriticalSection@4
mov ebx, dword ptr [ebp-4]
mov dword ptr [ebx+108], 1
push dword ptr [ebp-4]
mov ebx, dword ptr [ebp-4]
mov ecx, dword ptr [ebx]
call dword ptr [ecx+52]
mov ecx, dword ptr [ebp-4]
cmp dword ptr [ecx+124], 0
je .Lt_00AE
mov ecx, dword ptr [ebp-12]
sub ecx, dword ptr [ebp-16]
mov ebx, ecx
push ebx
mov ebx, dword ptr [ebp-4]
push dword ptr [ebx+128]
call _realloc
add esp, 8
mov ebx, dword ptr [ebp-4]
mov dword ptr [ebx+128], eax
mov eax, dword ptr [ebp-12]
sub eax, dword ptr [ebp-16]
push eax
mov eax, dword ptr [ebp-8]
add eax, dword ptr [ebp-16]
push eax
mov eax, dword ptr [ebp-4]
push dword ptr [eax+128]
call _memcpy
add esp, 12
mov eax, dword ptr [ebp-12]
sub eax, dword ptr [ebp-16]
mov ebx, dword ptr [ebp-4]
mov dword ptr [ebx+132], eax
push dword ptr [ebp-4]
call __ZN11CLIONETHTTP10PARSECHUNKEv@4
test eax, eax
jne .Lt_00B0
push 6
push dword ptr [ebp-4]
call __ZN11CLIONETHTTP8SETSTATEE17CLIONETHTTP_STATE@8
.Lt_00B0:
jmp .Lt_00AD
.Lt_00AE:
mov eax, dword ptr [ebp-4]
lea ebx, [eax+160]
push ebx
call _EnterCriticalSection@4
mov ebx, dword ptr [ebp-12]
sub ebx, dword ptr [ebp-16]
mov eax, ebx
push eax
mov eax, dword ptr [ebp-4]
push dword ptr [eax+112]
call _realloc
add esp, 8
mov ebx, dword ptr [ebp-4]
mov dword ptr [ebx+112], eax
mov eax, dword ptr [ebp-12]
sub eax, dword ptr [ebp-16]
push eax
mov eax, dword ptr [ebp-8]
add eax, dword ptr [ebp-16]
push eax
mov eax, dword ptr [ebp-4]
push dword ptr [eax+112]
call _memcpy
add esp, 12
mov eax, dword ptr [ebp-12]
sub eax, dword ptr [ebp-16]
mov ebx, dword ptr [ebp-4]
mov dword ptr [ebx+116], eax
mov eax, dword ptr [ebp-4]
lea ebx, [eax+160]
push ebx
call _LeaveCriticalSection@4
mov ebx, dword ptr [ebp-4]
mov eax, dword ptr [ebp-4]
mov ecx, dword ptr [eax+120]
cmp dword ptr [ebx+116], ecx
jne .Lt_00B2
push 6
push dword ptr [ebp-4]
call __ZN11CLIONETHTTP8SETSTATEE17CLIONETHTTP_STATE@8
.Lt_00B2:
mov ecx, dword ptr [ebp-4]
mov ebx, dword ptr [ebp-4]
mov eax, dword ptr [ebx+120]
cmp dword ptr [ecx+116], eax
jle .Lt_00B4
push -1
call _fb_Sleep@4
push -1
call _ExitProcess@4
.Lt_00B4:
.Lt_00AD:
jmp .Lt_00AA
.Lt_00AB:
mov eax, dword ptr [ebp-4]
lea ecx, [eax+136]
push ecx
call _EnterCriticalSection@4
mov ecx, dword ptr [ebp-4]
mov eax, dword ptr [ecx+104]
add eax, dword ptr [ebp-12]
mov ecx, eax
push ecx
mov ecx, dword ptr [ebp-4]
push dword ptr [ecx+100]
call _realloc
add esp, 8
mov ecx, dword ptr [ebp-4]
mov dword ptr [ecx+100], eax
push dword ptr [ebp-12]
push dword ptr [ebp-8]
mov eax, dword ptr [ebp-4]
mov ecx, dword ptr [ebp-4]
mov ebx, dword ptr [eax+100]
add ebx, dword ptr [ecx+104]
push ebx
call _memcpy
add esp, 12
mov ebx, dword ptr [ebp-4]
mov ecx, dword ptr [ebp-12]
add dword ptr [ebx+104], ecx
mov ecx, dword ptr [ebp-4]
lea ebx, [ecx+136]
push ebx
call _LeaveCriticalSection@4
.Lt_00AA:
jmp .Lt_009C
.Lt_009D:
mov ebx, dword ptr [ebp-4]
cmp dword ptr [ebx+124], 0
je .Lt_00B6
mov ebx, dword ptr [ebp-4]
mov ecx, dword ptr [ebx+132]
add ecx, dword ptr [ebp-12]
mov ebx, ecx
push ebx
mov ebx, dword ptr [ebp-4]
push dword ptr [ebx+128]
call _realloc
add esp, 8
mov ebx, dword ptr [ebp-4]
mov dword ptr [ebx+128], eax
push dword ptr [ebp-12]
push dword ptr [ebp-8]
mov eax, dword ptr [ebp-4]
mov ebx, dword ptr [ebp-4]
mov ecx, dword ptr [eax+128]
add ecx, dword ptr [ebx+132]
push ecx
call _memcpy
add esp, 12
mov ecx, dword ptr [ebp-4]
mov ebx, dword ptr [ebp-12]
add dword ptr [ecx+132], ebx
push dword ptr [ebp-4]
call __ZN11CLIONETHTTP10PARSECHUNKEv@4
test eax, eax
jne .Lt_00B8
push 6
push dword ptr [ebp-4]
call __ZN11CLIONETHTTP8SETSTATEE17CLIONETHTTP_STATE@8
.Lt_00B8:
jmp .Lt_00B5
.Lt_00B6:
mov eax, dword ptr [ebp-4]
lea ebx, [eax+160]
push ebx
call _EnterCriticalSection@4
mov ebx, dword ptr [ebp-4]
mov eax, dword ptr [ebx+116]
add eax, dword ptr [ebp-12]
mov ebx, eax
push ebx
mov ebx, dword ptr [ebp-4]
push dword ptr [ebx+112]
call _realloc
add esp, 8
mov ebx, dword ptr [ebp-4]
mov dword ptr [ebx+112], eax
push dword ptr [ebp-12]
push dword ptr [ebp-8]
mov eax, dword ptr [ebp-4]
mov ebx, dword ptr [ebp-4]
mov ecx, dword ptr [eax+112]
add ecx, dword ptr [ebx+116]
push ecx
call _memcpy
add esp, 12
mov ecx, dword ptr [ebp-4]
mov ebx, dword ptr [ebp-12]
add dword ptr [ecx+116], ebx
mov ebx, dword ptr [ebp-4]
lea ecx, [ebx+160]
push ecx
call _LeaveCriticalSection@4
mov ecx, dword ptr [ebp-4]
mov ebx, dword ptr [ebp-4]
mov eax, dword ptr [ebx+120]
cmp dword ptr [ecx+116], eax
jne .Lt_00BA
push 6
push dword ptr [ebp-4]
call __ZN11CLIONETHTTP8SETSTATEE17CLIONETHTTP_STATE@8
.Lt_00BA:
mov eax, dword ptr [ebp-4]
mov ecx, dword ptr [ebp-4]
mov ebx, dword ptr [ecx+120]
cmp dword ptr [eax+116], ebx
jle .Lt_00BC
push -1
call _fb_Sleep@4
push -1
call _ExitProcess@4
.Lt_00BC:
.Lt_00B5:
.Lt_009C:
.Lt_0097:
.Lt_008B:
.Lt_008A:
pop ebx
mov esp, ebp
pop ebp
ret 12
.balign 16

.globl __ZN11CLIONETHTTP12WAITFORSTATEE17CLIONETHTTP_STATEi@12
__ZN11CLIONETHTTP12WAITFORSTATEE17CLIONETHTTP_STATEi@12:
push ebp
mov ebp, esp
push ebx
.Lt_00BD:
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ebp+12]
mov dword ptr [eax+188], ebx
push dword ptr [ebp+16]
mov ebx, dword ptr [ebp+8]
push dword ptr [ebx+184]
call _WaitForSingleObject@8
cmp eax, 1460
jne .Lt_00C0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+8], -1
.Lt_00C0:
.Lt_00BE:
pop ebx
mov esp, ebp
pop ebp
ret 12
.balign 16

.globl __ZN11CLIONETHTTP8SETSTATEE17CLIONETHTTP_STATE@8
__ZN11CLIONETHTTP8SETSTATEE17CLIONETHTTP_STATE@8:
push ebp
mov ebp, esp
push ebx
.Lt_00C1:
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ebp+12]
mov dword ptr [eax+8], ebx
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebx+188]
test eax, eax
setne al
shr eax, 1
sbb eax, eax
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [ebp+12]
cmp ecx, dword ptr [ebx+188]
sete cl
shr ecx, 1
sbb ecx, ecx
and eax, ecx
je .Lt_00C4
mov ecx, dword ptr [ebp+8]
push dword ptr [ecx+184]
call _SetEvent@4
.Lt_00C4:
.Lt_00C2:
pop ebx
mov esp, ebp
pop ebp
ret 8
.balign 16

.globl __ZN11CLIONETHTTP4OPENER8FBSTRINGS1_ii@20
__ZN11CLIONETHTTP4OPENER8FBSTRINGS1_ii@20:
push ebp
mov ebp, esp
sub esp, 160
push ebx
mov dword ptr [ebp-4], 0
.Lt_00C7:
push 8
push offset _Lt_00C9
push -1
push 0
push 7
push dword ptr [ebp+12]
call _fb_LEFT@8
push eax
call _fb_StrLcase2@8
push eax
call _fb_StrCompare@16
test eax, eax
je .Lt_00CB
mov dword ptr [ebp-4], -1
jmp .Lt_00C8
.Lt_00CB:
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ebp+20]
mov dword ptr [eax+88], ebx
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebp+24]
mov dword ptr [ebx+92], eax
mov dword ptr [ebp-16], 0
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov dword ptr [ebp-28], 0
mov dword ptr [ebp-24], 0
mov dword ptr [ebp-20], 0
push 0
push -1
push -1
push 8
push dword ptr [ebp+12]
call _fb_StrMid@12
push eax
push -1
lea eax, [ebp-28]
push eax
call _fb_StrAssign@20
push 1
push offset _Lt_00CC
call _fb_StrAllocTempDescZEx@8
push eax
lea eax, [ebp-28]
push eax
push 1
call _fb_StrInstr@12
test eax, eax
jne .Lt_00CE
push 0
push 2
push offset _Lt_00CC
push -1
lea eax, [ebp-28]
push eax
call _fb_StrConcatAssign@20
.Lt_00CE:
push 0
push -1
push 1
push offset _Lt_00CC
call _fb_StrAllocTempDescZEx@8
push eax
lea eax, [ebp-28]
push eax
push 1
call _fb_StrInstr@12
dec eax
push eax
lea eax, [ebp-28]
push eax
call _fb_LEFT@8
push eax
push -1
lea eax, [ebp-16]
push eax
call _fb_StrAssign@20
push 1
push offset _Lt_00CF
call _fb_StrAllocTempDescZEx@8
push eax
lea eax, [ebp-16]
push eax
push 1
call _fb_StrInstr@12
test eax, eax
je .Lt_00D1
push 0
push -1
mov dword ptr [ebp-112], 0
mov dword ptr [ebp-108], 0
mov dword ptr [ebp-104], 0
push 0
push -1
push 1
push offset _Lt_00CF
call _fb_StrAllocTempDescZEx@8
push eax
lea eax, [ebp-16]
push eax
push 1
call _fb_StrInstr@12
dec eax
push eax
lea eax, [ebp-16]
push eax
call _fb_LEFT@8
push eax
push -1
lea eax, [ebp-112]
push eax
call _fb_StrAssign@20
lea eax, [ebp-112]
push eax
call _BASE64_ENCODE@4
lea ebx, [ebp-112]
push ebx
mov ebx, eax
call _fb_StrDelete@4
push ebx
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+52]
push eax
call _fb_StrAssign@20
push 0
push -1
push -1
push 1
push offset _Lt_00CF
call _fb_StrAllocTempDescZEx@8
push eax
lea eax, [ebp-16]
push eax
push 1
call _fb_StrInstr@12
inc eax
push eax
lea eax, [ebp-16]
push eax
call _fb_StrMid@12
push eax
push -1
lea eax, [ebp-16]
push eax
call _fb_StrAssign@20
jmp .Lt_00D0
.Lt_00D1:
push 0
push 1
push offset _Lt_0000
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+52]
push ebx
call _fb_StrAssign@20
.Lt_00D0:
push 1
push offset _Lt_00D3
call _fb_StrAllocTempDescZEx@8
push eax
lea eax, [ebp-16]
push eax
push 1
call _fb_StrInstr@12
test eax, eax
je .Lt_00D5
push -1
push 1
push offset _Lt_00D3
call _fb_StrAllocTempDescZEx@8
push eax
lea eax, [ebp-16]
push eax
push 1
call _fb_StrInstr@12
inc eax
push eax
lea eax, [ebp-16]
push eax
call _fb_StrMid@12
push eax
call _fb_VALINT@4
mov ebx, dword ptr [ebp+8]
mov word ptr [ebx+36], ax
push 0
push -1
push 1
push offset _Lt_00D3
call _fb_StrAllocTempDescZEx@8
push eax
lea eax, [ebp-16]
push eax
push 1
call _fb_StrInstr@12
dec eax
push eax
lea eax, [ebp-16]
push eax
call _fb_LEFT@8
push eax
push -1
lea eax, [ebp-16]
push eax
call _fb_StrAssign@20
jmp .Lt_00D4
.Lt_00D5:
mov eax, dword ptr [ebp+8]
mov word ptr [eax+36], 80
.Lt_00D4:
push 0
push -1
lea eax, [ebp-16]
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+24]
push ebx
call _fb_StrAssign@20
push 0
push -1
push -1
push 1
push offset _Lt_00CC
call _fb_StrAllocTempDescZEx@8
push eax
lea eax, [ebp-28]
push eax
push 1
call _fb_StrInstr@12
push eax
lea eax, [ebp-28]
push eax
call _fb_StrMid@12
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+40]
push ebx
call _fb_StrAssign@20
push 0
push -1
push 0
push dword ptr [ebp+16]
call _fb_StrUcase2@8
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+12]
push ebx
call _fb_StrAssign@20
push 0
push -1
push 3
push offset _Lt_00A4
push -1
push 10
push offset _Lt_00D7
push -1
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+40]
push ebx
push -1
push 2
push offset _Lt_00D6
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+12]
push eax
mov dword ptr [ebp-40], 0
mov dword ptr [ebp-36], 0
mov dword ptr [ebp-32], 0
lea eax, [ebp-40]
push eax
call _fb_StrConcat@20
push eax
mov dword ptr [ebp-52], 0
mov dword ptr [ebp-48], 0
mov dword ptr [ebp-44], 0
lea eax, [ebp-52]
push eax
call _fb_StrConcat@20
push eax
mov dword ptr [ebp-64], 0
mov dword ptr [ebp-60], 0
mov dword ptr [ebp-56], 0
lea eax, [ebp-64]
push eax
call _fb_StrConcat@20
push eax
mov dword ptr [ebp-76], 0
mov dword ptr [ebp-72], 0
mov dword ptr [ebp-68], 0
lea eax, [ebp-76]
push eax
call _fb_StrConcat@20
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
call _fb_StrAssign@20
mov eax, dword ptr [ebp+8]
movzx ebx, word ptr [eax+36]
cmp ebx, 80
je .Lt_00DD
push 0
push -1
push -1
push 3
push offset _Lt_00A4
push -1
push -1
mov ebx, dword ptr [ebp+8]
movzx eax, word ptr [ebx+36]
push eax
call _fb_UIntToStr@4
push eax
push -1
push 2
push offset _Lt_00D3
push -1
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+24]
push ebx
push 7
push offset _Lt_00DE
mov dword ptr [ebp-112], 0
mov dword ptr [ebp-108], 0
mov dword ptr [ebp-104], 0
lea ebx, [ebp-112]
push ebx
call _fb_StrConcat@20
push eax
mov dword ptr [ebp-124], 0
mov dword ptr [ebp-120], 0
mov dword ptr [ebp-116], 0
lea eax, [ebp-124]
push eax
call _fb_StrConcat@20
push eax
mov dword ptr [ebp-136], 0
mov dword ptr [ebp-132], 0
mov dword ptr [ebp-128], 0
lea eax, [ebp-136]
push eax
call _fb_StrConcat@20
push eax
mov dword ptr [ebp-148], 0
mov dword ptr [ebp-144], 0
mov dword ptr [ebp-140], 0
lea eax, [ebp-148]
push eax
call _fb_StrConcat@20
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
mov dword ptr [ebp-160], 0
mov dword ptr [ebp-156], 0
mov dword ptr [ebp-152], 0
lea ebx, [ebp-160]
push ebx
call _fb_StrConcat@20
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
call _fb_StrAssign@20
jmp .Lt_00DC
.Lt_00DD:
push 0
push -1
push -1
push 3
push offset _Lt_00A4
push -1
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+24]
push ebx
push 7
push offset _Lt_00DE
mov dword ptr [ebp-112], 0
mov dword ptr [ebp-108], 0
mov dword ptr [ebp-104], 0
lea ebx, [ebp-112]
push ebx
call _fb_StrConcat@20
push eax
mov dword ptr [ebp-124], 0
mov dword ptr [ebp-120], 0
mov dword ptr [ebp-116], 0
lea eax, [ebp-124]
push eax
call _fb_StrConcat@20
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
mov dword ptr [ebp-136], 0
mov dword ptr [ebp-132], 0
mov dword ptr [ebp-128], 0
lea ebx, [ebp-136]
push ebx
call _fb_StrConcat@20
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
call _fb_StrAssign@20
.Lt_00DC:
push 1
push offset _Lt_0000
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+52]
push ebx
call _fb_StrCompare@16
test eax, eax
je .Lt_00E8
push 0
push -1
push -1
push 3
push offset _Lt_00A4
push -1
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+52]
push ebx
push 22
push offset _Lt_00E9
mov dword ptr [ebp-112], 0
mov dword ptr [ebp-108], 0
mov dword ptr [ebp-104], 0
lea ebx, [ebp-112]
push ebx
call _fb_StrConcat@20
push eax
mov dword ptr [ebp-124], 0
mov dword ptr [ebp-120], 0
mov dword ptr [ebp-116], 0
lea eax, [ebp-124]
push eax
call _fb_StrConcat@20
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
mov dword ptr [ebp-136], 0
mov dword ptr [ebp-132], 0
mov dword ptr [ebp-128], 0
lea ebx, [ebp-136]
push ebx
call _fb_StrConcat@20
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
call _fb_StrAssign@20
.Lt_00E8:
.Lt_00E7:
push 0
push -1
push 20
push offset _Lt_00EE
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
mov dword ptr [ebp-88], 0
mov dword ptr [ebp-84], 0
mov dword ptr [ebp-80], 0
lea ebx, [ebp-88]
push ebx
call _fb_StrConcat@20
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
call _fb_StrAssign@20
push 0
push -1
push 14
push offset _Lt_00F1
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
mov dword ptr [ebp-100], 0
mov dword ptr [ebp-96], 0
mov dword ptr [ebp-92], 0
lea ebx, [ebp-100]
push ebx
call _fb_StrConcat@20
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
call _fb_StrAssign@20
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+8], 1
mov eax, dword ptr [ebp+8]
push dword ptr [eax+4]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax+4]
mov eax, dword ptr [ebx]
call dword ptr [eax+4]
mov eax, dword ptr [ebp+8]
movzx ebx, word ptr [eax+36]
push ebx
mov eax, dword ptr [ebp+8]
lea ebx, [eax+24]
push ebx
mov ebx, dword ptr [ebp+8]
push dword ptr [ebx+4]
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebx+4]
mov ebx, dword ptr [eax]
call dword ptr [ebx+20]
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+136]
push eax
call _EnterCriticalSection@4
mov eax, dword ptr [ebp+8]
lea ebx, [eax+160]
push ebx
call _EnterCriticalSection@4
mov ebx, dword ptr [ebp+8]
push dword ptr [ebx+100]
call _free
add esp, 4
mov ebx, dword ptr [ebp+8]
push dword ptr [ebx+112]
call _free
add esp, 4
mov ebx, dword ptr [ebp+8]
push dword ptr [ebx+128]
call _free
add esp, 4
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+100], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+112], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+128], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+104], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+116], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+132], 0
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+160]
push eax
call _LeaveCriticalSection@4
mov eax, dword ptr [ebp+8]
lea ebx, [eax+136]
push ebx
call _LeaveCriticalSection@4
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+108], 0
push 0
push 1
push offset _Lt_0000
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+76]
push eax
call _fb_StrAssign@20
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+88], 0
jne .Lt_00F6
mov eax, dword ptr [ebp+8]
push dword ptr [eax+92]
push 2
push dword ptr [ebp+8]
call __ZN11CLIONETHTTP12WAITFORSTATEE17CLIONETHTTP_STATEi@12
.Lt_00F6:
.Lt_00F5:
mov dword ptr [ebp-4], 0
lea eax, [ebp-28]
push eax
call _fb_StrDelete@4
lea eax, [ebp-16]
push eax
call _fb_StrDelete@4
jmp .Lt_00C8
lea eax, [ebp-28]
push eax
call _fb_StrDelete@4
lea eax, [ebp-16]
push eax
call _fb_StrDelete@4
.Lt_00C8:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 20
.balign 16

.globl __ZN11CLIONETHTTP4SENDER8FBSTRINGS1_@12
__ZN11CLIONETHTTP4SENDER8FBSTRINGS1_@12:
push ebp
mov ebp, esp
sub esp, 76
push ebx
mov dword ptr [ebp-4], 0
.Lt_00F7:
push -1
push dword ptr [ebp+12]
call _fb_StrLen@8
test eax, eax
je .Lt_00FA
push dword ptr [ebp+16]
mov dword ptr [ebp-52], 0
mov dword ptr [ebp-48], 0
mov dword ptr [ebp-44], 0
push 0
push 13
push offset _Lt_00FC
push -1
lea eax, [ebp-52]
push eax
call _fb_StrAssign@20
lea eax, [ebp-52]
push eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+8]
lea ebx, [ebp-52]
push ebx
call _fb_StrDelete@4
mov dword ptr [ebp-76], 0
mov dword ptr [ebp-72], 0
mov dword ptr [ebp-68], 0
push 0
push -1
push -1
push dword ptr [ebp+12]
call _fb_StrLen@8
push eax
call _fb_IntToStr@4
push eax
push -1
lea eax, [ebp-76]
push eax
call _fb_StrAssign@20
lea eax, [ebp-76]
push eax
mov dword ptr [ebp-64], 0
mov dword ptr [ebp-60], 0
mov dword ptr [ebp-56], 0
push 0
push 15
push offset _Lt_00FE
push -1
lea eax, [ebp-64]
push eax
call _fb_StrAssign@20
lea eax, [ebp-64]
push eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+8]
lea ebx, [ebp-76]
push ebx
call _fb_StrDelete@4
lea ebx, [ebp-64]
push ebx
call _fb_StrDelete@4
.Lt_00FA:
.Lt_00F9:
push 0
push -1
push 3
push offset _Lt_00A4
push -1
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+64]
push eax
mov dword ptr [ebp-16], 0
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
lea eax, [ebp-16]
push eax
call _fb_StrConcat@20
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
call _fb_StrAssign@20
push 0
push -1
push -1
push dword ptr [ebp+12]
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
mov dword ptr [ebp-40], 0
mov dword ptr [ebp-36], 0
mov dword ptr [ebp-32], 0
lea ebx, [ebp-40]
push ebx
call _fb_StrConcat@20
push eax
push -1
lea eax, [ebp-28]
push eax
call _fb_StrInit@20
push -1
lea eax, [ebp-28]
push eax
call _fb_StrLen@8
push eax
push dword ptr [ebp-28]
mov eax, dword ptr [ebp+8]
push dword ptr [eax+4]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax+4]
mov eax, dword ptr [ebx]
call dword ptr [eax+68]
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+8], 3
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+88], 0
jne .Lt_0105
mov eax, dword ptr [ebp+8]
push dword ptr [eax+92]
push 6
push dword ptr [ebp+8]
call __ZN11CLIONETHTTP12WAITFORSTATEE17CLIONETHTTP_STATEi@12
.Lt_0105:
.Lt_0104:
mov dword ptr [ebp-4], 0
lea eax, [ebp-28]
push eax
call _fb_StrDelete@4
jmp .Lt_00F8
lea eax, [ebp-28]
push eax
call _fb_StrDelete@4
.Lt_00F8:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 12
.balign 16

.globl __ZN11CLIONETHTTP19PARSERESPONSEHEADEREv@4
__ZN11CLIONETHTTP19PARSERESPONSEHEADEREv@4:
push ebp
mov ebp, esp
sub esp, 36
push ebx
.Lt_0106:
mov eax, dword ptr [ebp+8]
lea ebx, [eax+136]
push ebx
call _EnterCriticalSection@4
push 0
push -1
mov ebx, dword ptr [ebp+8]
push dword ptr [ebx+104]
call _fb_SPACE@4
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+76]
push ebx
call _fb_StrAssign@20
mov eax, dword ptr [ebp+8]
push dword ptr [eax+104]
mov eax, dword ptr [ebp+8]
push dword ptr [eax+100]
mov eax, dword ptr [ebp+8]
push dword ptr [eax+76]
call _memcpy
add esp, 12
mov eax, dword ptr [ebp+8]
push dword ptr [eax+100]
call _free
add esp, 4
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+100], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+104], 0
push 1
push offset _Lt_0000
push -1
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov dword ptr [ebp-4], 0
push 0
push 15
push offset _Lt_00FE
push -1
lea eax, [ebp-12]
push eax
call _fb_StrAssign@20
lea eax, [ebp-12]
push eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+20]
lea ebx, [ebp-12]
push ebx
mov ebx, eax
call _fb_StrDelete@4
push ebx
call _fb_StrCompare@16
test eax, eax
je .Lt_010B
mov dword ptr [ebp-36], 0
mov dword ptr [ebp-32], 0
mov dword ptr [ebp-28], 0
push 0
push 15
push offset _Lt_00FE
push -1
lea eax, [ebp-36]
push eax
call _fb_StrAssign@20
lea eax, [ebp-36]
push eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+20]
lea ebx, [ebp-36]
push ebx
mov ebx, eax
call _fb_StrDelete@4
push ebx
call _fb_VALINT@4
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+120], eax
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+124], 0
jmp .Lt_010A
.Lt_010B:
push 8
push offset _Lt_0110
push -1
push 0
mov dword ptr [ebp-24], 0
mov dword ptr [ebp-20], 0
mov dword ptr [ebp-16], 0
push 0
push 18
push offset _Lt_010E
push -1
lea eax, [ebp-24]
push eax
call _fb_StrAssign@20
lea eax, [ebp-24]
push eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+20]
lea ebx, [ebp-24]
push ebx
mov ebx, eax
call _fb_StrDelete@4
push ebx
call _fb_StrLcase2@8
push eax
call _fb_StrCompare@16
test eax, eax
jne .Lt_010D
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+124], -1
jmp .Lt_010A
.Lt_010D:
push -1
call _fb_Sleep@4
push -1
call _ExitProcess@4
.Lt_010A:
mov eax, dword ptr [ebp+8]
lea ebx, [eax+136]
push ebx
call _LeaveCriticalSection@4
.Lt_0107:
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN11CLIONETHTTP11_PARSECHUNKEv@4
__ZN11CLIONETHTTP11_PARSECHUNKEv@4:
push ebp
mov ebp, esp
sub esp, 40
push ebx
mov dword ptr [ebp-4], 0
.Lt_0111:
push 0
push -1
mov eax, dword ptr [ebp+8]
push dword ptr [eax+132]
mov eax, dword ptr [ebp+8]
push dword ptr [eax+128]
call _fb_StrAllocTempDescZ@4
push eax
call _fb_LEFT@8
push eax
push -1
lea eax, [ebp-16]
push eax
call _fb_StrInit@20
push 2
push offset _Lt_00A4
call _fb_StrAllocTempDescZEx@8
push eax
lea eax, [ebp-16]
push eax
push 1
call _fb_StrInstr@12
mov dword ptr [ebp-20], eax
cmp dword ptr [ebp-20], 0
jne .Lt_0114
mov dword ptr [ebp-4], -1
lea eax, [ebp-16]
push eax
call _fb_StrDelete@4
jmp .Lt_0112
.Lt_0114:
push -1
mov eax, dword ptr [ebp-20]
dec eax
push eax
lea eax, [ebp-16]
push eax
call _fb_LEFT@8
push eax
push 3
push offset _Lt_0115
mov dword ptr [ebp-36], 0
mov dword ptr [ebp-32], 0
mov dword ptr [ebp-28], 0
lea eax, [ebp-36]
push eax
call _fb_StrConcat@20
push eax
call _fb_VALINT@4
mov dword ptr [ebp-24], eax
cmp dword ptr [ebp-24], 0
jne .Lt_0118
mov eax, dword ptr [ebp+8]
push dword ptr [eax+128]
call _free
add esp, 4
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+128], 0
mov dword ptr [ebp-4], 0
lea eax, [ebp-16]
push eax
call _fb_StrDelete@4
jmp .Lt_0112
.Lt_0118:
mov eax, dword ptr [ebp-24]
add eax, dword ptr [ebp-20]
add eax, 3
mov dword ptr [ebp-40], eax
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ebp-40]
cmp dword ptr [eax+132], ebx
jl .Lt_011A
mov ebx, dword ptr [ebp+8]
lea eax, [ebx+160]
push eax
call _EnterCriticalSection@4
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax+116]
add ebx, dword ptr [ebp-24]
mov eax, ebx
push eax
mov eax, dword ptr [ebp+8]
push dword ptr [eax+112]
call _realloc
add esp, 8
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+112], eax
push dword ptr [ebp-24]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax+128]
add ebx, dword ptr [ebp-20]
inc ebx
push ebx
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ecx, dword ptr [ebx+112]
add ecx, dword ptr [eax+116]
push ecx
call _memcpy
add esp, 12
mov ecx, dword ptr [ebp+8]
mov eax, dword ptr [ebp-24]
add dword ptr [ecx+116], eax
mov eax, dword ptr [ebp+8]
lea ecx, [eax+160]
push ecx
call _LeaveCriticalSection@4
mov ecx, dword ptr [ebp+8]
mov eax, dword ptr [ebp-40]
sub dword ptr [ecx+132], eax
mov eax, dword ptr [ebp+8]
push dword ptr [eax+132]
mov eax, dword ptr [ebp+8]
mov ecx, dword ptr [eax+128]
add ecx, dword ptr [ebp-40]
push ecx
mov ecx, dword ptr [ebp+8]
push dword ptr [ecx+128]
call _memcpy
add esp, 12
mov ecx, dword ptr [ebp+8]
push dword ptr [ecx+132]
mov ecx, dword ptr [ebp+8]
push dword ptr [ecx+128]
call _realloc
add esp, 8
mov ecx, dword ptr [ebp+8]
mov dword ptr [ecx+128], eax
mov eax, dword ptr [ebp-24]
mov dword ptr [ebp-4], eax
lea eax, [ebp-16]
push eax
call _fb_StrDelete@4
jmp .Lt_0112
.Lt_011A:
.Lt_0119:
mov dword ptr [ebp-4], -1
lea eax, [ebp-16]
push eax
call _fb_StrDelete@4
jmp .Lt_0112
lea eax, [ebp-16]
push eax
call _fb_StrDelete@4
.Lt_0112:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN11CLIONETHTTP10PARSECHUNKEv@4
__ZN11CLIONETHTTP10PARSECHUNKEv@4:
push ebp
mov ebp, esp
sub esp, 8
mov dword ptr [ebp-4], 0
.Lt_011B:
mov dword ptr [ebp-8], 0
.Lt_011D:
push dword ptr [ebp+8]
call __ZN11CLIONETHTTP11_PARSECHUNKEv@4
mov dword ptr [ebp-8], eax
.Lt_011F:
cmp dword ptr [ebp-8], 0
jg .Lt_011D
.Lt_011E:
mov eax, dword ptr [ebp-8]
mov dword ptr [ebp-4], eax
.Lt_011C:
mov eax, dword ptr [ebp-4]
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN11CLIONETHTTP19REMOVEREQUESTHEADERER8FBSTRING@8
__ZN11CLIONETHTTP19REMOVEREQUESTHEADERER8FBSTRING@8:
push ebp
mov ebp, esp
sub esp, 68
push ebx
.Lt_0120:
push -1
push dword ptr [ebp+12]
push 3
push offset _Lt_00A4
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov dword ptr [ebp-4], 0
lea eax, [ebp-12]
push eax
call _fb_StrConcat@20
push eax
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
push 1
call _fb_StrInstr@12
test eax, eax
jne .Lt_0124
jmp .Lt_0121
.Lt_0124:
push -1
push dword ptr [ebp+12]
push 3
push offset _Lt_00A4
mov dword ptr [ebp-28], 0
mov dword ptr [ebp-24], 0
mov dword ptr [ebp-20], 0
lea eax, [ebp-28]
push eax
call _fb_StrConcat@20
push eax
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
push 1
call _fb_StrInstr@12
inc eax
mov dword ptr [ebp-16], eax
push 2
push offset _Lt_00A4
call _fb_StrAllocTempDescZEx@8
push eax
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
push dword ptr [ebp-16]
call _fb_StrInstr@12
inc eax
mov dword ptr [ebp-32], eax
push 0
push -1
push dword ptr [ebp-16]
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
call _fb_LEFT@8
push eax
push -1
lea eax, [ebp-44]
push eax
call _fb_StrInit@20
push 0
push -1
push -1
mov eax, dword ptr [ebp-32]
inc eax
push eax
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
call _fb_StrMid@12
push eax
push -1
lea eax, [ebp-56]
push eax
call _fb_StrInit@20
push 0
push -1
push -1
lea eax, [ebp-56]
push eax
push -1
lea eax, [ebp-44]
push eax
mov dword ptr [ebp-68], 0
mov dword ptr [ebp-64], 0
mov dword ptr [ebp-60], 0
lea eax, [ebp-68]
push eax
call _fb_StrConcat@20
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
call _fb_StrAssign@20
lea eax, [ebp-56]
push eax
call _fb_StrDelete@4
lea eax, [ebp-44]
push eax
call _fb_StrDelete@4
.Lt_0121:
pop ebx
mov esp, ebp
pop ebp
ret 8
.balign 16

.globl __ZN11CLIONETHTTP16SETREQUESTHEADERER8FBSTRINGS1_@12
__ZN11CLIONETHTTP16SETREQUESTHEADERER8FBSTRINGS1_@12:
push ebp
mov ebp, esp
sub esp, 48
push ebx
.Lt_0127:
push dword ptr [ebp+12]
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+12]
push 0
push -1
push -1
push 3
push offset _Lt_00A4
push -1
push -1
push dword ptr [ebp+16]
push -1
push 3
push offset _Lt_012A
push -1
push dword ptr [ebp+12]
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov dword ptr [ebp-4], 0
lea ebx, [ebp-12]
push ebx
call _fb_StrConcat@20
push eax
mov dword ptr [ebp-24], 0
mov dword ptr [ebp-20], 0
mov dword ptr [ebp-16], 0
lea eax, [ebp-24]
push eax
call _fb_StrConcat@20
push eax
mov dword ptr [ebp-36], 0
mov dword ptr [ebp-32], 0
mov dword ptr [ebp-28], 0
lea eax, [ebp-36]
push eax
call _fb_StrConcat@20
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
mov dword ptr [ebp-48], 0
mov dword ptr [ebp-44], 0
mov dword ptr [ebp-40], 0
lea ebx, [ebp-48]
push ebx
call _fb_StrConcat@20
push eax
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+64]
push ebx
call _fb_StrAssign@20
.Lt_0128:
pop ebx
mov esp, ebp
pop ebp
ret 12
.balign 16

.globl __ZN11CLIONETHTTP17GETRESPONSEHEADERER8FBSTRING@8
__ZN11CLIONETHTTP17GETRESPONSEHEADERER8FBSTRING@8:
push ebp
mov ebp, esp
sub esp, 44
push ebx
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov dword ptr [ebp-4], 0
.Lt_012F:
push -1
push dword ptr [ebp+12]
push 3
push offset _Lt_00A4
mov dword ptr [ebp-28], 0
mov dword ptr [ebp-24], 0
mov dword ptr [ebp-20], 0
lea eax, [ebp-28]
push eax
call _fb_StrConcat@20
push eax
mov eax, dword ptr [ebp+8]
lea ebx, [eax+76]
push ebx
push 1
call _fb_StrInstr@12
mov dword ptr [ebp-16], eax
cmp dword ptr [ebp-16], 0
jne .Lt_0133
push 0
push 1
push offset _Lt_0000
push -1
lea eax, [ebp-12]
push eax
call _fb_StrAssign@20
jmp .Lt_0130
.Lt_0133:
push 1
push offset _Lt_00D3
call _fb_StrAllocTempDescZEx@8
push eax
mov eax, dword ptr [ebp+8]
lea ebx, [eax+76]
push ebx
push -1
push -1
push dword ptr [ebp+12]
push 3
push offset _Lt_00A4
mov dword ptr [ebp-40], 0
mov dword ptr [ebp-36], 0
mov dword ptr [ebp-32], 0
lea ebx, [ebp-40]
push ebx
call _fb_StrConcat@20
push eax
call _fb_StrLen@8
add eax, dword ptr [ebp-16]
push eax
call _fb_StrInstr@12
inc eax
mov dword ptr [ebp-16], eax
push 2
push offset _Lt_00A4
call _fb_StrAllocTempDescZEx@8
push eax
mov eax, dword ptr [ebp+8]
lea ebx, [eax+76]
push ebx
push dword ptr [ebp-16]
call _fb_StrInstr@12
mov dword ptr [ebp-44], eax
push 0
push -1
mov eax, dword ptr [ebp-44]
sub eax, dword ptr [ebp-16]
dec eax
push eax
mov eax, dword ptr [ebp-16]
inc eax
push eax
mov eax, dword ptr [ebp+8]
lea ebx, [eax+76]
push ebx
call _fb_StrMid@12
push eax
call _fb_TRIM@4
push eax
push -1
lea eax, [ebp-12]
push eax
call _fb_StrAssign@20
.Lt_0130:
lea eax, [ebp-12]
push eax
call _fb_StrAllocTempResult@4
pop ebx
mov esp, ebp
pop ebp
ret 8
.balign 16

.globl __ZN11CLIONETHTTP12STATE__get__Ev@4
__ZN11CLIONETHTTP12STATE__get__Ev@4:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_0135:
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax+8]
mov dword ptr [ebp-4], ebx
.Lt_0136:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN11CLIONETHTTP24RESPONSERAWHEADER__get__Ev@4
__ZN11CLIONETHTTP24RESPONSERAWHEADER__get__Ev@4:
push ebp
mov ebp, esp
sub esp, 12
push ebx
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov dword ptr [ebp-4], 0
.Lt_0137:
push 0
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+76]
push ebx
push -1
lea ebx, [ebp-12]
push ebx
call _fb_StrAssign@20
.Lt_0138:
lea eax, [ebp-12]
push eax
call _fb_StrAllocTempResult@4
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN11CLIONETHTTP21RESPONSENUMBER__get__Ev@4
__ZN11CLIONETHTTP21RESPONSENUMBER__get__Ev@4:
push ebp
mov ebp, esp
sub esp, 12
push ebx
mov dword ptr [ebp-4], 0
.Lt_0139:
push 1
push offset _Lt_00D6
call _fb_StrAllocTempDescZEx@8
push eax
mov eax, dword ptr [ebp+8]
lea ebx, [eax+76]
push ebx
push 1
call _fb_StrInstr@12
mov dword ptr [ebp-8], eax
push 1
push offset _Lt_00D6
call _fb_StrAllocTempDescZEx@8
push eax
mov eax, dword ptr [ebp+8]
lea ebx, [eax+76]
push ebx
mov ebx, dword ptr [ebp-8]
inc ebx
push ebx
call _fb_StrInstr@12
mov dword ptr [ebp-12], eax
mov eax, dword ptr [ebp-12]
sub eax, dword ptr [ebp-8]
dec eax
push eax
mov eax, dword ptr [ebp-8]
inc eax
push eax
mov eax, dword ptr [ebp+8]
lea ebx, [eax+76]
push ebx
call _fb_StrMid@12
push eax
call _fb_VALINT@4
mov dword ptr [ebp-4], eax
.Lt_013A:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN11CLIONETHTTP26RESPONSEDESCRIPTION__get__Ev@4
__ZN11CLIONETHTTP26RESPONSEDESCRIPTION__get__Ev@4:
push ebp
mov ebp, esp
sub esp, 20
push ebx
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov dword ptr [ebp-4], 0
.Lt_013B:
push 1
push offset _Lt_00D6
call _fb_StrAllocTempDescZEx@8
push eax
mov eax, dword ptr [ebp+8]
lea ebx, [eax+76]
push ebx
push 1
call _fb_StrInstr@12
mov dword ptr [ebp-16], eax
push 1
push offset _Lt_00D6
call _fb_StrAllocTempDescZEx@8
push eax
mov eax, dword ptr [ebp+8]
lea ebx, [eax+76]
push ebx
mov ebx, dword ptr [ebp-16]
inc ebx
push ebx
call _fb_StrInstr@12
mov dword ptr [ebp-16], eax
push 2
push offset _Lt_00A4
call _fb_StrAllocTempDescZEx@8
push eax
mov eax, dword ptr [ebp+8]
lea ebx, [eax+76]
push ebx
mov ebx, dword ptr [ebp-16]
inc ebx
push ebx
call _fb_StrInstr@12
mov dword ptr [ebp-20], eax
push 0
push -1
mov eax, dword ptr [ebp-20]
sub eax, dword ptr [ebp-16]
dec eax
push eax
mov eax, dword ptr [ebp-16]
inc eax
push eax
mov eax, dword ptr [ebp+8]
lea ebx, [eax+76]
push ebx
call _fb_StrMid@12
push eax
push -1
lea eax, [ebp-12]
push eax
call _fb_StrAssign@20
.Lt_013C:
lea eax, [ebp-12]
push eax
call _fb_StrAllocTempResult@4
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN11CLIONETHTTP21RESPONSESTRING__get__Ev@4
__ZN11CLIONETHTTP21RESPONSESTRING__get__Ev@4:
push ebp
mov ebp, esp
sub esp, 24
push ebx
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov dword ptr [ebp-4], 0
.Lt_013D:
mov eax, dword ptr [ebp+8]
lea ebx, [eax+160]
push ebx
call _EnterCriticalSection@4
push 0
push -1
mov ebx, dword ptr [ebp+8]
push dword ptr [ebx+116]
call _fb_SPACE@4
push eax
push -1
lea eax, [ebp-24]
push eax
call _fb_StrInit@20
mov eax, dword ptr [ebp+8]
push dword ptr [eax+116]
mov eax, dword ptr [ebp+8]
push dword ptr [eax+112]
push dword ptr [ebp-24]
call _memcpy
add esp, 12
mov eax, dword ptr [ebp+8]
lea ebx, [eax+160]
push ebx
call _LeaveCriticalSection@4
push 0
push -1
lea ebx, [ebp-24]
push ebx
push -1
lea ebx, [ebp-12]
push ebx
call _fb_StrAssign@20
lea eax, [ebp-24]
push eax
call _fb_StrDelete@4
jmp .Lt_013E
lea eax, [ebp-24]
push eax
call _fb_StrDelete@4
.Lt_013E:
lea eax, [ebp-12]
push eax
call _fb_StrAllocTempResult@4
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN11CLIONETHTTP20RESPONSEBYTES__get__Ev@4
__ZN11CLIONETHTTP20RESPONSEBYTES__get__Ev@4:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_013F:
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax+112]
mov dword ptr [ebp-4], ebx
.Lt_0140:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN11CLIONETHTTP21RESPONSELENGTH__get__Ev@4
__ZN11CLIONETHTTP21RESPONSELENGTH__get__Ev@4:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_0141:
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax+116]
mov dword ptr [ebp-4], ebx
.Lt_0142:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 4
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
_BASE64_ENCODE@4:
push ebp
mov ebp, esp
sub esp, 40
push ebx
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov dword ptr [ebp-4], 0
.Lt_0143:
push 0
push 65
push offset _Lt_0146
push -1
push offset _Lt_0160
call _fb_StrAssign@20
push -1
push dword ptr [ebp+8]
call _fb_StrLen@8
mov dword ptr [ebp-16], eax
mov dword ptr [ebp-20], 0
mov dword ptr [ebp-24], 0
push 0
push 1
push offset _Lt_0000
push -1
lea eax, [ebp-36]
push eax
call _fb_StrInit@20
cmp dword ptr [ebp-16], 0
jne .Lt_0148
push 0
push -1
lea eax, [ebp-36]
push eax
push -1
lea eax, [ebp-12]
push eax
call _fb_StrAssign@20
lea eax, [ebp-36]
push eax
call _fb_StrDelete@4
jmp .Lt_0144
.Lt_0148:
push 0
push -1
push 1
push offset _Lt_0149
call _fb_StrAllocTempDescZEx@8
push eax
mov eax, dword ptr [ebp-16]
add eax, 2
mov ecx, 3
cdq
idiv ecx
sal eax, 2
push eax
call _fb_StrFill2@8
push eax
push -1
lea eax, [ebp-36]
push eax
call _fb_StrAssign@20
mov dword ptr [ebp-24], 0
mov eax, dword ptr [ebp-16]
mov ecx, 3
cdq
idiv ecx
mov eax, edx
mov ebx, dword ptr [ebp-16]
sub ebx, eax
dec ebx
mov dword ptr [ebp-40], ebx
jmp .Lt_014B
.Lt_014E:
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebx]
add eax, dword ptr [ebp-24]
movzx ebx, byte ptr [eax]
sar ebx, 2
mov eax, dword ptr [_Lt_0160]
add eax, ebx
mov ebx, dword ptr [ebp-36]
add ebx, dword ptr [ebp-20]
mov cl, byte ptr [eax]
mov byte ptr [ebx], cl
mov ecx, dword ptr [ebp+8]
mov ebx, dword ptr [ecx]
add ebx, dword ptr [ebp-24]
movzx ecx, byte ptr [ebx]
and ecx, 3
sal ecx, 4
mov ebx, dword ptr [_Lt_0160]
add ebx, ecx
mov ecx, dword ptr [ebp+8]
mov eax, dword ptr [ecx]
add eax, dword ptr [ebp-24]
movzx ecx, byte ptr [eax+1]
sar ecx, 4
add ebx, ecx
mov ecx, dword ptr [ebp-36]
add ecx, dword ptr [ebp-20]
mov al, byte ptr [ebx]
mov byte ptr [ecx+1], al
mov eax, dword ptr [ebp+8]
mov ecx, dword ptr [eax]
add ecx, dword ptr [ebp-24]
movzx eax, byte ptr [ecx+1]
and eax, 15
sal eax, 2
mov ecx, dword ptr [_Lt_0160]
add ecx, eax
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
add ebx, dword ptr [ebp-24]
movzx eax, byte ptr [ebx+2]
sar eax, 6
add ecx, eax
mov eax, dword ptr [ebp-36]
add eax, dword ptr [ebp-20]
mov bl, byte ptr [ecx]
mov byte ptr [eax+2], bl
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebx]
add eax, dword ptr [ebp-24]
movzx ebx, byte ptr [eax+2]
and ebx, 63
mov eax, dword ptr [_Lt_0160]
add eax, ebx
mov ebx, dword ptr [ebp-36]
add ebx, dword ptr [ebp-20]
mov cl, byte ptr [eax]
mov byte ptr [ebx+3], cl
add dword ptr [ebp-20], 4
.Lt_014C:
add dword ptr [ebp-24], 3
.Lt_014B:
mov ecx, dword ptr [ebp-40]
cmp dword ptr [ebp-24], ecx
jle .Lt_014E
.Lt_014D:
mov ecx, dword ptr [ebp-16]
push ecx
mov ecx, 3
pop eax
cdq
idiv ecx
mov eax, edx
mov ecx, eax
cmp ecx, 2
jne .Lt_0150
mov ecx, dword ptr [ebp+8]
mov ebx, dword ptr [ecx]
add ebx, dword ptr [ebp-24]
movzx ecx, byte ptr [ebx]
sar ecx, 2
mov ebx, dword ptr [_Lt_0160]
add ebx, ecx
mov ecx, dword ptr [ebp-36]
add ecx, dword ptr [ebp-20]
mov al, byte ptr [ebx]
mov byte ptr [ecx], al
mov eax, dword ptr [ebp+8]
mov ecx, dword ptr [eax]
add ecx, dword ptr [ebp-24]
movzx eax, byte ptr [ecx]
and eax, 3
sal eax, 4
mov ecx, dword ptr [_Lt_0160]
add ecx, eax
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
add ebx, dword ptr [ebp-24]
movzx eax, byte ptr [ebx+1]
sar eax, 4
add ecx, eax
mov eax, dword ptr [ebp-36]
add eax, dword ptr [ebp-20]
mov bl, byte ptr [ecx]
mov byte ptr [eax+1], bl
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebx]
add eax, dword ptr [ebp-24]
movzx ebx, byte ptr [eax+1]
and ebx, 15
sal ebx, 2
mov eax, dword ptr [_Lt_0160]
add eax, ebx
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [ebx]
add ecx, dword ptr [ebp-24]
movzx ebx, byte ptr [ecx+2]
sar ebx, 6
add eax, ebx
mov ebx, dword ptr [ebp-36]
add ebx, dword ptr [ebp-20]
mov cl, byte ptr [eax]
mov byte ptr [ebx+2], cl
mov ecx, dword ptr [ebp-36]
add ecx, dword ptr [ebp-20]
mov byte ptr [ecx+3], 61
jmp .Lt_014F
.Lt_0150:
mov ecx, dword ptr [ebp-16]
push ecx
mov ecx, 3
pop eax
cdq
idiv ecx
mov eax, edx
mov ecx, eax
cmp ecx, 1
jne .Lt_0151
mov ecx, dword ptr [ebp+8]
mov ebx, dword ptr [ecx]
add ebx, dword ptr [ebp-24]
movzx ecx, byte ptr [ebx]
sar ecx, 2
mov ebx, dword ptr [_Lt_0160]
add ebx, ecx
mov ecx, dword ptr [ebp-36]
add ecx, dword ptr [ebp-20]
mov al, byte ptr [ebx]
mov byte ptr [ecx], al
mov eax, dword ptr [ebp+8]
mov ecx, dword ptr [eax]
add ecx, dword ptr [ebp-24]
movzx eax, byte ptr [ecx]
and eax, 3
sal eax, 4
mov ecx, dword ptr [_Lt_0160]
add ecx, eax
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
add ebx, dword ptr [ebp-24]
movzx eax, byte ptr [ebx+1]
sar eax, 4
add ecx, eax
mov eax, dword ptr [ebp-36]
add eax, dword ptr [ebp-20]
mov bl, byte ptr [ecx]
mov byte ptr [eax+1], bl
mov ebx, dword ptr [ebp-36]
add ebx, dword ptr [ebp-20]
mov byte ptr [ebx+2], 61
mov ebx, dword ptr [ebp-36]
add ebx, dword ptr [ebp-20]
mov byte ptr [ebx+3], 61
.Lt_0151:
.Lt_014F:
push 0
push -1
lea ebx, [ebp-36]
push ebx
push -1
lea ebx, [ebp-12]
push ebx
call _fb_StrAssign@20
lea eax, [ebp-36]
push eax
call _fb_StrDelete@4
jmp .Lt_0144
lea eax, [ebp-36]
push eax
call _fb_StrDelete@4
.Lt_0144:
lea eax, [ebp-12]
push eax
call _fb_StrAllocTempResult@4
pop ebx
mov esp, ebp
pop ebp
ret 4

.section .bss
.balign 4
	.lcomm	_Lt_0160,12
	#..\src\CLionetHttp.bas' compilation took 0.05292976969792562 secs

.section .data
.balign 4
_Lt_0000:	.ascii	"\0"
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
_Lt_00A4:	.ascii	"\r\n\0"
.balign 4
_Lt_00A5:	.ascii	"\r\n\r\n\0"
.balign 4
_Lt_00C9:	.ascii	"http://\0"
.balign 4
_Lt_00CC:	.ascii	"/\0"
.balign 4
_Lt_00CF:	.ascii	"@\0"
.balign 4
_Lt_00D3:	.ascii	":\0"
.balign 4
_Lt_00D6:	.ascii	" \0"
.balign 4
_Lt_00D7:	.ascii	" HTTP/1.1\0"
.balign 4
_Lt_00DE:	.ascii	"Host: \0"
.balign 4
_Lt_00E9:	.ascii	"Authorization: Basic \0"
.balign 4
_Lt_00EE:	.ascii	"Connection: close\r\n\0"
.balign 4
_Lt_00F1:	.ascii	"Accept: */*\r\n\0"
.balign 4
_Lt_00FC:	.ascii	"Content-Type\0"
.balign 4
_Lt_00FE:	.ascii	"Content-Length\0"
.balign 4
_Lt_010E:	.ascii	"Transfer-Encoding\0"
.balign 4
_Lt_0110:	.ascii	"chunked\0"
.balign 4
_Lt_0115:	.ascii	"&h\0"
.balign 4
_Lt_012A:	.ascii	": \0"
.balign 4
_Lt_0146:	.ascii	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\0"
.balign 4
_Lt_0149:	.ascii	"=\0"
