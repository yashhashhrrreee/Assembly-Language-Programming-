.MODEL SMALL
.DATA

 STRING DB 50,?,50 DUP("$")                  
.CODE

      MOV AX,@DATA                              
      MOV DS,AX                                
      MOV ES,AX                                

      lea DX,STRING                            
      MOV AH,0AH                               
      INT 21H
      MOV DL,0AH                               
      MOV AH,02H
      INT 21H

      MOV DL,0DH                               
      MOV AH,02H
      INT 21H

      LEA SI,STRING+2                             
      MOV BH,STRING+1                         
                                                                 

L1  :    MOV AL,[SI]                                     

       LEA DI,STRING+2                           
       MOV CH,STRING+1                        
                                                                
       MOV BL,00H                            
   L2 :  CMP AL,[DI]                            
       JNE NO                                   
       INC BL                                     
   NO : INC DI                                 
       DEC CH
       JNZ L2                                 

       MOV DL,AL                           
       MOV AH,02H
       INT 21H

       MOV DL,20H                        
       MOV AH,02H
       INT 21H
                  
        MOV CL,04H                           
        MOV CH,02H                          
CNT :  ROL BL,CL
        MOV DL,BL
        AND DL,0FH                         
        CMP DL,09H
        JBE ADD30
        ADD DL,07H
ADD30 :ADD DL,30H
        MOV AH,02H                         
        INT 21H
       ; DEC 
        JNZ CNT                              

       MOV DL,0AH                              
       MOV AH,02H
       INT 21H

       MOV DL,0DH                               
       MOV AH,02H
       INT 21H

     INC SI                                   
     DEC BH                                
     JNZ L1                                  

    MOV AH,4CH                              ; Exit program
    INT 21H

END
