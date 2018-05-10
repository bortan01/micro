.model small
.stack
.data
.code
	inicio:
		mov ax,@data
		mov ds,ax
		
		
		mov ah,09h ; escribir un caracter con atributo
		mov al,50h ; codigo assci para la letra pagina
		mov bh,00h ;seleccionando la pagina
		mov bl,05h ;seleccionando el color
		mov cx ,000ah
		
		 
		
		.exit
	end inicio


