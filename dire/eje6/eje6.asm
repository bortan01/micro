CREAR_DIRECTORIO MACRO ruta
	mov ah, 39h
	mov dx,offset ruta   
	int 21h
ENDM

ABRIR_DIRECTORIO MACRO ruta
	mov ah, 3Ah
	mov dx,offset ruta   
	int 21h
ENDM

CREAR_FICHERO MACRO nombre
	mov ah, 3ch
	mov al,00
	mov cx,00
	mov dx,offset nombre
	int 21h
	mov bx,ax
	
	;cerrando fichero
	mov ah, 3eh
    int 21h
ENDM

CERRAR_FICHERO MACRO nombre
	mov ah,3eh
	int 21h
ENDM

MOSTRAR_FICHERO MACRO nombre
	;abrir fichero
	mov ah,3dh
	mov al,00h
	mov dx, offset nombre
	int 21h

	mov bx,ax

	;leer archivo
	mov ah,3fh
	mov cx,longitud
	mov dx,offset vec
	int 21h
	mov ah,09h
	int 21h

	mov ah, 3eh
	int 21h
	
	MOV SI,23
ENDM

SCANF MACRO destino
	capturar:
		mov ah,01h
		int 21h
		mov destino[si],al
		inc si
		cmp al,0dh
		ja capturar
		jb capturar
ENDM

MODIFICAR_FICHERO MACRO datos,nombre
	mov ah,3dh
    mov al,1h
    mov dx,offset nombre
    int 21h    
    
    mov bx,ax
    mov cx,si
    mov dx,offset datos
   
    mov ah,40h
    int 21h
               
    mov ah, 3eh
    int 21h 
ENDM


; para editar archivo
.model small
.stack 100h
.data
	
	Ruta db 'C:\dire\eje6\prueba',0; El Nombre est  fijo para el ejemplo
	Nombre db 'C:\dire\eje6\prueba.txt',0
	Imp db 100 dup('$')
	Vec db 1000 dup('$') ; cantidad de espacio reservada 
	Longitud dw 5000 ; cantidad de letras a mostrar
.code
inicio:
	mov     AX, @data
	mov     DS, AX

MOSTRAR_FICHERO Nombre
SCANF Vec
MODIFICAR_FICHERO Vec,Nombre

	
	Mov ax,4c00h
	int 21h      
END inicio 


