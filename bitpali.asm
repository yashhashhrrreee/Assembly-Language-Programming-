model small
.stack 100
.data
pali db 0a6h
msg1 db 0ah,0dh," palindrome $"
msg2 db 0ah,0dh," not a palindrome $"
.code
start : Mov ax,@data
Mov ds,ax
Mov al,pali
Mov bl,al
and al,81h ;81h= 10000001b
Jnp no
Mov al,bl
and al,42h ;42h= 01000010b
Jnp no
Mov al,bl
and al,24h ;24h= 00100100b
Jnp no
Mov al,bl
and al,18h ;18h=00011000b
Jnp no
Mov dx,offset msg1
Mov ah,09h
Int 21h
jmp exit
no: Mov dx, offset msg2
Mov ah, 09h
Int 21h
exit:
mov ah,4ch
int 21h
end