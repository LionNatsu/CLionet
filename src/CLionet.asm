	.intel_syntax noprefix

	#..\src\CLionet.bas' compilation started at 21:07:29 (FreeBASIC 0.90.0)

.section .text
.balign 16

.globl __ZN7CLIONETC1Ev
__ZN7CLIONETC1Ev:
push ebp
mov ebp, esp
push ebx
.Lt_0077:
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
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+16], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+20], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+24], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+28], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+32], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+36], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+40], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+44], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+48], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+52], 0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+56], 0
mov ebx, dword ptr [ebp+8]
mov eax, offset __ZTV7CLIONET + 8
mov dword ptr [ebx], eax
call __ZN7CLIONET7STARTUPEv@0
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+4]
.Lt_0078:
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16

.globl __ZN7CLIONETD1Ev
__ZN7CLIONETD1Ev:
push ebp
mov ebp, esp
push ebx
.Lt_007A:
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+12]
push 0
push dword ptr [ebp+8]
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebx]
call dword ptr [eax+112]
.Lt_007B:
pop ebx
mov esp, ebp
pop ebp
ret
.balign 16

.globl __ZN7CLIONET7STARTUPEv@0
__ZN7CLIONET7STARTUPEv@0:
push ebp
mov ebp, esp
sub esp, 404
mov dword ptr [ebp-4], 0
.Lt_007E:
lea eax, [ebp-404]
push eax
push edi
mov edi, eax
xor eax, eax
mov ecx, 100
rep stosd
pop edi
pop eax
lea eax, [ebp-404]
push eax
push 514
call _WSAStartup@8
mov dword ptr [ebp-4], eax
.Lt_007F:
mov eax, dword ptr [ebp-4]
mov esp, ebp
pop ebp
ret
.balign 16

.globl __ZN7CLIONET7CLEANUPEv@0
__ZN7CLIONET7CLEANUPEv@0:
push ebp
mov ebp, esp
sub esp, 4
mov dword ptr [ebp-4], 0
.Lt_0080:
call _WSACleanup@0
mov dword ptr [ebp-4], eax
.Lt_0081:
mov eax, dword ptr [ebp-4]
mov esp, ebp
pop ebp
ret
.balign 16

.globl __ZN7CLIONET5ERROREv@0
__ZN7CLIONET5ERROREv@0:
push ebp
mov ebp, esp
sub esp, 4
mov dword ptr [ebp-4], 0
.Lt_0082:
call _WSAGetLastError@0
mov dword ptr [ebp-4], eax
.Lt_0083:
mov eax, dword ptr [ebp-4]
mov esp, ebp
pop ebp
ret
.balign 16

.globl __ZN7CLIONET12ERROR_STRINGEv@0
__ZN7CLIONET12ERROR_STRINGEv@0:
push ebp
mov ebp, esp
sub esp, 12
mov dword ptr [ebp-4], 0
.Lt_0084:
mov dword ptr [ebp-8], 4863
mov dword ptr [ebp-12], 1024
push 0
push 1024
push offset _Lt_0086
push dword ptr [ebp-12]
call __ZN7CLIONET5ERROREv@0
push eax
push 0
push dword ptr [ebp-8]
call _FormatMessageA@28
mov eax, offset _Lt_0086
mov dword ptr [ebp-4], eax
.Lt_0085:
mov eax, dword ptr [ebp-4]
mov esp, ebp
pop ebp
ret

.section .bss
.balign 4
	.lcomm	_Lt_0086,1025

.section .text
.balign 16

