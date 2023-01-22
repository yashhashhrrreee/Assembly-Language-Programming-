.MODEL SMALL
.STACK 100
ASSUME CS:CODE,DS:DATA,ES:EXTRA
DATA SEGMENT
SOURCE  DB 11H,22H,33H,44H
DATA ENDS
EXTRA SEGMENT
    DEST DB ?
EXTRA ENDS
CODE SEGMENT   
    START:MOV AX,@DATA
MOV DS,AX
MOV AX,EXTRA
MOV ES,AX
MOV SI,OFFSET SOURCE
MOV DI,OFFSET DEST
MOV CX,0004H
CLC
RELOCATE:
MOV AL,[25h]
MOV ES:[50h],AL
INC SI
INC DI
DEC CL
JNZ RELOCATE
MOV AH,04CH
INT 21H
CODE ENDS
END START