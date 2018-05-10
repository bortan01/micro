.model small
.stack
.data
.code
	inicio:
		mov ah,9h ;escribir atributo o cuaracter en el cursor
		mov al,40h;codigo assci de la arroba
		mov bh,0h;pagina de video		
		mov bl,2h; color
		mov cx,37h; numero de veces
		int 10h;llamar a la vios
		Mov ax,4c00h 
		int 21h 
	end inicio