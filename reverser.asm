.model small

.stack 100h

.data
msg_in db "Enter a text: $"
msg_out db 0ah, 0dh, "Each word reversed: $"

.code 
main proc
;init data 
mov ax, @data 
mov ds, ax

;prompt 
mov ah, 9
lea dx, msg_in 
int 21h

;input
xor cx, cx 
INPUT:
mov ah, 1 
int 21h
cmp al, 0dh 
je BR_INPUT 
xor ah, ah 
push ax
inc cx 
jmp INPUT
BR_INPUT:

;check for empty input 
cmp cx, 0
je PRINT

;process second stack 
mov bx, 50h

REVERSE:
pop dx
xchg bx, sp 
push dx 
xchg bx, sp
loop REVERSE

;print
 
PRINT:
mov ah, 9
lea dx, msg_out 
int 21h

xchg bx, sp 
mov ah, 2

WHILE:
xor cx, cx

WORD:
cmp sp, 50h 
jge BR_WORD 
pop dx
cmp dx, 20h 
je BR_WORD

xchg bx, sp 
push dx
inc cx 
xchg bx, sp

jmp WORD 
BR_WORD:
xchg bx, sp

PRINT_WORD:
pop dx

int 21h
loop PRINT_WORD 
xchg bx, sp

cmp sp, 50h 
jge BR_WHILE 
mov dl, 20h 
int 21h

jmp WHILE 
BR_WHILE:
;exit
mov ah, 4ch 
int 21h 
main endp

end main
