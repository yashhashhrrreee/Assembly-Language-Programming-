.model small
.stack 100h
.data
          num db 25h,35h,45h,60h,75h
          sum dw 0000h
          sumh dw 0000h
          perh db 00h
          perd dw 0000h
          grade db 00h
          m1 db 0dh,0ah,"The sum = $"
          m2 db 0dh,0ah,"Percentage=$"
          m3 db 0dh,0ah,"Grade =$"
          multi db 01h

               ; Grades
          grd DB 10,13,"Your grade is : $"
         
          Aplus DB "A plus $"
          Ag DB "A $"
          Bg DB "B $"
          Pg DB "P $"
          Fg DB "F $"
.code

                    mov ax,@data
                    mov ds, ax

                    mov bx,0000h
                    mov ax,0000h
                    mov cl,05h

         again: add al,num[bx]
                    daa
                    adc ah,00h
                    inc bx
                    dec cl
                   jnz again
                   mov sum,ax
                   lea dx,m1
                   mov ah,09h
                   int 21h

                  mov cl,04h 
          repl: mov ax,sum
                  rol ax,04h
                  mov sum,ax
                  and al,0Fh
                  add al,30h
                  mov dl,al
                  mov ah,02h
                  int 21h 
                  dec cl
                  jnz repl

                  mov cl,03h
                 
         rep2: mov ax,sum
                  and al,0Fh
                  mul multi
                  add sumh,ax
                  mov ax,sum
                  ror ax,04h
                  mov sum,ax
                  mov al,multi
                  mov bl,0ah
                  mul bl
                  mov multi,al
                  dec cl
                  jnz rep2

                 mov bl,05
                 mov ax,sumh
                 div bl
                 mov perh,al
                 mov cl,perh
                 mov ax,0000h

       rep3: add ax,0001h
                daa
                dec cl
                jnz rep3
                mov perd,ax
          
                lea dx,m2
                mov ah,09h
                int 21h
         
               mov cl,04h
      rep4: mov ax,perd
               rol ax,04h
               mov perd, ax
               and al,0Fh
               add al,30h
               mov dl, al
               mov ah,02h
               int 21h
               dec cl
               jnz rep4

           CMP PERD,40H                  
           JBE FAIL                          
           CMP PERD,90H
           JAE 
           CMP PERD,50H
           JBE P
           CMP PERD,75
           JBE B
           CMP PERD,75
           JA A                                             ;
           JMP exit

  FAIL :  LEA DX,grd                    
            MOV AH,09H
            INT 21H
            LEA DX,Fg                       
            MOV AH,09H
            INT 21H
            JMP exit                       

  Ap :   LEA DX,grd
            MOV AH,09H
            INT 21H
            LEA DX,Aplus                       
            MOV AH,09H
            INT 21H
     JMP 

   P :    LEA DX,grd
           MOV AH,09H
            INT 21H
            LEA DX,Pg                                   
            MOV AH,09H
            INT 21H
            JMP exit                      

   B :    LEA DX,grd
            MOV AH,09H
            INT 21H
            LEA DX,Bg                       
            MOV AH,09H
            INT 21H
            JMP exit 
                               
  A :    LEA DX,grd
            MOV AH,09H
            INT 21H
            LEA DX,Ag                       
            MOV AH,09H
            INT 21H
            JMP exit                       

  exit :  mov ah,4ch
           int 21H

     
end
