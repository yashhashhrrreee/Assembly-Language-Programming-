model small
.stack
.data
    input db "Input: $"
.code
org 100h

start:

    main proc

        mov ax,03
        int 10h

        mov ax,@data
        mov ds,ax   

        mov ah,9     
        lea dx, input
        int 21h

        mov ah,01
        int 21h

        mov dh,al
                mov ah,02
                mov dl,9
                int 21h
                mov dl,13
                int 21h

        mov cx,11
        W:
            mov dl,10
            int 21h
            LOOP W

        mov al,dh

        mov bl,al

        cmp bl, 'a'
        jb main
        cmp bl, 'z'
        ja main

        mov dl,al
        sub dl,20h

        mov ah,02
        int 21h

        mov cx,26
        mov dh,dl

            letters:

                 mov bx,cx

                 mov dl,dh

                 cmp dl,'Z'
                 je exit

                 inc dl
                 int 21h
                 mov dh,dl
                 mov cx,bx

            loop letters



        mov ah,4ch
        int 21h
    main endp

    down proc
                mov dl,13
                int 21h
                mov dl,10
                int 21h
                ret
            down endp

            exit proc

        mov cx,12
        Q:
            call down
            LOOP Q
            mov ah, 9

                mov ah,4ch
                int 21h
            exit endp

end start