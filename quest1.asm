.586
.MODEL FLAT
INCLUDE io.h
.STACK 4096
.DATA

  arr_m DWORD 1, 2, 3, 4 , 5, 6, 7, 8
  n1 = ($- arr_m)/4
  opr1 BYTE 11 DUP (?),0
  res BYTE "the result is ",0

.CODE
  MainProc PROC
  mov ecx,0
  mov ebx,offset arr_m
  sub esi,esi
  mov ecx,n1
  shr ecx,1
  mov edi,n1
  imul edi,4
  sub edi,4

  rev:
 mov al,[ebx+esi]
 mov ah,[ebx+edi]
 mov [ebx+esi],ah
 mov [ebx+edi],al
 sub edi,4
 add esi,4
 loop rev

 mov ebx,offset arr_m
 sub esi,esi
 mov edx,0
 mov ecx,n1

 print:
 mov edx,[ebx+esi]
 dtoa opr1,edx
 output res,opr1
 add esi,4
 loop print

   mov eax,0
   ret
   MainProc ENDP
   END
