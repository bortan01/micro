;------------------------------------------------------------------------------
; Programa que prueba las instrucciones: AAA y DAA
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;Definicion del segmento de pila
;------------------------------------------------------------------------------
PILA SEGMENT STACK "STACK"
     db   40h dup(0)
PILA ENDS

;------------------------------------------------------------------------------
;Definicion del segmento de codigo
;------------------------------------------------------------------------------
CODE SEGMENT
     assume CS:code, SS:pila

START:
    

     mov  al,9H
     add  al,9H
     daa            ;Ajuste BCD empaquetado

     mov  ax,4C00h
     int  21h

CODE ENDS
     END START