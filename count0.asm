.model small
.data
NO DW 5555H 
Z DW 0
.code
MOV AX, @DATA 
MOV DS, AX 
MOV AX, NO 
MOV BX, 00H 
MOV CX, 10H 
UP:
ROL AX,1
JNc Zero 
JMP NXT
Zero: 
INC BX 
NXT: 
DEC CX 
JNZ UP

MOV Z, BX
Mov ah,4ch 
Int 21h 
End
