.model small
.data
msg0 db "Enter the string:$" 
msg1 db "string length:$"
msg2 db 10,13,"entered string:$"
msg3 db 10,13,"Last three character in string:$" 
Str1 db 20,?,25 dup("$")
c db 0
.code
mov ax,@data 
mov ds,ax 
lea dx,msg0 
mov ah,09h 
INT 21h
lea dx,Str1 
mov ah,0Ah 
INT 21h
mov si,offset Str1 
mov cl,[si+1]

lea dx,msg2 
mov ah,09h 
INT 21h
lea dx,Str1+2
mov ah,09h 
INT 21h

lea dx,msg3
 
mov ah,09h 
INT 21h
mov ch,0h 
mov bx,3h 
sub cx,bx
lea dx,Str1+2 
add dx,cx
mov ah,09h 
INT 21h
mov ah,4ch 
INT 21h
end

