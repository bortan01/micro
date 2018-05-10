READKEY MACRO ;Equivalente de ReadKey en otros lenguajes
 MOV AH,10h ;CAPTURA DESDE TECLADO
 INT 16h ;INTERRUPCION DE 16H ENTRADA/SALIDA DE TECLADO
 ENDM
 imprimir MACRO titulo ;Macro con parametro (titulo)
 MOV DX,OFFSET titulo
 MOV AH,09h
 INT 21h
 ENDM
 .MODEL SMALL
 .STACK
 .DATA
aviso DB 'Presione una tecla de extendida: ','$'
letra DB 'Presionada esc para Salir','$'
letra2 DB 'Tecla presionada F1','$'
letra3 DB 'Tecla presionada F2','$'
letra4 DB 'Tecla presionada F3','$'
letra5 DB 'Tecla presionada F4','$'
letra6 DB 'Tecla presionada Insert','$' 
.CODE
.STARTUP
 imprimir letra
 CALL salto
 OTRO:
 READKEY ; esperar por tecla

 CMP AH,52h
 JE Ins

 CMP AH,59
 JE F1

 CMP AH,60 ;
 JE F2

 CMP AH,61 ;Tecla 
JE F3

 CMP AH,62 ;
 JE F4

 CMP AL,1BH ;
 JE SALIR ;Etiqueta que va a donde se regresa a modo MSDOS, y termina el

 JNE OTRO ;Otra iteración o ciclo (Leemos otra tecla para mover punto)
F1:
imprimir letra2
CALL salto
JMP OTRO
F2:
imprimir letra3
CALL salto
JMP OTRO
F3:
Imprimir letra4
CALL salto
JMP OTRO
F4:
imprimir letra5
CALL salto 

JMP OTRO
Ins:
imprimir letra6
CALL salto
JMP OTRO
SALIR: ;Etiqueta que representa el final de la aplicación.
.EXIT
salto:
MOV AH,02h
MOV DL,10
INT 21h
MOV AH,02h
MOV DL,13
INT 21h
RET
END
model small
.stack
.data 
.code
