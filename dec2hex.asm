.MODEL SMALL
.STACK 100H
.DATA
                   M1 DB 0DH,0AH,"ENTER A 5 DIGIT DECIMAL NUMBER:$"
                   M2 DB 0DH,0AH,"THE HEXADECIMAL EQUIVALENT :$"
                   NUM1 DW 10000D
                   NUM2 DW 10D
                   SUMR DW 0000H
                   SUML DW 0000H
                   COUNT DB 00H
                    ARRAY DB 5 DUP(0) ;CREATING THE ARRAY
.CODE
        MAIN PROC
                    MOV AX,@DATA
                   MOV DS,AX

                    LEA DX,M1
                   MOV AH,09H
                   INT 21H

                   MOV BX,0000H
                   MOV CX,0005H
                    LEA SI, ARRAY
                   MOV DI,SI
   LOOP1 :  MOV AH,01H
                     INT 21H
                     SUB AL,30H
                    MOV [SI],AL
                    INC SI
                    DEC CX
                    JNZ LOOP1

                    LEA DX,M2
                    MOV AH,09H
                    INT 21H
                    MOV CL, 05H
                    LEA SI, ARRAY
         REP2: MOV DX, 0000H
                    MOV BH, 00H
                    MOV BL, [SI]
                    MOV AX, NUM1
                     MUL BX
                     ADD SUMR, AX
                    ADC SUML, DX
                    MOV DX, 0000H
                     INC SI
                     MOV BX, NUM2
                    MOV AX, NUM1
                    DIV BX
                    MOV NUM1,AX
                    LOOP REP2


                    MOV CL,04H
        REP3: MOV AX,SUML
                     ROL AX,04H
                     MOV SUML,AX
                     AND AL,0FH
                    CMP AL,09H
                    JBE AGAIN
                    ADD AL,07H
    AGAIN: ADD AL,30H
                   MOV DL,AL
                   MOV AH,02H
                   INT 21H
                   LOOP REP3

                   MOV CL,04H
       REP4: MOV AX,SUMR
                   ROL AX,04H
                   MOV SUMR,AX
                   AND AL,0FH
                   CMP AL,09H
                   JBE AGAIN2
                   ADD AL,07H
  AGAIN2: ADD AL,30H
                   MOV DL,AL
                  MOV AH,02H
                  INT 21H
                  LOOP REP4
                  MOV AH,04CH
                  INT 21H

          MAIN ENDP
  END MAIN
