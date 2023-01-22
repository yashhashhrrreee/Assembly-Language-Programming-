[2:55 pm, 17/12/2022] Imaad Hajwane: .model small
.stack 100
.data
m1 db 10,13, 'Enter a number: $'
m2 db 10,13, 'Enter the dividend: $'
m3 db 10,13, 'Enter the divisor: $'
n1 db 10,13, 'Sum is: $'
n2 db 10,13, 'Difference is: $'
n3 db 10,13, 'Multiplication is: $'
n4 db 10,13, 'Quotient is: $'
n5 db 10,13, 'Remainder is: $'
x db 0h
y db 0h
x1 dw 0h
y1 db 0h
.code
mov ax,@data
mov ds,ax
mov cl,04h
mov ch,02h
mov ah,09h
lea dx,m1
int 21h
i1:
mov ah,01h
int 21h
sub al,30h
cmp al,09h
jbe i2
sub al,07h
i2:
cmp ch,01h
jz i3
rol al,cl
mov bl,al
i3:
dec ch
jnz i1
add bl,al
mov x,bl
mov ah,09h
lea dx,m1
int 21h
 mov ch,02h
i4:
mov ah,01h
int 21h
sub al,30h
cmp al,09h
jbe i5
sub al,07h
i5:
cmp ch,01h
jz i6
rol al,cl
mov bl,al
i6:
dec ch
jnz i4
add bl,al
mov y,bl
mov ah,09h
lea dx,m2
int 21h
mov ch,02h
j1:
mov ah,01h
int 21h
sub al,30h
cmp al,09h
jbe j2
sub al,07h
j2:
cmp ch,01h
jz j3
rol al,cl
mov bl,al
j3:
dec ch
jnz j1
add bl,al
mov bh,bl
mov ch,02h
j4:
mov ah,01h
int 21h
sub al,30h
cmp al,09h
jbe j5
sub al,07h
 j5:
 cmp ch,01h
jz j6
rol al,cl
mov bl,al
j6:
dec ch
jnz j4
add bl,al
mov x1,bx
mov ah,09h
lea dx,m3
int 21h
mov ch,02h
j7:
mov ah,01h
int 21h
sub al,30h
cmp al,09h
jbe j8
sub al,07h
j8:
cmp ch,01h
jz j9
rol al,cl
mov bl,al
j9:
dec ch
jnz j7
add bl,al
mov y1,bl
mov ah,09h
lea dx,n1
int 21h
mov bl,x
add bl,y
mov ch,02h
mov bh,bl
o1:
rol bh,cl
mov dl,bh
and dl,0Fh
cmp dl,09h
jbe o2
add dl,07h
 o2:
 add dl,30h
mov ah,02h
int 21h
dec ch
jnz o1
mov ah,09h
lea dx,n2
int 21h
mov bl,x
sub bl,y
mov ch,02h
mov bh,bl
o3:
rol bh,cl
mov dl,bh
and dl,0Fh
cmp dl,09h
jbe o4
add dl,07h
o4:
add dl,30h
mov ah,02h
int 21h
dec ch
jnz o3
mov ah,09h
lea dx,n3
int 21h
mov al,x
mov bl,y
mul bl
mov ch,04h
mov bx,ax
o5:
rol bx,cl
mov dl,bl
and dl,0Fh
cmp dl,09h
jbe o6
add dl,07h
o6:
add dl,30h
mov ah,02h
 int 21h
dec ch
jnz o5
mov ah,09h
lea dx,n4
int 21h
mov ax,x1
mov bl,y1
div bl
mov ch,02h
mov bx,ax
o7:
rol bl,cl
mov dl,bl
and dl,0Fh
cmp dl,09h
jbe o8
add dl,07h
o8:
add dl,30h
mov ah,02h
int 21h
dec ch
jnz o7
mov ah,09h
lea dx,n5
int 21h
mov ch,02h
o9:
rol bh,cl
mov dl,bh
and dl,0Fh
cmp dl,09h
jbe o10
add dl,07h
o10:
add dl,30h
mov ah,02h
int 21h
dec ch
jnz o9
mov ah,4ch
int 21h
end