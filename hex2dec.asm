.MODEL SMALL
.STACK 100H
.DATA
      N1 DB 0DH,0AH,"ENTER THE HEX NUMBER:$"
      N2 DB 0DH,0AH,"THE EQUIVALENT DEC ANSWER IS:$"
      NUM DW 0000H
      ARRAY DB 5 DUP(0)
.CODE
   MAIN PROC
MOV AX,@DATA
MOV DS,AX

LEA DX,N1
MOV AH,09H
INT 21H

MOV BX,0000H
MOV CX,0004H


L1: MOV AH,01H
INT 21H
CMP AL,'A'
JB SKIP1
SUB AL,07H
       SKIP1:   SUB AL,30H
ADD BL,AL
ROL BX,04H
DEC CX
JNZ L1
ROR BX,04H
MOV NUM,BX
MOV AX,NUM
MOV DX,0000H
MOV BX,000AH

LEA SI,ARRAY
MOV DI,SI


      L2:   DIV BX
            MOV [SI],DL
            INC SI
            MOV DX,0000H
            CMP AX,0000H
            JNZ L2

            LEA DX,N2
            MOV AH,09H
            INT 21H
            DEC SI

           

            MOV CH,05H

    L3:     MOV DL,[SI]
            CMP DL,09H
            JBE SKIP2
            ADD DL,07H
   SKIP2:   ADD DL,30H

            MOV AH,02H
            INT 21H
            DEC SI
            CMP SI,DI

            DEC CH
            JNB L3

 
           MOV AH,4CH
           INT 21H
    MAIN ENDP
END MAIN
