PRINTF MACRO texto
	mov ah,09h
	mov dx, offset texto
	int 21h
ENDM 



; para editar archivo
.model small
.stack 100h
.data
	
	Raiz db 'SU RUTA ACTUAL ES  C:\',0
	No_quitar db 1000 dup('$') ; cantidad de espacio reservada 
	Buff dB 8 DUP (' ')
    cls_buffer DB '                            ',13, '$'
	Fin DB '',13,10, '$'
	
.code
inicio:
	mov     AX, @data
	mov     DS, AX

	mov ah,09h
	mov dx, offset Raiz ; para mostrar c:/
	int 21h
	
	mov ah, 47H
	mov dL, 0
	mov SI ,offset Buff ; obteniendo la ruta
	int 21h
	
	mov ah,09h
	mov dx, offset Buff  ; imprimiendo ruta
	int 21h
		
	mov ah,09h
	mov dx, offset Fin ; terminando la cadena
	int 21h
	

	mov cx,20
	mov si,20
	
	limpieza:
		mov Buff[si-1],' '
		dec si
		loop limpieza
	
	Mov ax,4c00h
	int 21h      
END inicio 


