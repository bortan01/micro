limpiar macro;limpiar pantlla
	mov bh,17h
	mov ah,06h
	mov al,00h
	mov cx,0000h
	mov dx,184fh
	int 10h
endm
mostrar macro
	xor bh,bh ; poner a 0 un valor inicializando
	mov dl,DIR1 ; coordenada en x
	mov dh,DIR2 ; coordenada en y
	mov ah,02h;mover el cursor a una pocicion de coordenadas
	int 10h 

	mov bl,dl
	mov dl,'*' ; signo a imprimr
	mov ah,02h ;funcion para imprimir
	int 21h 
endm
marriva macro ;para subir
	;xor bh,bh ; poner a 0 un valor
	sub dh,01 ;coordenada en y
	mov ah,02h;mover el cursor a una pocicion de coordenadas
	int 10h 
	
	mov bl,dl ; tecla precionada
	mov dl,'@' ;simbolo a imprimir 
	mov ah,02h ;funcion para imprimir
	int 21h
	mov dl,bl 
endm

mabajo macro ;para bajar
	;xor bh,bh ; poner a 0 un valor
	add dh,01
	mov dl,bl
	mov ah,02h;mover el cursor a una pocicion de coordenadas
	int 10h 
	
	mov bl,dl
	mov dl,'#'
	mov ah,02h
	int 21h
	mov dl,bl 
endm

mder macro ;para derecha
	;xor bh,bh ; poner a 0 un valor
	mov dl,bl
	add dl,02
	mov ah,02h;mover el cursor a una pocicion de coordenadas
	int 10h
	
	mov bl,dl
	mov dl,'$'
	mov ah,02h
	int 21h 
	mov dl,bl
endm

mizq macro ;para izquierda
	;xor bh,bh ; poner a 0 un valor
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

PUSH AX
PUSH BX
PUSH CX
PUSH DX

mov ax,0600h
mov bh,COLO ;color de simbolo
mov cx,0000h
mov dx,184fh
int 10h
ADD COLO,1



POP DX
POP CX
POP BX
POP AX

endm

.model small
.stack
.data
	DIR1 db 1
	DIR2 db 1
	COLO DB 1
.code
inicio:
	mov ax,@data
	mov ds,ax



mostrar ;solo para definir posicion inicial
colores ; para definir el color de las cosas
imprimir:
	
	
	mov ah,10h
	int 16h
	
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
CAMBIO:
MOV COLO,1	
end inicio
