.model samll
.stack 
.data
	cad1 db "universidad de El Salvador",13,10,"$"
	cad2 db "Facultad Multidisciplinaria",13,10,"$"
	cad3 db "Departamento de informatica",13,10,"$"
.code
	inicio:
		mov ax,@data
		mov ds,ax
		
		mov bh,17h
		mov ah,06h
		mov al,00h
		mov cx,0000h
		mov dx,184fh
		int 10h
		
		mov ax,0600h
		mov bh,5
		mov cx,0000h
		mov dx,184fh
		int 10h

		xor bh,bh;poniendo a 0 el valor de bh
		
	
	end inicio
	
