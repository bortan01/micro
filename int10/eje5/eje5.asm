.MODEL small
.STACK 256H
.DATA
	Excode DB 0H
.CODE
	inicio:
		mov ax, @data
		mov ds,ax
		
		mov ah, 00H ;modo 640*200
		mov al, 04H
		int 10h
		
		mov al, 01H
		mov dx, 00H
		mov cx, 00H
		repite: mov ah, 12H
		int 10h
		
		inc dx
		inc cx
		cmp dx, 0C8h
		je salir
		jmp repite
		mov ah,01h
		int 21h
			salir:
			mov ah, 04Ch
			mov al, [excode]
			int 21h
	END inicio