.globl __ZN7CLIONET12PARSEADDRESSER8FBSTRING@4
__ZN7CLIONET12PARSEADDRESSER8FBSTRING@4:
push ebp
mov ebp, esp
sub esp, 12
push ebx
mov dword ptr [ebp-4], 0
.Lt_0087:
mov eax, dword ptr [ebp+8]
push dword ptr [eax]
call _inet_addr@4
mov dword ptr [ebp-8], eax
cmp dword ptr [ebp-8], -1
je .Lt_008A
mov eax, dword ptr [ebp-8]
mov dword ptr [ebp-4], eax
jmp .Lt_0088
.Lt_008A:
mov eax, dword ptr [ebp+8]
push dword ptr [eax]
call _gethostbyname@4
mov dword ptr [ebp-12], eax
cmp dword ptr [ebp-12], 0
jne .Lt_008C
mov dword ptr [ebp-4], 0
jmp .Lt_0088
.Lt_008C:
mov eax, dword ptr [ebp-12]
mov ebx, dword ptr [eax+12]
mov eax, dword ptr [ebx]
mov ebx, dword ptr [eax]
mov dword ptr [ebp-4], ebx
.Lt_0088:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN7CLIONET6ACCEPTEv@4
__ZN7CLIONET6ACCEPTEv@4:
push ebp
mov ebp, esp
sub esp, 8
push ebx
mov dword ptr [ebp-4], 0
.Lt_008D:
mov dword ptr [ebp-8], 0
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+132]
push 0
push 0
mov ebx, dword ptr [ebp+8]
push dword ptr [ebx+40]
call _accept@12
mov dword ptr [ebp-8], eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+12]
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebp-8]
mov dword ptr [ebx+40], eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+128]
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebx+40]
mov dword ptr [ebp-4], eax
.Lt_008E:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN7CLIONET6ACCEPTEPS_@8
__ZN7CLIONET6ACCEPTEPS_@8:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_0091:
push dword ptr [ebp+12]
mov eax, dword ptr [ebp+12]
mov ebx, dword ptr [eax]
call dword ptr [ebx+92]
push eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+64]
mov dword ptr [ebp-4], eax
.Lt_0092:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 8
.balign 16

.globl __ZN7CLIONET6ACCEPTEj@8
__ZN7CLIONET6ACCEPTEj@8:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_0095:
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+132]
push dword ptr [ebp+8]
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebx]
call dword ptr [eax+12]
push 0
push 0
push dword ptr [ebp+12]
call _accept@12
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+40], eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+128]
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebx+40]
mov dword ptr [ebp-4], eax
.Lt_0096:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 8
.balign 16

.globl __ZN7CLIONET6LISTENEt@8
__ZN7CLIONET6LISTENEt@8:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_0099:
movzx eax, word ptr [ebp+12]
push eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+28]
cmp eax, -1
jne .Lt_009D
mov dword ptr [ebp-4], -1
jmp .Lt_009A
.Lt_009D:
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+52]
mov dword ptr [ebp-4], eax
.Lt_009A:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 8
.balign 16

.globl __ZN7CLIONET6LISTENER8FBSTRINGt@12
__ZN7CLIONET6LISTENER8FBSTRINGt@12:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_009F:
movzx eax, word ptr [ebp+16]
push eax
push dword ptr [ebp+12]
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+32]
cmp eax, -1
jne .Lt_00A3
mov dword ptr [ebp-4], -1
jmp .Lt_00A0
.Lt_00A3:
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+52]
mov dword ptr [ebp-4], eax
.Lt_00A0:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 12
.balign 16

.globl __ZN7CLIONET6LISTENEjt@12
__ZN7CLIONET6LISTENEjt@12:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_00A5:
movzx eax, word ptr [ebp+16]
push eax
push dword ptr [ebp+12]
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+36]
cmp eax, -1
jne .Lt_00A9
mov dword ptr [ebp-4], -1
jmp .Lt_00A6
.Lt_00A9:
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+52]
mov dword ptr [ebp-4], eax
.Lt_00A6:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 12
.balign 16

.globl __ZN7CLIONET6LISTENEv@4
__ZN7CLIONET6LISTENEv@4:
push ebp
mov ebp, esp
sub esp, 4
mov dword ptr [ebp-4], 0
.Lt_00AB:
push 2147483647
mov eax, dword ptr [ebp+8]
push dword ptr [eax+40]
call _listen@8
mov dword ptr [ebp-4], eax
.Lt_00AC:
mov eax, dword ptr [ebp-4]
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN7CLIONET4BINDEt@8
__ZN7CLIONET4BINDEt@8:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_00AD:
movzx eax, word ptr [ebp+12]
push eax
push 0
call _htonl@4
push eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+36]
mov dword ptr [ebp-4], eax
.Lt_00AE:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 8
.balign 16

.globl __ZN7CLIONET4BINDER8FBSTRINGt@12
__ZN7CLIONET4BINDER8FBSTRINGt@12:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_00B0:
movzx eax, word ptr [ebp+16]
push eax
push dword ptr [ebp+12]
call __ZN7CLIONET12PARSEADDRESSER8FBSTRING@4
push eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+36]
mov dword ptr [ebp-4], eax
.Lt_00B1:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 12
.balign 16

