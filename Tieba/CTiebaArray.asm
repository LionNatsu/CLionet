	.intel_syntax noprefix

	#CTiebaArray.bas' compilation started at 21:07:29 (FreeBASIC 0.90.0)

.section .text
.balign 16

.globl __ZN6CTIEBA11CTIEBAARRAYD1Ev
__ZN6CTIEBA11CTIEBAARRAYD1Ev:
push ebp
mov ebp, esp
.Lt_00CA:
push dword ptr [ebp+8]
call __ZN6CTIEBA11CTIEBAARRAY5CLEAREv@4
.Lt_00CB:
mov esp, ebp
pop ebp
ret
.balign 16

.globl __ZN6CTIEBA11CTIEBAARRAYaSERS_@8
__ZN6CTIEBA11CTIEBAARRAYaSERS_@8:
push ebp
mov ebp, esp
sub esp, 8
push ebx
push esi
.Lt_00CC:
push 1
push 1
push offset _Lt_00CE
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push dword ptr [ebp+8]
call __ZN6CTIEBA11CTIEBAARRAYD1Ev
add esp, 4
push 20
push dword ptr [ebp+12]
push dword ptr [ebp+8]
call _memcpy
add esp, 12
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+4], 0
je .Lt_00D0
mov eax, dword ptr [ebp+8]
mov ebx, 4
imul ebx, dword ptr [eax+16]
mov ecx, ebx
push ecx
call _malloc
add esp, 4
mov ecx, dword ptr [ebp+8]
mov dword ptr [ecx+12], eax
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+16], 0
jne .Lt_00D2
jmp .Lt_00CD
.Lt_00D2:
mov dword ptr [ebp-4], 0
mov eax, dword ptr [ebp+8]
mov ecx, dword ptr [eax+16]
dec ecx
mov dword ptr [ebp-8], ecx
jmp .Lt_00D4
.Lt_00D7:
push 1
push 1
push offset _Lt_00CE
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
mov eax, dword ptr [ebp+12]
mov ecx, dword ptr [ebp-4]
sal ecx, 2
mov ebx, dword ptr [eax+12]
add ebx, ecx
push dword ptr [ebx-4]
mov ebx, dword ptr [ebp+8]
call dword ptr [ebx+4]
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [ebp-4]
sal ecx, 2
mov esi, dword ptr [ebx+12]
add esi, ecx
mov dword ptr [esi-4], eax
.Lt_00D5:
inc dword ptr [ebp-4]
.Lt_00D4:
mov eax, dword ptr [ebp-8]
cmp dword ptr [ebp-4], eax
jle .Lt_00D7
.Lt_00D6:
.Lt_00D0:
.Lt_00CF:
.Lt_00CD:
pop esi
pop ebx
mov esp, ebp
pop ebp
ret 8
.balign 16

.globl __ZN6CTIEBA11CTIEBAARRAY5CLEAREv@4
__ZN6CTIEBA11CTIEBAARRAY5CLEAREv@4:
push ebp
mov ebp, esp
.Lt_00D8:
.Lt_00DA:
push dword ptr [ebp+8]
call __ZN6CTIEBA11CTIEBAARRAY12COUNT__get__Ev@4
test eax, eax
je .Lt_00DB
push 1
push dword ptr [ebp+8]
call __ZN6CTIEBA11CTIEBAARRAY10REMOVEITEMEi@8
jmp .Lt_00DA
.Lt_00DB:
.Lt_00D9:
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN6CTIEBA11CTIEBAARRAY7ADDITEMEPv@8
__ZN6CTIEBA11CTIEBAARRAY7ADDITEMEPv@8:
push ebp
mov ebp, esp
push ebx
.Lt_00DC:
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+16], 0
jne .Lt_00DF
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+12], 0
.Lt_00DF:
mov eax, dword ptr [ebp+8]
inc dword ptr [eax+16]
mov eax, dword ptr [ebp+8]
mov ebx, 4
imul ebx, dword ptr [eax+16]
mov ecx, ebx
push ecx
mov ecx, dword ptr [ebp+8]
push dword ptr [ecx+12]
call _realloc
add esp, 8
mov ecx, dword ptr [ebp+8]
mov dword ptr [ecx+12], eax
mov eax, dword ptr [ebp+8]
mov ecx, dword ptr [ebp+8]
mov ebx, dword ptr [ecx+16]
sal ebx, 2
mov ecx, dword ptr [eax+12]
add ecx, ebx
mov ebx, dword ptr [ebp+12]
mov dword ptr [ecx-4], ebx
.Lt_00DD:
pop ebx
mov esp, ebp
pop ebp
ret 8
.balign 16

