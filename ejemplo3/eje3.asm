.model small

.stack 200h;este es el tamanio de la pila 

;delcarancion de constantes 
;constantes
.const
VAL_LF EQU 10 ; CONSTANTE PARA EL LINE FEED
VAL_RET EQU 13 ;CONSTANTE PARA EL RETORNO
CONSTAN_FIN EQU '$' ;CONSTANTE PAR INDENTIFICAR EL FIN DE UNA CADENA
STR_MSG EQU "TERCER PROGRAMA EN ENSAMBLADOR"

.data 
strMensaje2 db STR_MSG,VAL_LF,VAL_RET,CONSTAN_FIN

.code 

.startup
;inicio   inicio de codigo
	mov ax,@data
	mov ds,dx
	mov dx,offset strMensaje2 ; colocamos en dx el mensaje
	
	mov ah,09;colocamos en ah el valor 09 para indicar la interrupcion 09
	
	int 21h ; ejecutamos la interrupcion para el mensaje en la pantalla
	
	;preparamos salida del programa
	;mov ax,4c00h
	;int 21
	
    .exit
end ;inicio

