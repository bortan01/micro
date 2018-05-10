.model small 
.stack 
.data 
	var1 db ? 
	var2 db ? 
	msg1 db 'El Primero Es Mayor ',13,10,"$" 
	msg2 db 'El Primero Es Menor ' ,13,10,"$" 
	msg3 db 'Son Iguales ',13,10,"$"  
	Msj  db "ingrese el primer valor",13,10,"$" 
	Msjo db "ingrese el segundo valor",13,10,"$"
	salto  db "",13,10,"$" 	

.code 
	inicio: 
		MOV AX,@DATA 
		mov ds,ax 
		
		;Despliega el mensaje pidiendo el primer valor 
		Mov Dx, Offset Msj 
		mov ah,09h 
		int 21h 
		
		;nos preparamos para capturar el valor
		mov ah,01h;  el 07h funciona similar a la 01h pero sin eco(no se muestra en pantalla) el valor es guardado en al
		int 21h 
		;mov ah,02h; hasta aqui se muestra en pantalla 
		;mov dl,al ;se imprime el valor que tiene dl
		;int 21h 
		
		Mov Dx, Offset salto 
		mov ah,09h 
		int 21h 
		
		
		;guardamos el valor
		mov var1,al 
				
		;Despliega el mensaje pidiendo el segundo valor 
		Mov Dx, Offset Msjo 
		mov ah,09h 
		int 21h 
		
		;nos preparamos para recivir el segundo valor
		mov ah,01h 
		int 21h 
		;mov ah,02h 
		;mov dl,al 
		;int 21h 
		
		Mov Dx, Offset salto 
		mov ah,09h 
		int 21h 
		
		mov var2,al 
		
		cmp var1,al 
		ja mayor 
		jb menor 
		je igual 
	mayor: 
		mov ah,09h 
		lea dx,msg1 
		int 21h  
		jmp salir 
	menor: 
		mov ah,09h 
		lea dx,msg2; funciona igual que mov dx, offset msg2 (omite la palabra offset) 
		int 21h 
		jmp salir 
	igual: 
		mov ah,09h 
		lea dx,msg3 
		int 21h 
		jmp salir 
	salir: 
		mov ax,4c00h 
		int 21h 
end inicio
