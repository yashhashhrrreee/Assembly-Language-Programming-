.MODEL SMALL
.DATA
        
    Menu DB "........Enter.........",10,13
           DB "1.ACCEPT STRING",10,13,"2.Display string",10,13
           DB "3.String length",10,13,"4.Reverse string",10,13
           DB "5.Exit",10,13,"$"
     Entstr DB 10,13,"Enter a string : $"
     EnCh DB 10,13,"Enter choice : $"
     msg DB 10,13,"Entered string is : $"
     Strlen DB 10,13,"String length is : $"
     Revstr DB 10,13,"Reversed strng is : $"
     STR1 DB 50,?,50 dup("$")                   
     STR2 DB 50,?,50 dup("$")                   

.CODE

     MOV AX,@DATA                             
     MOV DS,AX                                
     MOV ES,AX                               
     lea DX,MENU                              
     MOV AH,09H                               
     INT 21H
     MOV DL,0AH                            
     MOV AH,02H
     INT 21H

     MOV DL,0DH                     
    MOV AH,02H
     INT 21H
   M1 :lea DX,Ench                              
      MOV AH,09H                               
      INT 21H
      MOV AH,01H                               
      INT 21H
      SUB AL,30H                               
      MOV BL,AL

      MOV DL,BL
        MOV AH,02H
        INT 21H
        MOV DL,0DH                              
        MOV AH,02H
        INT 21H
     CMP BL,01H                                    
     JZ L1                                             
     CMP BL,02H
     JZ L2                                              
     CMP BL,03H
     JZ L3                                              
    CMP BL,04H
     JZ L4                                               
     JZ EXT                                          
    L1 :
     lea DX,Entstr                           
     MOV AH,09H                                
     INT 21H
     LEA DX,STR1
     MOV AH,0AH
     INT 21H
     JMP M1
  L2 :
  lea DX,msg                              
  MOV AH,09H                               
  INT 21H  
  LEA DX,STR1+2                            
  MOV AH,09H                               
  INT 21H
  JMP M1                                   
  L3 :
     LEA DX,STRLEN                            
        MOV AH,09H
        INT 21H

        MOV BL,Str1+1                        
          MOV CL,04H                           
          MOV CH,02H                           
       LEN :  ROL BL,CL
          MOV DL,BL
          AND DL,0FH                           
          CMP DL,09H
         JBE AD30
         ADD DL,07H
      AD30 :  ADD DL,30H
      MOV AH,02H                           
      INT 21H
      DEC CH                               
         JNZ LEN                                   
        JMP M1                              
    L4 :
       MOV CL,STR1+1                            
       LEA SI,STR1+2                               
       LEA DI,STR2                                

       MOV CH,00H
       ADD SI,CX                                  
       DEC SI                                       
       XYZ:   MOV AL,[SI]                              
       MOV [DI],AL                              
       DEC SI
       INC DI
       DEC CL                                  
       JNZ XYZ                                   
      lea DX,revstr                             
      MOV AH,09H
      INT 21H
      LEA DX,STR2                               
      MOV AH,09H                                
      INT 21H
      JMP M1                                    
    EXT :    MOV AH,4CH                             
      INT 21H

END

