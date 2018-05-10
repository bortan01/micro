.MODEL small
.DATA
	
.CODE
	programa:			
	;============uso de add==================================
			
        ;este es para capturar el numero 
		mov ah,01h
        int 21h
          
        mov bl,al ;guardando la cantidad en bl
          
		;este es para capturar el numero 
        mov ah,01
        int 21h
          
        mov bh,al ; guardando la cantidad en bh
		
		;sumando las dos cantidades guardadas
		add bh,bl
        
		;imprimiendo respuesta
		mov ah,02h
		mov dl,bh
		int 21h
		
		
		;=====================uso de adc=====================================
		;inicializando ax en FFFF = 65535D
		MOV AX,65535D
		MOV BX,0001H
		
		;forzando el acarreo
		ADD AX,BX
		
		;sumando con el acarreo
		ADC AX,BX		
		
          
		mov ah,4ch
		int 21h
		
    end programa      
.stack
    