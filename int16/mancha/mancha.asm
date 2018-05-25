putPixel MACRO x,y,color
MOV AH, 0CH         ; funcion imprimir
MOV AL, color       ; Color del pixel
MOV BH, 0           ; pagina 0
MOV CX, x           ; horizontal (columna)
MOV DX, y
INT 10h          ; vertical (registro)
XCHG DX,CX
INT 10H
XCHG CX,DX
ENDM



.model small
.STACK
.data
.code
inicio

PROC FARo:
MOV AX,@data
MOV DS,AX
MOV AH, 00H          ;Modo video
MOV AL, 12H          ;resolucion 640 x 480 vga
INT 10H
MOV AH, 0Bh
MOV BH, 00h
MOV BL, 0  ;color de fondo
INT 10h
MOV CX,5
end proc

vertical:
putPixel CX,5,5
putPixel CX,100,5

INC CX
CMP CX,100
JB vertical
RET



END inicio
