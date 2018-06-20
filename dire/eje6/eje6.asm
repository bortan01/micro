
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

BORRAR_DIRECTORIO MACRO ruta
	mov ah, 3AH
	mov dx,offset ruta   
	int 21h
ENDM

OBTENER_DIRECTORIO MACRO
	mov ah, 47H
	mov dL, 0
	LEA SI,Posicion
	int 21h
	
	mov ah,09h
	mov dx, offset Posicion
	int 21h
	
ENDM

ESTABLECER_DIRECTORIO MACRO ruta
	mov ah, 3BH
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

OCULTAR_FICHERO MACRO nombre
	
	mov AH , 43H
    mov AL , 01h
    mov CX , 02h   
    mov dx, offset nombre
    int 21h
	
	;cerrando fichero
	mov ah, 3eh
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

PRINTF MACRO texto
	mov ah,09h
	mov dx, offset texto
	int 21h
ENDM 

; para editar archivo
.model small
.stack 100h
.data
	
	Ruta db 'OTRO',0; El Nombre est  fijo para el ejemplo
	Nombre db 'prueba.txt',0
	Imp db 100 dup('$')
	Vec db 1000 dup('$') ; cantidad de espacio reservada 
	Longitud dw 5000 ; cantidad de letras a mostrar
	Posicion dB 8 DUP (' ')
	Raiz DB 'C:'
.code
inicio:
	mov     AX, @data
	mov     DS, AX

	OBTENER_DIRECTORIO

	
	Mov ax,4c00h
	int 21h      
END inicio 