.globl __ZN7CLIONET4BINDEjt@12
__ZN7CLIONET4BINDEjt@12:
push ebp
mov ebp, esp
sub esp, 20
push ebx
mov dword ptr [ebp-4], 0
.Lt_00B3:
mov dword ptr [ebp-20], 0
mov dword ptr [ebp-16], 0
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov word ptr [ebp-20], 2
mov eax, dword ptr [ebp+12]
mov dword ptr [ebp-16], eax
movzx eax, word ptr [ebp+16]
push eax
call _htons@4
mov word ptr [ebp-18], ax
lea eax, [ebp-20]
push eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+124]
mov dword ptr [ebp-4], eax
.Lt_00B4:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 12
.balign 16

.globl __ZN7CLIONET4BINDEPv@8
__ZN7CLIONET4BINDEPv@8:
push ebp
mov ebp, esp
sub esp, 4
mov dword ptr [ebp-4], 0
.Lt_00B6:
push 16
push dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
push dword ptr [eax+40]
call _bind@12
mov dword ptr [ebp-4], eax
.Lt_00B7:
mov eax, dword ptr [ebp-4]
mov esp, ebp
pop ebp
ret 8
.balign 16

.globl __ZN7CLIONET7CONNECTER8FBSTRINGt@12
__ZN7CLIONET7CONNECTER8FBSTRINGt@12:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_00B8:
movzx eax, word ptr [ebp+16]
push eax
push dword ptr [ebp+12]
call __ZN7CLIONET12PARSEADDRESSER8FBSTRING@4
push eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+24]
mov dword ptr [ebp-4], eax
.Lt_00B9:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 12
.balign 16

.globl __ZN7CLIONET7CONNECTEjt@12
__ZN7CLIONET7CONNECTEjt@12:
push ebp
mov ebp, esp
sub esp, 20
push ebx
mov dword ptr [ebp-4], 0
.Lt_00BB:
mov dword ptr [ebp-20], 0
mov dword ptr [ebp-16], 0
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov word ptr [ebp-20], 2
mov eax, dword ptr [ebp+12]
mov dword ptr [ebp-16], eax
movzx eax, word ptr [ebp+16]
push eax
call _htons@4
mov word ptr [ebp-18], ax
lea eax, [ebp-20]
push eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+120]
mov dword ptr [ebp-4], eax
.Lt_00BC:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 12
.balign 16

.globl __ZN7CLIONET7CONNECTEPv@8
__ZN7CLIONET7CONNECTEPv@8:
push ebp
mov ebp, esp
sub esp, 4
mov dword ptr [ebp-4], 0
.Lt_00BE:
push 16
push dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
push dword ptr [eax+40]
call _connect@12
mov dword ptr [ebp-4], eax
.Lt_00BF:
mov eax, dword ptr [ebp-4]
mov esp, ebp
pop ebp
ret 8
.balign 16

.globl __ZN7CLIONET4SENDEPvi@12
__ZN7CLIONET4SENDEPvi@12:
push ebp
mov ebp, esp
sub esp, 4
mov dword ptr [ebp-4], 0
.Lt_00C0:
push 0
push dword ptr [ebp+16]
push dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
push dword ptr [eax+40]
call _send@16
mov dword ptr [ebp-4], eax
.Lt_00C1:
mov eax, dword ptr [ebp-4]
mov esp, ebp
pop ebp
ret 12
.balign 16

.globl __ZN7CLIONET4RECVEPvii@16
__ZN7CLIONET4RECVEPvii@16:
push ebp
mov ebp, esp
sub esp, 8
mov dword ptr [ebp-4], 0
.Lt_00C2:
mov dword ptr [ebp-8], 0
cmp dword ptr [ebp+20], 0
je .Lt_00C5
mov dword ptr [ebp-8], 2
.Lt_00C5:
push dword ptr [ebp-8]
push dword ptr [ebp+16]
push dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
push dword ptr [eax+40]
call _recv@16
mov dword ptr [ebp-4], eax
.Lt_00C3:
mov eax, dword ptr [ebp-4]
mov esp, ebp
pop ebp
ret 16
.balign 16

