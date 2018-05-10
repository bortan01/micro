.model small

;segmento de pila 
Pila SEGMENT STACK 'STACK' 
DB 200H DUP(?) ;DUP ? INDICA QUE ESTA SIN INICIALIZAR
Pila ENDS

Datos SEGMENT 'DATA'
	strMensaje db "hola xD",10,13, "$"
	strMensaje2 db "este es otro mensaje",10,13, "$"
Datos ENDS	

;directivas para iniciar el codigo 
Codigo SEGMENT 'CODE'
	ASSUME  CS:Codigo, DS:Datos , SS : Pila

	;inicio del codigo 
inicio:
	mov ax,seg Datos
	mov ds,ax ; mueve el mismo valor a ds
	
	;colocamos en dx el valor del mensaje  
	mov dx,offset strMensaje
	
	mov ah,09;preparamos la funcion para imprimir el mensaje
	int 21h;interrumpimos y mostramos el mensaje
	
	
	;colocamos en dx el valor del mensaje2
	mov dx,offset strMensaje
	
	mov ah,09;preparamos la funcion para imprimir el mensaje
	int 21h;interrumpimos y mostramos el mensaje

	END inicio	
Codigo ENDS


	
