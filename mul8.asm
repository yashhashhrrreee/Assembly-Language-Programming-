.model small 
.stack 100h 
.data 
n1 db 0AAH
n2 db 0AAH 
PRO_LSB db 00h 
PRO_MSB db 00h 
.code   
main proc      
mov ax,@data    
 mov ds,ax     
 mov al,00h    
 mov ah,00h     
 mov al,N1     
 mov bl,N2     
 mul bl 
mov PRO_LSB,al 
     
    mov PRO_MSB,ah     
    mov ah,4ch     
    int 21h 
    main endp 
end main 
