;Ejemplo 1: desplegar un texto sencillo
.MODEL SMALL ; Define el modelo de memoria 
.stack 
.DATA ; Define el segmentos de datos 
	msj DB "Texto a imprimir",13,10,"$" 
.CODE ;Define el area de codigo 
	inicio: 
		Mov AX, @Data ;Obtiene la direccion del segmento de datos 
		Mov Ds, Ax ;Inicializa a DS con esa direccion 
		Mov Dx, Offset Msj ;Despliega el mensaje 
		mov ah,09h 
		int 21h 
		Mov ax,4c00h 
		int 21h 
End inicio
