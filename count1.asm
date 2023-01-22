.model small
.data
NO DW 1234H 
O DW 0
.code
MOV AX, @DATA 
MOV DS, AX 
MOV AX, NO 
MOV BX, 00H 
MOV CX, 10H

UP:
ROL AX,1
JC One 
JMP NXT

One:
INC BX


NXT: 
DEC CX 
JNZ UP

MOV O, BX
Mov ah,4ch 
Int 21h 
end
