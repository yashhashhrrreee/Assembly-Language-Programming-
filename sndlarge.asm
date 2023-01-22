.model small
.data
ar db 1h,2h,3h,4h,5h,9h,7h,6h,8h,10h
msg db 10,13,"The second largest no is $" 
s db 0h
m db 0h
.code
mov ax,@data 
mov ds,ax
mov si,offset ar 
mov al,[si]
mov m,al 
mov cl,09H 
inc si
L1: 
mov al,[si] 
cmp m,al 
jnc L2
mov bl,m 
mov s,bl 
mov m,al 
cmp cl,01h 
jz L3 
L2:
inc si 
dec cl
jnz L1 
L3:
lea dx,msg
mov ah,09H
 
int 21H 
mov dl,s 
add dl,30h 
mov ah,02h 
int 21H 
mov ah,4ch 
int 21H 
end
