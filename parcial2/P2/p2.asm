MOSTRAR_MOUSE MACRO 
    Mov ax,01
    int 33h 
ENDM

PRINTF MACRO texto
	mov ah,09h
	mov dx, offset texto
	int 21h
ENDM  
leer macro
	mov ah,00h ;leer teclado extendido
	int 16h
ENDM

GOTOXY MACRO caracter,colo
    
	PUSH CX
	mov bh,0
	mov ah,02h;
	mov dl,CoordenadaX
	mov dh,CoordenadaY
	int 10h 

	mov ah,0Ch	; Dibujar pixel
	mov al,colo	; Color Verde
	int 10h


	
	;mov cx,1
	;mov ah,9h 
	;mov al,caracter
	;mov bh,0h	
	;mov bl,colo
	;int 10h
	POP CX


ENDM

CLS MACRO

		MOV AH, 06H ; DESPLAZAR LINEAS DE TEXTO HACIA ARRIBA
		MOV AL,00; NUMERO DE LINEAS A DESPLAZAR
		MOV BH, 00 ; FONDO BLANCO CON PRIMER PLANO AZUL
		MOv CX, 0000
		MOV DX, 184FH 
		INT 10h
ENDM

BACKGRAUND MACRO fondo, inicio,fin,finX

	MOV AH, 06H ; DESPLAZAR LINEAS DE TEXTO HACIA ARRIBA
	MOV AL,0; NUMERO DE LINEAS A DESPLAZAR
	MOV BH, fondo ; FONDO BLANCO CON PRIMER PLANO AZUL
		
	MOv CH, inicio;LINEA DONDE COMIENZA LA VENTANA DE TEXTO
	MOV DH, fin ;LINEA DONDE ACABA VENTANADE TEXTO;
		
	MOV CL, 00 ; COLUMNA DONDE EMPIEZA VENTANA DE TEXTO
	MOV DL, finX ;COLUMNA DONDE ACABA VENTANA DE TEXTO
	INT 10h
		
	

ENDM


.model small
.stack
.data

	CoordenadaX db 14h
	CoordenadaY db 0ch
	Rozado db  29
	Fondo_Azul db 16
	Universidad db 13,10, "Universidad Nacional de El Salvador",13,10, "$"
	Facultad db "Facultad Multidisciplinaria Paracentral", 13,10, '$'
	Nombre db "Boris Ricardo Miranda Ayala", 13,10, '$'
	Carnet db "MA14049", 13,10, '$'
	Rojo db 12 ;4   12   13
	Azul db 09
	Verde db 10
	Amarillo db 14
	
	

.code
inicio:
	mov ax,@data
	mov ds,ax     
	
	push ax
	push bx
	push cx
	
            
   CLS 
   BACKGRAUND 61,1,1,35
   PRINTF Universidad
   BACKGRAUND 73,2,2,37
   PRINTF Facultad
   BACKGRAUND 89,3,3,27
   PRINTF Nombre
   BACKGRAUND 97,4,4,7
   PRINTF Carnet
                 
   MOSTRAR_MOUSE
   
   
   escucha:
   Mov ax,0003h
   int 33h
   cmp bx,1h  ;click izquierdo
   je cuerpo  
   cmp bx,2h  ;click izquierdo
   je linea 
   jmp escucha
  

   
    
	pedir_tecla:
		leer  
		
      	cmp ah,60
			je pierna
		cmp ah,61
		    je diagonal
	         	 
		cmp ah,01h
			je salir
			ja pedir_tecla
	
	salir: 
	    pop dx
	    pop cx
	    pop bx
	    pop ax
		.exit
	cuerpo:
	    mov cx,11
		mov CoordenadaX,14h
		mov CoordenadaY,0Ah
		jmp dibujar_cuerpo
    pierna:
	    mov cx,6
		mov CoordenadaX,14h
		mov CoordenadaY,14h
		jmp dibujar_pierna
		
	diagonal:
	   mov cx,6
		mov CoordenadaX,35
		mov CoordenadaY,8
		jmp dibujar_diagonal
		      
    linea:
        MOV CX,10
        mov CoordenadaY,13
        mov CoordenadaX,15h
	    jmp dibujar_linea1
	
	dibujar_cuerpo:
	    GOTOXY '*',Azul
		add CoordenadaY,01
		loop dibujar_cuerpo
		jmp escucha
	dibujar_pierna:
	    GOTOXY '*',Rozado
		add CoordenadaX,01
		add CoordenadaY,01
		loop dibujar_pierna
		
		mov cx,6
		mov CoordenadaX,14h
		mov CoordenadaY,14h
		jmp dibujar_pierna2
	dibujar_pierna2:
		GOTOXY '*',Rozado
		sub CoordenadaX,01
		add CoordenadaY,01
		loop dibujar_pierna2
		jmp pedir_tecla
	dibujar_linea1:
	    GOTOXY '*',Verde
		add CoordenadaX,01
		loop dibujar_linea1  
		MOV CX,10
        mov CoordenadaY,10
        mov CoordenadaX,14h
	    jmp dibujar_linea2
	
	dibujar_linea2:  
	    GOTOXY '*',Amarillo
		sub CoordenadaX,01
		loop dibujar_linea2
		jmp pedir_tecla 
	dibujar_diagonal:
		GOTOXY '*',Rojo
		sub CoordenadaX,01
		add CoordenadaY,01
		loop dibujar_diagonal
		jmp pedir_tecla
	                    
	  
	 	
end inicio

