.Model small
.stack
.data
.code
inicio:
	mov ax,@data
	mov ds,ax

	call leertecla
	mov ah,0Eh ;Desplegar un carácter en la pantalla actualizando la posición del cursor
	int 10h
	jmp inicio

	leertecla:
		mov ah,00 ; para capturar un caracter 
		int 16h
		
		CMP ah,27h
		JE cambiarletra
		RET
	cambiarletra:
		mov al,0A5h
		RET	
end inicio
 