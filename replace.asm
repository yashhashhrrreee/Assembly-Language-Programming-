.model small
.data
Str1 db "Mr.John$" 
RStr1 db 10 dup("$")
.code
mov ax,@data 
mov ds,ax
mov si,offset Str1 
mov di,offset RStr1 
mov cl,07h
X:mov al,[si] 
cmp al,4ah 
jnz s
sub al,03h 
s:
mov [di],al 
Inc di
Inc si 
Dec cl 
jnz X
lea dx,Rstr1 
mov ah,09h 
INT 21h
mov ah,4ch 
INT 21h
end
