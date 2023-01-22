.model small
.stack 100
.code
main proc
mov ah,02h
mov cl, 41h
mov dl,cl
int 21h
main endp
end main