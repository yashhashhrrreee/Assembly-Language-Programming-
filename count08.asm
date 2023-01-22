.model small
.data
NO DB 55H 
Z DB 0H
.code
MOV AX, @DATA 
MOV DS, AX 
MOV AL, NO 
MOV BL, 00H 
MOV CX, 8H

UP:
ROL AL,1
JNc Zero 
JMP NXT

Zero:
INC BL


NXT: 
DEC CX 
JNZ UP

MOV Z, BL
Mov ah,4ch 
Int 21h 
end
