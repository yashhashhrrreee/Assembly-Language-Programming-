.model small
.data
msg0 db "Enter the string:$" 
msg1 db "string length:$"
msg2 db 10,13,"entered string:$"
msg3 db "Enter the character in string to replace:$" 
msg4 db 10,13,"result string:$"
Str1 db 20,?,25 dup("$")
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
 mov  cl,[si+1] 
 lea dx,msg1
mov ah,09h 
INT 21h
mov dl,cl 
add dl,30h 
mov ah,02h
 Int 21h
 
lea dx,msg3 
mov ah,09h 
INT 21h
mov ah,01h 
INT 21h
mov bl,al
 lea dx,msg2 
 mov ah,09h 
 INT 21h
lea dx,Str1+2 
mov ah,09h 
INT 21h

mov si,offset Str1+2 
 X:
 mov al,[si]
  cmp al,bl
  jnz s
  mov al,5ah
  mov [si],al
  s:
  Inc si
  Dec cl
  jnz X 
  lea dx,msg4 
  mov ah,09h 
  INT 21h

lea dx,Str1+2
 mov ah,09h 
 INT 21h
 
mov ah,4ch
 INT 21h
end
