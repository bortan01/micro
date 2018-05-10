
.model small
.stack
.data
	
.code
	inicio:
	mov ax,@data
	mov ds,ax
	
	
	centrar_cursor:
		mov ah,02h
		mov dx,0c28
		int 10 
		
	
	.exit                        

	
	end inicio
	