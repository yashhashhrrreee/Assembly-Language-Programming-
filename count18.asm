.model small
.data
NO Db 12H
O Db 0h
.code
MOV AX, @DATA 
MOV DS, AX 
MOV AL, NO 
MOV BL, 00H 
MOV CX, 8H

UP:
ROL AL,1
JC One 
JMP NXT

One:
INC BL


NXT: 
DEC CX 
JNZ UP

MOV O, BL
Mov ah,4ch 
Int 21h 
End
