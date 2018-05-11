.model small
.stack 
.data
.code
inicio:
	mov ax,@data
	mov ds,ax
		
	imprime proc near
		mov dl,"A"
		mov cx,25
		lazo:
			call escribe_char
			inc dl
			cmp dl ,"Z"
				JLE lazo
			.exit
	imprime endp
	
	escribe_char proc near
		mov ah,02;
		int 21h
		ret
	escribe_char endp	
	
	salir:
		.exit
	
end inicio
	