.globl __ZN7CLIONET6SENDTOEPviR8FBSTRINGt@20
__ZN7CLIONET6SENDTOEPviR8FBSTRINGt@20:
push ebp
mov ebp, esp
sub esp, 20
mov dword ptr [ebp-4], 0
.Lt_00C6:
mov dword ptr [ebp-20], 0
mov dword ptr [ebp-16], 0
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov word ptr [ebp-20], 2
push dword ptr [ebp+20]
call __ZN7CLIONET12PARSEADDRESSER8FBSTRING@4
mov dword ptr [ebp-16], eax
movzx eax, word ptr [ebp+24]
push eax
call _htons@4
mov word ptr [ebp-18], ax
push 16
lea eax, [ebp-20]
push eax
push 0
push dword ptr [ebp+16]
push dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
push dword ptr [eax+40]
call _sendto@24
mov dword ptr [ebp-4], eax
.Lt_00C7:
mov eax, dword ptr [ebp-4]
mov esp, ebp
pop ebp
ret 20
.balign 16

.globl __ZN7CLIONET6SENDTOEPvijt@20
__ZN7CLIONET6SENDTOEPvijt@20:
push ebp
mov ebp, esp
sub esp, 20
mov dword ptr [ebp-4], 0
.Lt_00C8:
mov dword ptr [ebp-20], 0
mov dword ptr [ebp-16], 0
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov word ptr [ebp-20], 2
mov eax, dword ptr [ebp+20]
mov dword ptr [ebp-16], eax
movzx eax, word ptr [ebp+24]
push eax
call _htons@4
mov word ptr [ebp-18], ax
push 16
lea eax, [ebp-20]
push eax
push 0
push dword ptr [ebp+16]
push dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
push dword ptr [eax+40]
call _sendto@24
mov dword ptr [ebp-4], eax
.Lt_00C9:
mov eax, dword ptr [ebp-4]
mov esp, ebp
pop ebp
ret 20
.balign 16

.globl __ZN7CLIONET8RECVFROMEPviPPc@16
__ZN7CLIONET8RECVFROMEPviPPc@16:
push ebp
mov ebp, esp
sub esp, 28
push ebx
mov dword ptr [ebp-4], 0
.Lt_00CA:
mov dword ptr [ebp-20], 0
mov dword ptr [ebp-16], 0
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov dword ptr [ebp-24], 16
lea eax, [ebp-24]
push eax
lea eax, [ebp-20]
push eax
push 0
push dword ptr [ebp+16]
push dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
push dword ptr [eax+40]
call _recvfrom@24
mov dword ptr [ebp-28], eax
cmp dword ptr [ebp+20], 0
je .Lt_00CD
push dword ptr [ebp-16]
call _inet_ntoa@4
mov ebx, dword ptr [ebp+20]
mov dword ptr [ebx], eax
.Lt_00CD:
mov eax, dword ptr [ebp-28]
mov dword ptr [ebp-4], eax
.Lt_00CB:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 16
.balign 16

.globl __ZN7CLIONET8RECVFROMEPviPj@16
__ZN7CLIONET8RECVFROMEPviPj@16:
push ebp
mov ebp, esp
sub esp, 28
push ebx
mov dword ptr [ebp-4], 0
.Lt_00CE:
mov dword ptr [ebp-20], 0
mov dword ptr [ebp-16], 0
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov dword ptr [ebp-24], 16
lea eax, [ebp-24]
push eax
lea eax, [ebp-20]
push eax
push 0
push dword ptr [ebp+16]
push dword ptr [ebp+12]
mov eax, dword ptr [ebp+8]
push dword ptr [eax+40]
call _recvfrom@24
mov dword ptr [ebp-28], eax
cmp dword ptr [ebp+20], 0
je .Lt_00D1
mov eax, dword ptr [ebp+20]
mov ebx, dword ptr [ebp-16]
mov dword ptr [eax], ebx
.Lt_00D1:
mov ebx, dword ptr [ebp-28]
mov dword ptr [ebp-4], ebx
.Lt_00CF:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 16
.balign 16

