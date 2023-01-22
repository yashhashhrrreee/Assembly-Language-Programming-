.model small
.data
str1 db "alam" ; String to be checked for palindrome
slen equ ($-str1)
str2 db 40 dup(0)
msg1 db "Palindrome$"
msg2 db "Not Palindrome$"
.code
start: mov ax,@data
mov ds,ax
mov es,ax ; Initialize extra segment
mov cx,slen ; Length of the string
lea si, str1
add si,slen-1 ; get the last byte of the data
lea di, str2
up: mov al,[si]
mov [di],al ; load the byte from [Si] to [Di]
dec si
inc di
loop up ; Repeat the process
lea si, str1
lea di, str2
mov cx,slen
cld ; Clear the direction flag
repe cmpsb ; compare the string bytes present in SI & DI
jne down ; Jump if the strings are not equal
lea dx, msg1
jmp down1
down: lea dx, msg2
down1: mov ah, 09h
int 21h
mov ah,4ch
int 21h
end