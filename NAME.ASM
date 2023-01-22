.model small
.stack 100
.code
    main proc
mov ah,02h
mov cl, 49h
mov dl,cl
int 21h

mov ah,02h
mov cl, 4Dh
mov dl,cl
int 21h

mov ah,02h
mov cl, 41h
mov dl,cl
int 21h

mov ah,02h
mov cl, 41h
mov dl,cl
int 21h

mov ah,02h
mov cl, 44h
mov dl,cl
int 21h

int 27h
main endp
 end main
