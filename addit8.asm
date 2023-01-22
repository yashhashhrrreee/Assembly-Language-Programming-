.model small
.stack 100
.data
	a db 09h
	b db 02h
	c dw ?
.code
			main proc
	mov ax,@data
	mov ds,ax

	mov al,a
	mov bl,b
	add al,bl

	mov c,ax

	mov ah,4ch
	int 21h
			main endp
end main