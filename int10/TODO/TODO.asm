.model small  
.stack
.data
.code   
    MENSAJE DB 'FADSFAS',10,13,'$'
inicio:
	mov ax,@data
	mov ds,ax 
	
	;;MOV AH,01H ; Petici�n para designar el tama�o del cursor
 ;   MOV CH,00 ; L�nea inicial de rastreo
  ;  MOV CL,14 ; L�nea final de rastreo
   ; INT 10H ; Llama al BIOS
    
    ;MOV AH,02H ;Petici�n para designar el cursor
    ;MOV BH,00 ;P�gina n�mero 0
    ;MOV DH,05 ;RENGL�N
    ;INT 10H ;Llama al BIOS              
    
    ;MOV AH,06H
    ;MOV AL,05H ; Recorre hacia arriba una l�nea
    ;MOV BH,12H ; Fondo en cyan, con prime plano en juego
    ;MOV CX,000 ; Hasta 24,79 (pantalla completa) 
    ;MOV DX,0E34H
    ;INT 10H ; Llama al BIOS
    
    ;MOV AH,06H; Recorre cinco l�neas
    ;MOV AL,05H
    ;MOV BH,61H ; Fondo caf�, con primer plano azul
    ;MOV CX,0A1CH ; Desde el rengl�n 10, columna 28
    ;MOV DX,0E39H ; hasta el rengl�n 14, columna 52 (parte depantalla)
    ;INT 10H ; Llama al BIOS
    
    ;MOV AH, 09H ; Petici�n de despliegue
    ;MOV AL, '&' ; Car�cter que se despliega
    ;MOV BH, 0 ; P�gina n�mero 0
    ;MOV BL, 13H ; Fondo caf�, primer plano azul
    ;MOV CX, 5 ; 80 caracteres repetidos
    ;INT 10H ; Llama al BIOS 
    
    ;MOV AH, 0AH ; Petici�n de despliegue
    ;MOV AL, '#' ; Car�cter que se despliega
    ;MOV BH, 0 ; N�mero de p�gina
    ;MOV CX, 2 ; N�mero de caracteres repetidos
    ;INT 10H ; Llama al BIOS
                               
                               
                               
    ;MOV AH, 0EH ; Petici�n para desplegar
    ;MOV AL, '@' ; Car�cter que se despliega
    ;MOV BH, 0 ; N�mero de p�gina activa (algunos  sistemas)
   
    ;MOV BL, 03 ; Color del primer plano (modo gr�fico)
    ;INT 10H ; Llama al BIOS

     
    MOV AH, 13H ; Petici�n para desplegar
    MOV AL, 3 ; 0, 1, 2 o 3
    MOV BH, 0 ; N�mero de p�gina
    MOV BL, '@' ; Atributos de la pantalla
    LEA BP, MENSAJE ; Direcci�n de la cadena en ESBP
    MOV CX, 10 ; Longitud de la cadena de caracteres
    MOV DX, 10 ; Posici�n relativa de inicio en la pantalla
    INT 10H ; Llama al BIOS

     

    mov ah,00h ;leer teclado extendido tambien con 10h
    int 16h
    nop  
    	
	
.EXIT	
end inicio
	