.globl __ZN6CTIEBA11CTIEBAARRAY5INDEXEi@8
__ZN6CTIEBA11CTIEBAARRAY5INDEXEi@8:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_00E0:
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ebp+12]
sal ebx, 2
mov ecx, dword ptr [eax+12]
add ecx, ebx
mov ebx, dword ptr [ecx-4]
mov dword ptr [ebp-4], ebx
.Lt_00E1:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 8
.balign 16

.globl __ZN6CTIEBA11CTIEBAARRAY10REMOVEITEMEi@8
__ZN6CTIEBA11CTIEBAARRAY10REMOVEITEMEi@8:
push ebp
mov ebp, esp
.Lt_00E2:
push dword ptr [ebp+12]
push dword ptr [ebp+8]
call __ZN6CTIEBA11CTIEBAARRAY22_REMOVEITEM_CAN_REMOVEEi@8
test eax, eax
jne .Lt_00E5
jmp .Lt_00E3
.Lt_00E5:
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax], 0
je .Lt_00E7
push dword ptr [ebp+12]
push dword ptr [ebp+8]
call __ZN6CTIEBA11CTIEBAARRAY5INDEXEi@8
push eax
mov eax, dword ptr [ebp+8]
call dword ptr [eax]
.Lt_00E7:
push dword ptr [ebp+12]
push dword ptr [ebp+8]
call __ZN6CTIEBA11CTIEBAARRAY16_REMOVEITEM_SWAPEi@8
.Lt_00E3:
mov esp, ebp
pop ebp
ret 8
.balign 16

.globl __ZN6CTIEBA11CTIEBAARRAY12COUNT__get__Ev@4
__ZN6CTIEBA11CTIEBAARRAY12COUNT__get__Ev@4:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_00E8:
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax+16]
mov dword ptr [ebp-4], ebx
.Lt_00E9:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN6CTIEBA11CTIEBAARRAY22_REMOVEITEM_CAN_REMOVEEi@8
__ZN6CTIEBA11CTIEBAARRAY22_REMOVEITEM_CAN_REMOVEEi@8:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_00EA:
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+16], 0
jne .Lt_00ED
mov dword ptr [ebp-4], 0
jmp .Lt_00EB
.Lt_00ED:
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax+16]
cmp dword ptr [ebp+12], ebx
jle .Lt_00EF
mov dword ptr [ebp-4], 0
jmp .Lt_00EB
.Lt_00EF:
mov dword ptr [ebp-4], -1
.Lt_00EB:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 8
.balign 16

.globl __ZN6CTIEBA11CTIEBAARRAY16_REMOVEITEM_SWAPEi@8
__ZN6CTIEBA11CTIEBAARRAY16_REMOVEITEM_SWAPEi@8:
push ebp
mov ebp, esp
push ebx
push esi
.Lt_00F0:
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ebp+8]
mov ecx, dword ptr [ebx+16]
sal ecx, 2
mov ebx, dword ptr [eax+12]
add ebx, ecx
mov ecx, dword ptr [ebp+8]
mov eax, dword ptr [ebp+12]
sal eax, 2
mov esi, dword ptr [ecx+12]
add esi, eax
mov eax, dword ptr [ebx-4]
mov dword ptr [esi-4], eax
mov eax, dword ptr [ebp+8]
dec dword ptr [eax+16]
mov eax, dword ptr [ebp+8]
mov esi, 4
imul esi, dword ptr [eax+16]
mov ebx, esi
push ebx
mov ebx, dword ptr [ebp+8]
push dword ptr [ebx+12]
call _realloc
add esp, 8
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+12], eax
.Lt_00F1:
pop esi
pop ebx
mov esp, ebp
pop ebp
ret 8
.balign 16

