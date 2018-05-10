.MODEL small
.DATA

.CODE
	programa:			
			
        ;pedimos el primer número
		mov ah,01H 
		int 21H
		sub al,30H ;ajustes para decimal
		mov bl,al
		;pedimos el segundo número
		mov ah,01H 
		int 21H
		sub al,30H
		add al,bl  ;realizamos la suma de los dos números
		;Ajuste de la suma
		DAA  
		or  ax,3030H ;Ajusta la parte alta y la parte baja del registro ax
		mov bx,ax
		sub bh,01H
		;Impresión de carateres
	
		mov ah,02H
		mov dl,bh ;Imprimimos la parte alta
		int 21H
		
		mov ah,02H
		mov dl,bl ;Imprimimos la parte BAJA
		int 21H
		
		mov  al,9H
		add  al,9H
		daa
     ;Ajuste BCD empaquetado
		
	
		mov ah,4ch
		int 21h
		
    end programa      
.stack	