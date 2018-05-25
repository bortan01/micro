.model small  
.stack
.data
.code   
    MENSAJE DB 'FADSFAS',10,13,'$'
inicio:
	mov ax,@data
	mov ds,ax 
	
	;;MOV AH,01H ; Petición para designar el tamaño del cursor
 ;   MOV CH,00 ; Línea inicial de rastreo
  ;  MOV CL,14 ; Línea final de rastreo
   ; INT 10H ; Llama al BIOS
    
    ;MOV AH,02H ;Petición para designar el cursor
    ;MOV BH,00 ;Página número 0
    ;MOV DH,05 ;RENGLÓN
    ;INT 10H ;Llama al BIOS              
    
    ;MOV AH,06H
    ;MOV AL,05H ; Recorre hacia arriba una línea
    ;MOV BH,12H ; Fondo en cyan, con prime plano en juego
    ;MOV CX,000 ; Hasta 24,79 (pantalla completa) 
    ;MOV DX,0E34H
    ;INT 10H ; Llama al BIOS
    
    ;MOV AH,06H; Recorre cinco líneas
    ;MOV AL,05H
    ;MOV BH,61H ; Fondo café, con primer plano azul
    ;MOV CX,0A1CH ; Desde el renglón 10, columna 28
    ;MOV DX,0E39H ; hasta el renglón 14, columna 52 (parte depantalla)
    ;INT 10H ; Llama al BIOS
    
    ;MOV AH, 09H ; Petición de despliegue
    ;MOV AL, '&' ; Carácter que se despliega
    ;MOV BH, 0 ; Página número 0
    ;MOV BL, 13H ; Fondo café, primer plano azul
    ;MOV CX, 5 ; 80 caracteres repetidos
    ;INT 10H ; Llama al BIOS 
    
    ;MOV AH, 0AH ; Petición de despliegue
    ;MOV AL, '#' ; Carácter que se despliega
    ;MOV BH, 0 ; Número de página
    ;MOV CX, 2 ; Número de caracteres repetidos
    ;INT 10H ; Llama al BIOS
                               
                               
                               
    ;MOV AH, 0EH ; Petición para desplegar
    ;MOV AL, '@' ; Carácter que se despliega
    ;MOV BH, 0 ; Número de página activa (algunos  sistemas)
   
    ;MOV BL, 03 ; Color del primer plano (modo gráfico)
    ;INT 10H ; Llama al BIOS

     
    MOV AH, 13H ; Petición para desplegar
    MOV AL, 3 ; 0, 1, 2 o 3
    MOV BH, 0 ; Número de página
    MOV BL, '@' ; Atributos de la pantalla
    LEA BP, MENSAJE ; Dirección de la cadena en ESBP
    MOV CX, 10 ; Longitud de la cadena de caracteres
    MOV DX, 10 ; Posición relativa de inicio en la pantalla
    INT 10H ; Llama al BIOS

     

    mov ah,00h ;leer teclado extendido tambien con 10h
    int 16h
    nop  
    	
	
.EXIT	
end inicio
	

