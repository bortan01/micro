    
.model small
.stack
.data
.code
	inicio:
		mov ah,09h; preparando para imprimir caracter
		mov al,3ah; ascci del caracter
		mov bh,0h ; pagina de video
		mov bl,8dh;atributo a  usar
		mov cx,37h ;numero de repeticiones
		int 10h
	
		
		Mov ax,4c00h 
		int 21h 
	end inicio