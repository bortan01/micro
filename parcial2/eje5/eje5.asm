gotoxy macro x,y
mov ah,02h
mov bh,00h
mov dh, y
mov dl, x
int 10h
endm



.model small
.stack 100h
.data
ColorFondo      DB      ?
ColorFrente     DB      ?
Atributo        DB      ?  


msg1 db "UNIVERSIDAD DE EL SALVADOR ", "$"
msg2 db "FACULTAD MULTIDISCIPLINARIA PARACENTRAL", "$"
msg3 db "CARNET:	FB09018,	RC09016","$"
msg4 db "NOMBRES:	JHONATAN SAMUEL FLORES BARAHONA", "$"
msg5     db "      OSCAR ROBERTO ROJAS CHIRINO",  "$"
msg6 db "DIGITE TEXTO: ","$" 
cadena db 100 DUP(0) 
.code
Principal       PROC

        MOV     AX, @data
        MOV     DS, AX
         
     
         
        MOV     AX, 0600h
        MOV     BH, 7   ; Atributo "normal" de DOS
        MOV     CX, 0   ; Columna y rengl¢n 0, esquina superior izquierda
        MOV     DX, 184Fh ; Rengl¢n 24, columna 79 = esquina inferior derecha
        INT     10h
    
        
         
    mov ax,00h	; initialize mse function
	int 33h  
          
    mov ax,09h
    int 33h
     gotoxy 1,3
        INT     10h
        ; Luego rutinas
        MOV     AH, 15  ; Blanco
        CALL    TextColor
        MOV     AH, 1   ; Azul
        CALL    TextBackground
        MOV     DX, OFFSET msg1
        CALL    ImprimeCadenaColor
        ; Otra prueba: En la posici¢n (1, 5) poner el mensaje,
        ; en fondo gris claro y letras negras.
        ; Primero gotoxy ( 1, 5)   
          
        
        ;
        MOV     AH, 0  ; Negro
        CALL    TextColor
        MOV     AH, 7  ; Gris claro
        CALL    TextBackground
        ; Apuntar la cadena y llamar la rutina de la pregunta 2
         gotoxy 1,5
         mov dx, offset  msg2
        CALL    ImprimeCadenaColor
        
        
        
        
        MOV     AH, 1  ; Negro
        CALL    TextColor
        MOV     AH, 8  ; Gris claro
        CALL    TextBackground
        ; Apuntar la cadena y llamar la rutina de la pregunta 2
         gotoxy 1,7
         mov dx, offset  msg3
        CALL    ImprimeCadenaColor
       ;
        MOV     AH, 9  ; Negro
        CALL    TextColor
        MOV     AH, 2  ; Gris claro
        CALL    TextBackground
        ; Apuntar la cadena y llamar la rutina de la pregunta 2
         gotoxy 1,9
         mov dx, offset  msg4
        CALL    ImprimeCadenaColor
        
         MOV     AH, 8  ; Negro
        CALL    TextColor
        MOV     AH, 3  ; Gris claro
        CALL    TextBackground
        ; Apuntar la cadena y llamar la rutina de la pregunta 2
         gotoxy 1,11
         mov dx, offset  msg5
        CALL    ImprimeCadenaColor
         
        
         MOV     AH, 1  ; Negro
        CALL    TextColor
        MOV     AH, 5  ; Gris claro
        CALL    TextBackground
        ; Apuntar la cadena y llamar la rutina de la pregunta 2
         gotoxy 1,13
         mov dx, offset  msg6
                   
        CALL    ImprimeCadenaColor 
        
         call leer 
    
    
	
	  call mseptr
	     	  
         
               
        ; Terminar con el programa, regresar a DOS
      salir:  MOV     AX, 4C00h
        INT     21h
Principal       ENDP

ImprimeCadenaColor      PROC
        ; En DX no nos sirve el offset, por ello lo llevo a SI
        MOV     SI, DX
CicloImprime:
        CMP     BYTE PTR [SI], '$'
        JNE     ContinuaImprime
        RET
ContinuaImprime:
        MOV     AH, 9
        MOV     AL, [SI]
        MOV     BH, 0
        MOV     BL, Atributo
        MOV     CX, 1
        INT     10h
        ; Moverse al siguiente caracter en el ciclo
        INC     SI
        ; Mover el cursor
        MOV     AH, 3
        MOV     BH, 0
        INT     10h
        INC     DL
        CMP     DL, 80
        JNE     NoEsFinRenglon
        INC     DH
        MOV     DL, 0
NoEsFinRenglon:
        ; Ajustar el cursor ahora, que ya actualizamos las coordenadas
        MOV     AH, 2
        INT     10h
        ; Ciclarse
        JMP SHORT       CicloImprime
ImprimeCadenaColor      ENDP

TextColor       PROC
        MOV     ColorFrente, AH
        CALL    AjustaAtributo
        RET
TextColor       ENDP

TextBackground  PROC
        MOV     ColorFondo, AH
        CALL    AjustaAtributo
        RET
TextBackground  ENDP

AjustaAtributo  PROC
        MOV     BH, ColorFondo
        SHL     BH, 1
        SHL     BH, 1
        SHL     BH, 1
        SHL     BH, 1
        OR      BH, ColorFrente
        MOV     Atributo, BH
        RET
AjustaAtributo  ENDP 


leer proc near
 
    mov ah,0ah
    mov dx, offset cadena
    mov cadena[0],100 
    int 21h
    
  endp
   

mostrar proc near 
    call cambiarc
    
    mov bx,0   
    mov al,cadena[bx+2] 
    mov ah,02
	mov bh,00         
	               
    CALL imprimir
    inc bx
    cmp bl,cadena[1]
    je salir
endp 

    
cambiarc proc near 
        shl ah,4
        CALL    TextColor
        shl ah,4
        CALL    TextBackground
        ; Apuntar la cadena y llamar la rutina de la pregunta 2
cambiarc endp
imprimir proc near
	mov ah,0eh
	int 10h
	ret
endp    


;	GET MOUSE POINTER LOCATION
;	--------------------------
mseptr	proc near
	mov ax,03h	; get mse ptr location function
	int 33h
	cmp bx,01	; right button pressed?
	je exit	; yes, means return
	cmp bx,2
	je mostrar
    ret
mseptr	endp

   exit proc near 
    
    MOV     AX, 4C00h
    int 21h
    endp
    

        END   principal

