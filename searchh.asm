model small
.stack 100
.data
Str1 db "World$"
p db " is Present in $"
np db " is Not Present in $" 
R db 72h
.code
mov ax,@data 
mov ds,ax
mov si,offset Str1 
mov cl,05h
mov dl,R 
mov ah,02h 
INT 21h
X:
mov al,[si] 
cmp R,al 
jnz s
lea dx,p 
jmp Y 
s:
Inc si 
Dec cl 
jnz X
lea dx,np 
Y:
mov ah,09h
INT 21h
 
lea dx,Str1 
mov ah,09h 
INT 21h
mov ah,4ch 
INT 21h
End
