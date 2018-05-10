    
.model small
.stack
.data
.code
	inicio:
		Mov AX, @Data ;Obtiene la direccion del segmento de datos 
		Mov Ds, Ax ;Inicializa a DS con esa direccion      
		
		PUSH AX
		PUSH CX
		MOV AH,01h
		MOV CH,01h
		MOV CL,01h
		INT 10h
		POP CX
		POP AX
		RET
			
		Mov ax,4c00h 
		int 21h 
	end inicio