.globl __ZN7CLIONET10OPENSOCKETEv@4
__ZN7CLIONET10OPENSOCKETEv@4:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_00D2:
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+40], 0
je .Lt_00D5
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+12]
.Lt_00D5:
push 6
push 1
push 2
call _socket@12
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+40], eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+128]
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebx+40]
mov dword ptr [ebp-4], eax
.Lt_00D3:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN7CLIONET12REOPENSOCKETEv@4
__ZN7CLIONET12REOPENSOCKETEv@4:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_00D8:
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+4]
mov dword ptr [ebp-4], eax
.Lt_00D9:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN7CLIONET3UDPEv@4
__ZN7CLIONET3UDPEv@4:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_00DB:
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+40], 0
je .Lt_00DE
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+12]
.Lt_00DE:
push 17
push 2
push 2
call _socket@12
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+40], eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+128]
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebx+40]
mov dword ptr [ebp-4], eax
.Lt_00DC:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN7CLIONET11CLOSESOCKETEv@4
__ZN7CLIONET11CLOSESOCKETEv@4:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_00E1:
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+132]
mov ebx, dword ptr [ebp+8]
push dword ptr [ebx+40]
call _closesocket@4
mov dword ptr [ebp-4], eax
.Lt_00E2:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN7CLIONET16THESOCKET__get__Ev@4
__ZN7CLIONET16THESOCKET__get__Ev@4:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_00E4:
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax+40]
mov dword ptr [ebp-4], ebx
.Lt_00E5:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN7CLIONET11EVENTTHREADEPS_@4
__ZN7CLIONET11EVENTTHREADEPS_@4:
push ebp
mov ebp, esp
sub esp, 48
push ebx
mov dword ptr [ebp-4], 0
.Lt_00E6:
lea eax, [ebp-48]
push eax
push edi
mov edi, eax
xor eax, eax
mov ecx, 11
rep stosd
pop edi
pop eax
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+56], 1
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+4], 0
je .Lt_00E9
push 0
push 5
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
call dword ptr [eax+4]
jmp .Lt_00E8
.Lt_00E9:
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+8], 0
je .Lt_00EA
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
call dword ptr [eax+8]
.Lt_00EA:
.Lt_00E8:
.Lt_00EB:
push -1
push 100
push -1
mov eax, dword ptr [ebp+8]
lea ebx, [eax+44]
push ebx
push 1
call _WSAWaitForMultipleEvents@20
cmp eax, 258
jne .Lt_00EF
jmp .Lt_00ED
.Lt_00EF:
call _GetLastError@0
cmp eax, 6
jne .Lt_00F1
jmp .Lt_00EC
.Lt_00F1:
.Lt_00F0:
lea eax, [ebp-48]
push eax
mov eax, dword ptr [ebp+8]
push dword ptr [eax+44]
mov eax, dword ptr [ebp+8]
push dword ptr [eax+40]
call _WSAEnumNetworkEvents@12
mov eax, dword ptr [ebp-48]
and eax, 8
test eax, eax
je .Lt_00F3
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+4], 0
je .Lt_00F5
push dword ptr [ebp-32]
push 0
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
call dword ptr [eax+4]
jmp .Lt_00F4
.Lt_00F5:
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+16], 0
je .Lt_00F6
push dword ptr [ebp-32]
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
call dword ptr [eax+16]
.Lt_00F6:
.Lt_00F4:
.Lt_00F3:
.Lt_00F2:
mov eax, dword ptr [ebp-48]
and eax, 16
test eax, eax
je .Lt_00F8
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+4], 0
je .Lt_00FA
push dword ptr [ebp-28]
push 1
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
call dword ptr [eax+4]
jmp .Lt_00F9
.Lt_00FA:
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+20], 0
je .Lt_00FB
push dword ptr [ebp-28]
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
call dword ptr [eax+20]
.Lt_00FB:
.Lt_00F9:
.Lt_00F8:
.Lt_00F7:
mov eax, dword ptr [ebp-48]
and eax, 1
test eax, eax
je .Lt_00FD
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+4], 0
je .Lt_00FF
push dword ptr [ebp-44]
push 2
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
call dword ptr [eax+4]
jmp .Lt_00FE
.Lt_00FF:
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+24], 0
je .Lt_0100
push dword ptr [ebp-44]
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
call dword ptr [eax+24]
.Lt_0100:
.Lt_00FE:
.Lt_00FD:
.Lt_00FC:
mov eax, dword ptr [ebp-48]
and eax, 2
test eax, eax
je .Lt_0102
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+4], 0
je .Lt_0104
push dword ptr [ebp-40]
push 3
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
call dword ptr [eax+4]
jmp .Lt_0103
.Lt_0104:
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+28], 0
je .Lt_0105
push dword ptr [ebp-40]
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
call dword ptr [eax+28]
.Lt_0105:
.Lt_0103:
.Lt_0102:
.Lt_0101:
mov eax, dword ptr [ebp-48]
and eax, 32
test eax, eax
je .Lt_0107
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+4], 0
je .Lt_0109
push dword ptr [ebp-24]
push 4
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
call dword ptr [eax+4]
jmp .Lt_0108
.Lt_0109:
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+32], 0
je .Lt_010A
push dword ptr [ebp-24]
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
call dword ptr [eax+32]
.Lt_010A:
.Lt_0108:
.Lt_0107:
.Lt_0106:
push 0
call _Sleep@4
.Lt_00ED:
jmp .Lt_00EB
.Lt_00EC:
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+4], 0
je .Lt_010C
push 0
push 6
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
call dword ptr [eax+4]
jmp .Lt_010B
.Lt_010C:
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+12], 0
je .Lt_010D
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
call dword ptr [eax+12]
.Lt_010D:
.Lt_010B:
mov eax, dword ptr [ebp+8]
mov dword ptr [eax+56], 0
mov dword ptr [ebp-4], 0
.Lt_00E7:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN7CLIONET12ASYNC__set__E12CLIONET_MODE@8
__ZN7CLIONET12ASYNC__set__E12CLIONET_MODE@8:
push ebp
mov ebp, esp
sub esp, 4
push ebx
.Lt_010E:
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ebp+12]
cmp dword ptr [eax+52], ebx
jne .Lt_0111
jmp .Lt_010F
.Lt_0111:
cmp dword ptr [ebp+12], 1
jne .Lt_0113
.Lt_0114:
mov ebx, dword ptr [ebp+8]
cmp dword ptr [ebx+56], 0
je .Lt_0116
jmp .Lt_010F
.Lt_0116:
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebp+12]
mov dword ptr [ebx+52], eax
call _WSACreateEvent@0
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+44], eax
push dword ptr [ebp+8]
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax]
call dword ptr [ebx+128]
mov dword ptr [ebp-4], 0
lea ebx, [ebp-4]
push ebx
push 0
push dword ptr [ebp+8]
push offset __ZN7CLIONET11EVENTTHREADEPS_@4
push 0
push 0
call _CreateThread@24
mov ebx, dword ptr [ebp+8]
mov dword ptr [ebx+48], eax
jmp .Lt_0112
.Lt_0113:
cmp dword ptr [ebp+12], 0
jne .Lt_0118
.Lt_0119:
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [ebp+12]
mov dword ptr [eax+52], ebx
push dword ptr [ebp+8]
mov ebx, dword ptr [ebp+8]
mov eax, dword ptr [ebx]
call dword ptr [eax+132]
mov eax, dword ptr [ebp+8]
push dword ptr [eax+44]
call _WSACloseEvent@4
push 1000
mov eax, dword ptr [ebp+8]
push dword ptr [eax+48]
call _WaitForSingleObject@8
push -1
mov eax, dword ptr [ebp+8]
push dword ptr [eax+48]
call _TerminateThread@8
.Lt_0118:
.Lt_0112:
.Lt_010F:
pop ebx
mov esp, ebp
pop ebp
ret 8
.balign 16

