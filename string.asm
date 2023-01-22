.model small
.stack 100h
.data
;the string needed to be printed
string db "my name is imaad.","$"

.code
main proc
mov ax,@data
mov ds,ax

lea dx,string ;load address

;output
mov ah,09h
int 21h

mov ah,4ch
int 21h

main endp
end main
