.model small
.stack 100h
.data
str1 db 'imaad$'
str2 db 10 dup('$')

.code
mov ax,@data
mov ds,ax
mov cx,04h
lea si,str1
lea di,str2

l1: mov al,[si]
    mov [di],al
    inc si
    inc di
    loop l1

mov ah,09h
lea dx,str2
int 21h

MOV AH,4CH
INT 21H
END
