.model small
.stack 100
.code
    main proc
mov ah,02h
mov cl, 5Fh
mov dl,cl
int 21h

mov ah,02h
mov cl, 45h
mov dl,cl
int 21h

mov ah,02h
mov cl, 4Ch
mov dl,cl
int 21h

mov ah,02h
mov cl, 2ah
mov dl,cl
int 21h

int 27h
MAIN ENDP
 END MAIN
