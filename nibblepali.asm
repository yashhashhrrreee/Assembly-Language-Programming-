.model small
.data
num db 84h
msg1 db 0ah,0dh,"it is a palindrome$"
msg2 db 0ah,0dh,"it is not a palindrome$"
.code
Mov ax,@data ; Initialize data segment
Mov ds,ax
Mov al, num ; Move number to ax
Mov cl, 04 ; Move 04 to cl
Mov bl, al ; Move ax to bx
Clc ; Clear carry
up: ror bl,01 ; Rotate right bl once, through carry
Dec cl ; Decrement cl
Jnz up ; Repeat the loop if cl!=0,
cmp al,bl ;if cl=0, compare bh with bl
jz pali ;If bh=bl, jump to label pali
Mov ah, 09h ;Display _it as a not palindrome.
Lea dx, msg2
Int 21h
jmp End1 ;Jump to label End1
pali: Mov ah,09h ;Display _it is a palindrome.
Lea dx, msg1
Int 21h
mov ah,4ch
int 21h
end