.model small
.stack
.data
.code
	inicio:
		PUSH AX 
PUSH BX 
PUSH CX 
PUSH DX 
MOV AX, 0600h 
MOV BH, 71h ; FONDO BLANCO CON PRIMER PLANO AZUL 
MOv CX, 0202h 
MOV DX, 194c
h 
INT 10h 
POP DX 
POP CX 
POP BX 
POP AX 

		
		.exit
	end inicio


