MODEL SMALL
.STACK 100
.DATA
STR1 DB 05H,45H,01H,69H
RES DB ?
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX
MOV CX,04H
MOV BL,0FH
 LEA SI,STR1
 UP:
 MOV AL,[SI]
 CMP AL,BL
 JGE NXT
 MOV BL,AL
 NXT:
 INC SI
 DEC CX
 JNZ UP

 MOV RES,BL
 INT 03H

 MOV AH,04CH
 INT 21H
 MAIN ENDP
 END MAIN