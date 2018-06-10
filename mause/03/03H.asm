.model small
.stack
.data
.code
MAIN PROC FAR   ;INCIIO
    
CALL Funcion_00H 
CALL Funcion_01H
CALL Funcion_03H
 

Mov ax, 4C00h
Int 21h

RET
MAIN ENDP ;FIN

Funcion_00H PROC NEAR    
; verificar si hay un mouse conectado
Mov ax,00
int 33h
RET 
Funcion_00H ENDP

Funcion_01H PROC NEAR    
; Mostrar el cursor del mouse en la pantalla
Mov ax,01
int 33h
RET 
Funcion_01H ENDP

Funcion_03H PROC NEAR    
; Obtener la posicion y el estado de los botones del mouse
Mov ax,0003h
repite:
int 33h
cmp bx,2h  ;COMPARA
je fin_repite      ;Salta si es igual o salta si es cero
jmp repite
fin_repite:
RET 
Funcion_03H ENDP