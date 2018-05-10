.MODEL small
.DATA
	Mensaje DB 13,10,"Ingrese el numero" ,13,10,"$" 
.CODE
	programa:
		Mov AX, @Data ;Obtiene la direccion del segmento de datos 
		Mov Ds, Ax ;Inicializa a DS con esa direccion 
		
		;Despliega la peticion del numero
		Mov Dx, Offset Mensaje 
		mov ah,09h 
		int 21h 
				
        ;este es para capturar el numero 
		mov ah,01h
        int 21h
          
        mov bl,al ;guardando la cantidad en bl
          
		;imprimir un solo caracter  
        ;mov ah,02h
        ;mov dl,0ah
        ;int 21h
          
		;Despliega la peticion del numero
		Mov Dx, Offset Mensaje 
		mov ah,09h 
		int 21h 
		
		;este es para capturar el numero 
        mov ah,01
        int 21h
          
        mov bh,al ; guardando la cantidad en bh
          
        ;imprimir un solo caracter  
		;mov ah,02h
        ;mov dl,0ah
        ;int 21h
          
        ;mov dl,0dhs
        ;int 21h
          
        cmp bl,39h
        
		ja letra; si bl es mayor que que 39h
		sub bl,30h
        
		jmp num2
          
        letra:
			sub bl,37h
          
        num2:
			cmp bh,39h
			ja letra1
          
			sub bh,30h
			jmp suma
          
        letra1:
			sub bh,37h
          
        suma:
         
			ADD bh,bl
			mov bl,bh
          
			mov cl,04h
			shr bh,cl
          
			cmp bh,09h
			ja hex
          
			add bh,30h
			jmp imprimir
          
        hex:
			add bh,37h
          
        imprimir:
			mov ah,02h
			mov dl,bh
			int 21h
          
			and bl,0fh
          
			cmp bl,09h
			ja hex2
          
			add bl,30h
          
			jmp imprimir1
          
        hex2:
			add bl,37h
         
        imprimir1:
          
			mov ah,02h
			mov dl,bl
			int 21h
          
			mov ah,4ch
			int 21h
    end programa      
.stack
    