.globl __ZN6CTIEBA10CTIEBAUSER11CUSTOM_COPYEPv@4
__ZN6CTIEBA10CTIEBAUSER11CUSTOM_COPYEPv@4:
push ebp
mov ebp, esp
sub esp, 12
mov dword ptr [ebp-4], 0
.Lt_00F2:
push 40
call __Znwj
add esp, 4
mov dword ptr [ebp-12], eax
push dword ptr [ebp-12]
call __ZN6CTIEBA10CTIEBAUSERC1Ev
add esp, 4
mov eax, dword ptr [ebp-12]
mov dword ptr [ebp-8], eax
push dword ptr [ebp+8]
push dword ptr [ebp-8]
call __ZN6CTIEBA10CTIEBAUSERaSERS_
add esp, 8
push 2
push 10
push offset _Lt_00F6
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 0
push dword ptr [ebp+8]
call _fb_HEX_p@4
push eax
push 0
call _fb_PrintString@12
push 0
push 4
push offset _Lt_00F7
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 1
push dword ptr [ebp-8]
call _fb_HEX_p@4
push eax
push 0
call _fb_PrintString@12
mov eax, dword ptr [ebp-8]
mov dword ptr [ebp-4], eax
.Lt_00F3:
mov eax, dword ptr [ebp-4]
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN6CTIEBA10CTIEBAUSER17CUSTOM_DESTRUCTOREPv@4
__ZN6CTIEBA10CTIEBAUSER17CUSTOM_DESTRUCTOREPv@4:
push ebp
mov ebp, esp
.Lt_00F8:
push 0
push 10
push offset _Lt_00F6
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 0
push dword ptr [ebp+8]
push 0
call _fb_PrintUInt@12
push 1
push 8
push offset _Lt_00FA
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
cmp dword ptr [ebp+8], 0
je .Lt_00FB
push dword ptr [ebp+8]
call __ZN6CTIEBA10CTIEBAUSERD1Ev
add esp, 4
push dword ptr [ebp+8]
call __ZdlPv
add esp, 4
.Lt_00FB:
.Lt_00F9:
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN6CTIEBA10CTIEBAUSER11CREATEARRAYEv@0
__ZN6CTIEBA10CTIEBAUSER11CREATEARRAYEv@0:
push ebp
mov ebp, esp
sub esp, 20
.Lt_00FC:
lea eax, [ebp-20]
push eax
push edi
mov edi, eax
xor eax, eax
mov ecx, 5
rep stosd
pop edi
pop eax
push 0
push 10
push offset _Lt_00F6
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 1
push 7
push offset _Lt_00FF
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
mov eax, offset __ZN6CTIEBA10CTIEBAUSER17CUSTOM_DESTRUCTOREPv@4
mov dword ptr [ebp-20], eax
mov eax, offset __ZN6CTIEBA10CTIEBAUSER11CUSTOM_COPYEPv@4
mov dword ptr [ebp-16], eax
lea eax, [ebp-20]
push eax
push dword ptr [ebp+8]
call __ZN6CTIEBA11CTIEBAARRAYaSERS_@8
lea eax, [ebp-20]
push eax
call __ZN6CTIEBA11CTIEBAARRAYD1Ev
add esp, 4
jmp .Lt_00FD
lea eax, [ebp-20]
push eax
call __ZN6CTIEBA11CTIEBAARRAYD1Ev
add esp, 4
.Lt_00FD:
mov eax, dword ptr [ebp+8]
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN6CTIEBA9CTIEBABAR11CUSTOM_COPYEPv@4
__ZN6CTIEBA9CTIEBABAR11CUSTOM_COPYEPv@4:
push ebp
mov ebp, esp
sub esp, 12
mov dword ptr [ebp-4], 0
.Lt_0100:
push 264
call __Znwj
add esp, 4
mov dword ptr [ebp-12], eax
push dword ptr [ebp-12]
call __ZN6CTIEBA9CTIEBABARC1Ev
add esp, 4
mov eax, dword ptr [ebp-12]
mov dword ptr [ebp-8], eax
push dword ptr [ebp+8]
push dword ptr [ebp-8]
call __ZN6CTIEBA9CTIEBABARaSERS_
add esp, 8
push 2
push 9
push offset _Lt_0104
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 0
push dword ptr [ebp+8]
call _fb_HEX_p@4
push eax
push 0
call _fb_PrintString@12
push 0
push 4
push offset _Lt_00F7
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 1
push dword ptr [ebp-8]
call _fb_HEX_p@4
push eax
push 0
call _fb_PrintString@12
mov eax, dword ptr [ebp-8]
mov dword ptr [ebp-4], eax
.Lt_0101:
mov eax, dword ptr [ebp-4]
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN6CTIEBA9CTIEBABAR17CUSTOM_DESTRUCTOREPv@4
__ZN6CTIEBA9CTIEBABAR17CUSTOM_DESTRUCTOREPv@4:
push ebp
mov ebp, esp
.Lt_0105:
push 0
push 9
push offset _Lt_0104
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 0
push dword ptr [ebp+8]
push 0
call _fb_PrintUInt@12
push 1
push 8
push offset _Lt_00FA
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
cmp dword ptr [ebp+8], 0
je .Lt_0107
push dword ptr [ebp+8]
call __ZN6CTIEBA9CTIEBABARD1Ev
add esp, 4
push dword ptr [ebp+8]
call __ZdlPv
add esp, 4
.Lt_0107:
.Lt_0106:
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN6CTIEBA9CTIEBABAR11CREATEARRAYEv@0
__ZN6CTIEBA9CTIEBABAR11CREATEARRAYEv@0:
push ebp
mov ebp, esp
sub esp, 20
.Lt_0108:
lea eax, [ebp-20]
push eax
push edi
mov edi, eax
xor eax, eax
mov ecx, 5
rep stosd
pop edi
pop eax
push 0
push 9
push offset _Lt_0104
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 1
push 7
push offset _Lt_00FF
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
mov eax, offset __ZN6CTIEBA9CTIEBABAR17CUSTOM_DESTRUCTOREPv@4
mov dword ptr [ebp-20], eax
mov eax, offset __ZN6CTIEBA9CTIEBABAR11CUSTOM_COPYEPv@4
mov dword ptr [ebp-16], eax
lea eax, [ebp-20]
push eax
push dword ptr [ebp+8]
call __ZN6CTIEBA11CTIEBAARRAYaSERS_@8
lea eax, [ebp-20]
push eax
call __ZN6CTIEBA11CTIEBAARRAYD1Ev
add esp, 4
jmp .Lt_0109
lea eax, [ebp-20]
push eax
call __ZN6CTIEBA11CTIEBAARRAYD1Ev
add esp, 4
.Lt_0109:
mov eax, dword ptr [ebp+8]
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN6CTIEBA12CTIEBATHREAD11CUSTOM_COPYEPv@4
__ZN6CTIEBA12CTIEBATHREAD11CUSTOM_COPYEPv@4:
push ebp
mov ebp, esp
sub esp, 12
mov dword ptr [ebp-4], 0
.Lt_010B:
push 144
call __Znwj
add esp, 4
mov dword ptr [ebp-12], eax
push dword ptr [ebp-12]
call __ZN6CTIEBA12CTIEBATHREADC1Ev
add esp, 4
mov eax, dword ptr [ebp-12]
mov dword ptr [ebp-8], eax
push dword ptr [ebp+8]
push dword ptr [ebp-8]
call __ZN6CTIEBA12CTIEBATHREADaSERS_@8
push 2
push 12
push offset _Lt_010F
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 0
push dword ptr [ebp+8]
call _fb_HEX_p@4
push eax
push 0
call _fb_PrintString@12
push 0
push 4
push offset _Lt_00F7
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 1
push dword ptr [ebp-8]
call _fb_HEX_p@4
push eax
push 0
call _fb_PrintString@12
mov eax, dword ptr [ebp-8]
mov dword ptr [ebp-4], eax
.Lt_010C:
mov eax, dword ptr [ebp-4]
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN6CTIEBA12CTIEBATHREAD17CUSTOM_DESTRUCTOREPv@4
__ZN6CTIEBA12CTIEBATHREAD17CUSTOM_DESTRUCTOREPv@4:
push ebp
mov ebp, esp
.Lt_0110:
push 0
push 12
push offset _Lt_010F
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 0
push dword ptr [ebp+8]
push 0
call _fb_PrintUInt@12
push 1
push 8
push offset _Lt_00FA
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
cmp dword ptr [ebp+8], 0
je .Lt_0112
push dword ptr [ebp+8]
call __ZN6CTIEBA12CTIEBATHREADD1Ev
add esp, 4
push dword ptr [ebp+8]
call __ZdlPv
add esp, 4
.Lt_0112:
.Lt_0111:
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN6CTIEBA12CTIEBATHREAD11CREATEARRAYEv@0
__ZN6CTIEBA12CTIEBATHREAD11CREATEARRAYEv@0:
push ebp
mov ebp, esp
sub esp, 20
.Lt_0113:
lea eax, [ebp-20]
push eax
push edi
mov edi, eax
xor eax, eax
mov ecx, 5
rep stosd
pop edi
pop eax
push 0
push 12
push offset _Lt_010F
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 1
push 7
push offset _Lt_00FF
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
mov eax, offset __ZN6CTIEBA12CTIEBATHREAD17CUSTOM_DESTRUCTOREPv@4
mov dword ptr [ebp-20], eax
mov eax, offset __ZN6CTIEBA12CTIEBATHREAD11CUSTOM_COPYEPv@4
mov dword ptr [ebp-16], eax
lea eax, [ebp-20]
push eax
push dword ptr [ebp+8]
call __ZN6CTIEBA11CTIEBAARRAYaSERS_@8
lea eax, [ebp-20]
push eax
call __ZN6CTIEBA11CTIEBAARRAYD1Ev
add esp, 4
jmp .Lt_0114
lea eax, [ebp-20]
push eax
call __ZN6CTIEBA11CTIEBAARRAYD1Ev
add esp, 4
.Lt_0114:
mov eax, dword ptr [ebp+8]
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN6CTIEBA10CTIEBAPOST11CUSTOM_COPYEPv@4
__ZN6CTIEBA10CTIEBAPOST11CUSTOM_COPYEPv@4:
push ebp
mov ebp, esp
sub esp, 12
mov dword ptr [ebp-4], 0
.Lt_0116:
push 56
call __Znwj
add esp, 4
mov dword ptr [ebp-12], eax
push dword ptr [ebp-12]
call __ZN6CTIEBA10CTIEBAPOSTC1Ev
add esp, 4
mov eax, dword ptr [ebp-12]
mov dword ptr [ebp-8], eax
push dword ptr [ebp+8]
push dword ptr [ebp-8]
call __ZN6CTIEBA10CTIEBAPOSTaSERS_
add esp, 8
push 2
push 10
push offset _Lt_011A
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 0
push dword ptr [ebp+8]
call _fb_HEX_p@4
push eax
push 0
call _fb_PrintString@12
push 0
push 4
push offset _Lt_00F7
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 1
push dword ptr [ebp-8]
call _fb_HEX_p@4
push eax
push 0
call _fb_PrintString@12
mov eax, dword ptr [ebp-8]
mov dword ptr [ebp-4], eax
.Lt_0117:
mov eax, dword ptr [ebp-4]
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN6CTIEBA10CTIEBAPOST17CUSTOM_DESTRUCTOREPv@4
__ZN6CTIEBA10CTIEBAPOST17CUSTOM_DESTRUCTOREPv@4:
push ebp
mov ebp, esp
.Lt_011B:
push 0
push 10
push offset _Lt_011A
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 0
push dword ptr [ebp+8]
push 0
call _fb_PrintUInt@12
push 1
push 8
push offset _Lt_00FA
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
cmp dword ptr [ebp+8], 0
je .Lt_011D
push dword ptr [ebp+8]
call __ZN6CTIEBA10CTIEBAPOSTD1Ev
add esp, 4
push dword ptr [ebp+8]
call __ZdlPv
add esp, 4
.Lt_011D:
.Lt_011C:
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN6CTIEBA10CTIEBAPOST11CREATEARRAYEv@0
__ZN6CTIEBA10CTIEBAPOST11CREATEARRAYEv@0:
push ebp
mov ebp, esp
sub esp, 20
.Lt_011E:
lea eax, [ebp-20]
push eax
push edi
mov edi, eax
xor eax, eax
mov ecx, 5
rep stosd
pop edi
pop eax
push 0
push 10
push offset _Lt_011A
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 1
push 7
push offset _Lt_00FF
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
mov eax, offset __ZN6CTIEBA10CTIEBAPOST17CUSTOM_DESTRUCTOREPv@4
mov dword ptr [ebp-20], eax
mov eax, offset __ZN6CTIEBA10CTIEBAPOST11CUSTOM_COPYEPv@4
mov dword ptr [ebp-16], eax
lea eax, [ebp-20]
push eax
push dword ptr [ebp+8]
call __ZN6CTIEBA11CTIEBAARRAYaSERS_@8
lea eax, [ebp-20]
push eax
call __ZN6CTIEBA11CTIEBAARRAYD1Ev
add esp, 4
jmp .Lt_011F
lea eax, [ebp-20]
push eax
call __ZN6CTIEBA11CTIEBAARRAYD1Ev
add esp, 4
.Lt_011F:
mov eax, dword ptr [ebp+8]
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN6CTIEBA13CTIEBASUBPOST11CUSTOM_COPYEPv@4
__ZN6CTIEBA13CTIEBASUBPOST11CUSTOM_COPYEPv@4:
push ebp
mov ebp, esp
sub esp, 12
mov dword ptr [ebp-4], 0
.Lt_0121:
push 16
call __Znwj
add esp, 4
mov dword ptr [ebp-12], eax
push dword ptr [ebp-12]
call __ZN6CTIEBA13CTIEBASUBPOSTC1Ev
add esp, 4
mov eax, dword ptr [ebp-12]
mov dword ptr [ebp-8], eax
push dword ptr [ebp+8]
push dword ptr [ebp-8]
call __ZN6CTIEBA13CTIEBASUBPOSTaSERS_
add esp, 8
push 2
push 13
push offset _Lt_0125
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 0
push dword ptr [ebp+8]
call _fb_HEX_p@4
push eax
push 0
call _fb_PrintString@12
push 0
push 4
push offset _Lt_00F7
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 1
push dword ptr [ebp-8]
call _fb_HEX_p@4
push eax
push 0
call _fb_PrintString@12
mov eax, dword ptr [ebp-8]
mov dword ptr [ebp-4], eax
.Lt_0122:
mov eax, dword ptr [ebp-4]
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN6CTIEBA13CTIEBASUBPOST17CUSTOM_DESTRUCTOREPv@4
__ZN6CTIEBA13CTIEBASUBPOST17CUSTOM_DESTRUCTOREPv@4:
push ebp
mov ebp, esp
.Lt_0126:
push 0
push 13
push offset _Lt_0125
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 0
push dword ptr [ebp+8]
push 0
call _fb_PrintUInt@12
push 1
push 8
push offset _Lt_00FA
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
cmp dword ptr [ebp+8], 0
je .Lt_0128
push dword ptr [ebp+8]
call __ZN6CTIEBA13CTIEBASUBPOSTD1Ev
add esp, 4
push dword ptr [ebp+8]
call __ZdlPv
add esp, 4
.Lt_0128:
.Lt_0127:
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN6CTIEBA13CTIEBASUBPOST11CREATEARRAYEv@0
__ZN6CTIEBA13CTIEBASUBPOST11CREATEARRAYEv@0:
push ebp
mov ebp, esp
sub esp, 20
.Lt_0129:
lea eax, [ebp-20]
push eax
push edi
mov edi, eax
xor eax, eax
mov ecx, 5
rep stosd
pop edi
pop eax
push 0
push 13
push offset _Lt_0125
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
push 1
push 7
push offset _Lt_00FF
call _fb_StrAllocTempDescZEx@8
push eax
push 0
call _fb_PrintString@12
mov eax, offset __ZN6CTIEBA13CTIEBASUBPOST17CUSTOM_DESTRUCTOREPv@4
mov dword ptr [ebp-20], eax
mov eax, offset __ZN6CTIEBA13CTIEBASUBPOST11CUSTOM_COPYEPv@4
mov dword ptr [ebp-16], eax
lea eax, [ebp-20]
push eax
push dword ptr [ebp+8]
call __ZN6CTIEBA11CTIEBAARRAYaSERS_@8
lea eax, [ebp-20]
push eax
call __ZN6CTIEBA11CTIEBAARRAYD1Ev
add esp, 4
jmp .Lt_012A
lea eax, [ebp-20]
push eax
call __ZN6CTIEBA11CTIEBAARRAYD1Ev
add esp, 4
.Lt_012A:
mov eax, dword ptr [ebp+8]
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
__ZN6CTIEBA10CTIEBAPOSTC1Ev:
push ebp
mov ebp, esp
push ebx
mov eax, dword ptr [ebp+8]
mov dword ptr [eax], 0
mov dword ptr [eax+4], 0
mov dword ptr [eax+8], 0
mov eax, dword ptr [ebp+8]
lea ebx, [eax+12]
push ebx
call __ZN6CTIEBA10CTIEBAUSERC1Ev
add esp, 4
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+52], 0
.Lt_009B:
.Lt_009C:
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
__ZN6CTIEBA10CTIEBAPOSTD1Ev:
push ebp
mov ebp, esp
push ebx
.Lt_00A1:
.Lt_00A2:
mov eax, dword ptr [ebp+8]
lea ebx, [eax+12]
push ebx
call __ZN6CTIEBA10CTIEBAUSERD1Ev
add esp, 4
mov ebx, dword ptr [ebp+8]
lea eax, [ebx]
push eax
call _fb_StrDelete@4
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16
__ZN6CTIEBA13CTIEBASUBPOSTC1Ev:
push ebp
mov ebp, esp
mov eax, dword ptr [ebp+8]
mov dword ptr [eax], 0
mov dword ptr [eax+4], 0
mov dword ptr [eax+8], 0
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+12], 0
.Lt_00A3:
.Lt_00A4:
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
__ZN6CTIEBA13CTIEBASUBPOSTD1Ev:
push ebp
mov ebp, esp
push ebx
.Lt_00A9:
.Lt_00AA:
mov eax, dword ptr [ebp+8]
lea ebx, [eax]
push ebx
call _fb_StrDelete@4
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
	#CTiebaArray.bas' compilation took 0.0546132469502254 secs

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
_Lt_00CE:	.ascii	"-\0"
.balign 4
_Lt_00F6:	.ascii	"CTiebaUser\0"
.balign 4
_Lt_00F7:	.ascii	" -> \0"
.balign 4
_Lt_00FA:	.ascii	" deleted\0"
.balign 4
_Lt_00FF:	.ascii	" Create\0"
.balign 4
_Lt_0104:	.ascii	"CTiebaBar\0"
.balign 4
_Lt_010F:	.ascii	"CTiebaThread\0"
.balign 4
_Lt_011A:	.ascii	"CTiebaPost\0"
.balign 4
_Lt_0125:	.ascii	"CTiebaSubPost\0"
