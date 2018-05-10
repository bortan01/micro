.model small

.stack 200h;este es el tamanio de la pila 

.data 
strMensaje db "hola xD",10,13, "$"
strMensaje2 db "este es otro mensaje",10,13, "$"

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

