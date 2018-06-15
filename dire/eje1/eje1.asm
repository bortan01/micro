; para crear directorio
.model small
.stack 100h
.data
	; El Nombre est  fijo para el ejemplo
	ruta db 'c:\dire\eje1\prueba',0
.code
inicio:
	mov     AX, @data
	mov     DS, AX
	; 1a. parte: Abrir el archivo
	mov ah, 39h
	mov dx,offset ruta   
	int 21h
	mov ax,4c00h
	int 21h      
END inicio
