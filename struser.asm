.model small 
.stack 100h 
.data 
buffer db 8 
db 9(?) 
.code 
start: 
mov dx,offset buffer 
mov ah,0Ah 
int 21h 
int 27h 
end  
