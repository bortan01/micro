limpiar macro;limpiar pantlla
	;mov bh,'@' ; atributo a utilizar en lineas borradas
	;mov ah,06h ;desplazar lineas de texto hacia arriba
	;mov al,00h ;  Número de líneas a desplazar. Si AL=0, se borra toda la ventana seleccionada mediante los registros CX y DX
	;mov cx,0000h
	;mov dx,184fh
	;int 10h
endm
mostrar macro

	mov dl,d1
	mov dh,d2
	mov ah,02h;mover el cursor a una pocicion de coordenadas
	int 10h 

	mov bl,dl
	mov dl,2ah
	mov ah,02h
	int 21h 
endm
marriva macro ;para subir

	sub dh,01
	mov dl,bl
	mov ah,02h;mover el cursor a una pocicion de coordenadas
	int 10h 
	
	mov bl,dl
	mov dl,2ah
	mov ah,02h
	int 21h
	
	mov dl,bl 
endm

mabajo macro ;para bajar

	add dh,01
	mov dl,bl
	mov ah,02h;mover el cursor a una pocicion de coordenadas
	int 10h 

	mov bl,dl
	mov dl,2ah
	mov ah,02h
	int 21h

	mov dl,bl 
endm

mder macro ;para derecha
	
	mov dl,bl
	add dl,02
	mov ah,02h;mover el cursor a una pocicion de coordenadas
	int 10h 

	mov bl,dl
	mov dl,2ah
	mov ah,02h
	int 21h 

	mov dl,bl
endm

mizq macro ;para izquierda
	
	mov dl,bl
	sub dl,02
	mov ah,02h;mover el cursor a una pocicion de coordenadas
	int 10h 

	mov bl,dl
	mov dl,2ah
	mov ah,02h
	int 21h 
	mov dl,bl
endm

colores macro 

;xcambia el color de ijmprecion
	
	push ax
	push bx
	push cx
	push dx
		
	mov bh,5
	mov ah,06h
	add bh,colo
	mov cx,0000h
	mov dx,184fh
	int 10h
	;add colo,1
	

	pop dx
	pop cx
	pop bx
	pop ax
	
endm

.model small
.stack
.data
	d1 db 9
	d2 db 20
	colo db 1
.code
inicio:
	mov ax,@data
	mov ds,ax

;limpiar

mostrar
colores
imprimir:
	
	mov ah,10h
	int 16h
	colores
	cmp ah,48h
		je arriva
	cmp ah,4dh
		je der
	cmp ah,50h
		je aba
	cmp ah,4bh
		je izq
	cmp ah,01h
		je salir
	
arriva:
	marriva
	jmp imprimir
der:
	mder
	jmp imprimir
aba:
	mabajo
	jmp imprimir
izq:
	mizq
	jmp imprimir
salir:
	mov ax,4c00h
	int 21h                        
end inicio



