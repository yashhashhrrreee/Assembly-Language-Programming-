.model small
.stack 100
data segment
    org 3000h
    x db ?
data ends
code segment
    assume cs:code, ds:data
start:
mov ax, @data
mov ds,ax ; Initializing data segment
    lea si,x
    mov ax,100h
mov bx,ax ; Sore the number in bx for later use
mov Cx,0fh
and ax,cx ; getting the first digit (6) of the dec num
mov [si],al ; Directly store it in memory

mov ax,bx ; get back the original dec num
mov Cx,0f0h
and ax,cx ; getting second digit (0050)
mov cx,04h
shr ax,cl ; shift right to get single digit (05)
mov cx,0ah
mul cx ; multiply by base value (0AH)
add [si],al ; add with the stored previous digit(6)

mov ax,bx ; get back the original dec num
mov Cx,0f00h
and ax,cx ; getting third digit (200)
mov cx,08h
shr ax,cl ; shift right to get single digit (002)
mov cx,64h
mul cx ; multiply by base value (64H)
clc ; clear carry to neglect carry
add [si],al ; add with the stored previous value(38)
adc [si+1],ah ; since carry will be generated add it to the value
mov ax,bx ; get back the original dec num
mov Cx,0f000h
and ax,cx ; getting fourth digit (9000)
mov cx,0ch
shr ax,cl ; shift right to get single digit (0009)
mov cx,3e8h
mul cx ; multiply by base value (3e8H)
clc
add [si],al
adc [si+1],ah

int 3h
code ends
end start