.globl __ZN7CLIONET12ASYNC__get__Ev@4
__ZN7CLIONET12ASYNC__get__Ev@4:
push ebp
mov ebp, esp
sub esp, 4
push ebx
mov dword ptr [ebp-4], 0
.Lt_011B:
mov eax, dword ptr [ebp+8]
mov ebx, dword ptr [eax+52]
mov dword ptr [ebp-4], ebx
.Lt_011C:
mov eax, dword ptr [ebp-4]
pop ebx
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN7CLIONET15EXITEVENTTHREADEv@0
__ZN7CLIONET15EXITEVENTTHREADEv@0:
.Lt_011D:
push 0
call _ExitThread@4
.Lt_011E:
ret
.balign 16

.globl __ZN7CLIONET11ATTACHEVENTEv@4
__ZN7CLIONET11ATTACHEVENTEv@4:
push ebp
mov ebp, esp
.Lt_011F:
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+52], 1
je .Lt_0122
jmp .Lt_0120
.Lt_0122:
push 59
mov eax, dword ptr [ebp+8]
push dword ptr [eax+44]
mov eax, dword ptr [ebp+8]
push dword ptr [eax+40]
call _WSAEventSelect@12
.Lt_0120:
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN7CLIONET11DETACHEVENTEv@4
__ZN7CLIONET11DETACHEVENTEv@4:
push ebp
mov ebp, esp
.Lt_0123:
mov eax, dword ptr [ebp+8]
cmp dword ptr [eax+52], 1
je .Lt_0126
jmp .Lt_0124
.Lt_0126:
push 0
mov eax, dword ptr [ebp+8]
push dword ptr [eax+44]
mov eax, dword ptr [ebp+8]
push dword ptr [eax+40]
call _WSAEventSelect@12
.Lt_0124:
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN7CLIONET15REMOTEIP__get__Ev@4
__ZN7CLIONET15REMOTEIP__get__Ev@4:
push ebp
mov ebp, esp
sub esp, 32
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov dword ptr [ebp-4], 0
.Lt_0127:
mov dword ptr [ebp-28], 0
mov dword ptr [ebp-24], 0
mov dword ptr [ebp-20], 0
mov dword ptr [ebp-16], 0
mov dword ptr [ebp-32], 16
lea eax, [ebp-32]
push eax
lea eax, [ebp-28]
push eax
mov eax, dword ptr [ebp+8]
push dword ptr [eax+40]
call _getpeername@12
push 0
push 0
push dword ptr [ebp-24]
call _inet_ntoa@4
push eax
push -1
lea eax, [ebp-12]
push eax
call _fb_StrAssign@20
.Lt_0128:
lea eax, [ebp-12]
push eax
call _fb_StrAllocTempResult@4
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN7CLIONET17REMOTEPORT__get__Ev@4
__ZN7CLIONET17REMOTEPORT__get__Ev@4:
push ebp
mov ebp, esp
sub esp, 24
mov word ptr [ebp-4], 0
.Lt_0129:
mov dword ptr [ebp-20], 0
mov dword ptr [ebp-16], 0
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov dword ptr [ebp-24], 16
lea eax, [ebp-24]
push eax
lea eax, [ebp-20]
push eax
mov eax, dword ptr [ebp+8]
push dword ptr [eax+40]
call _getpeername@12
movzx eax, word ptr [ebp-18]
push eax
call _ntohs@4
mov word ptr [ebp-4], ax
.Lt_012A:
mov ax, word ptr [ebp-4]
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN7CLIONET14LOCALIP__get__Ev@4
__ZN7CLIONET14LOCALIP__get__Ev@4:
push ebp
mov ebp, esp
sub esp, 32
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov dword ptr [ebp-4], 0
.Lt_012B:
mov dword ptr [ebp-28], 0
mov dword ptr [ebp-24], 0
mov dword ptr [ebp-20], 0
mov dword ptr [ebp-16], 0
mov dword ptr [ebp-32], 16
lea eax, [ebp-32]
push eax
lea eax, [ebp-28]
push eax
mov eax, dword ptr [ebp+8]
push dword ptr [eax+40]
call _getsockname@12
push 0
push 0
push dword ptr [ebp-24]
call _inet_ntoa@4
push eax
push -1
lea eax, [ebp-12]
push eax
call _fb_StrAssign@20
.Lt_012C:
lea eax, [ebp-12]
push eax
call _fb_StrAllocTempResult@4
mov esp, ebp
pop ebp
ret 4
.balign 16

.globl __ZN7CLIONET16LOCALPORT__get__Ev@4
__ZN7CLIONET16LOCALPORT__get__Ev@4:
push ebp
mov ebp, esp
sub esp, 24
mov word ptr [ebp-4], 0
.Lt_012D:
mov dword ptr [ebp-20], 0
mov dword ptr [ebp-16], 0
mov dword ptr [ebp-12], 0
mov dword ptr [ebp-8], 0
mov dword ptr [ebp-24], 16
lea eax, [ebp-24]
push eax
lea eax, [ebp-20]
push eax
mov eax, dword ptr [ebp+8]
push dword ptr [eax+40]
call _getsockname@12
movzx eax, word ptr [ebp-18]
push eax
call _ntohs@4
mov word ptr [ebp-4], ax
.Lt_012E:
mov ax, word ptr [ebp-4]
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
	#..\src\CLionet.bas' compilation took 0.04965548636266703 secs

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
