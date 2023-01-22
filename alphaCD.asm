.model small
.stack 100
.code
    main proc
mov ah,02h
mov cl, 2ah
mov dl,cl
int 21h

mov ah,02h
mov cl, 43h
mov dl,cl
int 21h

mov ah,02h
mov cl, 44h
mov dl,cl
int 21h

mov ah,02h
mov cl, 2ah
mov dl,cl
int 21h

int 27h
MAIN ENDP
 END MAIN
