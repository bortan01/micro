
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
	
	mov ah,09h
	mov dx, offset Aclaracion ; UN MENSAJIO
	int 21h
	
	mov ah,09h
	mov dx, offset Raiz ; terminando la cadena
	int 21h
	
	mov ah, 47H
	mov dL, 0
	LEA SI,Buff
	int 21h
	
	mov ah,09h
	mov dx, offset Buff  ; imprimiendo ruta
	int 21h
	
	mov si,00
	mov Buff,00
	
	mov ah,09h
	mov dx, offset Fin ; terminando la cadena
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
	
	Aclaracion db 'SU RUTA ACTUAL ES:',13,10,'$'
	Ruta db 'OTRO',0; El Nombre est  fijo para el ejemplo
	Imp db 100 dup('$')
	Raiz db 'C:\',0
	Vec db 1000 dup('$') ; cantidad de espacio reservada 
	Longitud dw 5000 ; cantidad de letras a mostrar
	Buff dB 8 DUP (' ')
    cls_buffer DB '                            ',13,10, '$'
	Fin DB '',13,10, '$'
	
	
.code
inicio:
	mov     AX, @data
	mov     DS, AX

	OBTENER_DIRECTORIO
		
	
	Mov ax,4c00h
	int 21h      
END inicio 


