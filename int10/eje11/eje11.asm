.MODEL small 
.STACK 256 
.DATA
.CODE 
inicio: 
	mov ax, @data 
	mov ds,ax 
	mov ah, 00 ;modo 640*200 
	mov al, 04 ; 4 5 y 6 modifica el grosor
	int 10h ;posicionamoso en modo grafico
	
	mov al, 01 
	mov dx, 00 
	mov cx, 00 
	repite: mov ah, 12 ;activando modo grafico
	int 10h 

	inc dx 
	inc cx 
	cmp dx, 0C8h ;compara si ya llego al limite
	je salir ;si es igual salta a salir
	
	jmp repite 
		mov ah,01h 
		int 21h 
	salir: 
		mov ah, 04Ch 
		int 21h 
END inicio
