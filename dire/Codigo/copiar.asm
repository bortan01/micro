;
.model small
.stack 100h
.data
; El Nombre est fijo para el ejemplo
mensaje     DB    13,10,"Digite la ruta y nombre1 del archivo: $"
Nombre  DB    80 DUP (0)   	; BufferLeerDisco para leer desde el teclado

mensaje2     DB    13,10,"Digite la ruta y nombre2 del archivo: $"
errormsj     DB    13,10,"ERROR: Presione una tecla para continuar...","$"
Nombre2  DB    80 DUP (0)   	; BufferLeerDisco para leer desde el teclado
salirmsj db 13,10, "Presione una tecla para continuar", "$"
;
; Ahora necesitamos 2 handles
;
Archivo DW      ?
Archivo2 DW      ?
Buffer  DB      ?
.code
inicio:
public _copiar
_copiar proc
        MOV     AX, @data
        MOV     DS, AX


   call limpiar     
    call cursor
   lea   DX,mensaje		;Lo que hacemos con estas instrucciones
    mov  AH,09                  			;es pasar a la pantalla, el contenido
    int  21h 
    
 lea   DX,Nombre      		; Puntero a la dirección para la entrada
    mov   BYTE PTR [Nombre],60  		; Fijamos los 60 caracteres
    mov   AH,10  					; función de entrada de teclado
    int   21h 

 call limpiar     
  call cursor

  mov bl,[Nombre+1]    		; Esta es la longitud efectiva tecleada
    mov   bh,0              
    add   bx,OFFSET Nombre		; apuntamos  al final
    mov  BYTE PTR [BX+2],0 		; ponemos el cero al final
;-----------------------------------------

   call limpiar     
    call cursor
   lea   DX,mensaje2		;Lo que hacemos con estas instrucciones
    mov  AH,09                  			;es pasar a la pantalla, el contenido
    int  21h 
 lea   DX,Nombre2      		; Puntero a la dirección para la entrada
    mov   BYTE PTR [Nombre2],60  		; Fijamos los 60 caracteres
    mov   AH,10  					; función de entrada de teclado
    int   21h 

 call limpiar     
    call cursor

  mov bl,[Nombre2+1]    		; Esta es la longitud efectiva tecleada
    mov   bh,0              
    add   bx,OFFSET Nombre2		; apuntamos  al final
    mov  BYTE PTR [BX+2],0 		; ponemos el cero al final
;-----------------------------------------------------------------
        ;
        ; 1a. parte, insertada: Crear el archivo
        ;
        MOV     AH, 3Ch         ; Servicio fopen para crear
        LEA     DX, Nombre2+2     ; Apuntar a la cadena con el nombre destino
        MOV     CX, 0           ; Atributo normal (no de solo-lectura ni
                                ; similares)
        INT     21h             ; En este momento se crea
        JC      Error           ; L¢gica negada. En caso de error, terminar;
                                ; de lo contrario, abrir el otro archivo
        MOV     Archivo2, AX    ; Guardar el handle de destino
        ;
        ; 2a. parte: Abrir el archivo
        ;
        MOV     AH, 3Dh         ; Servicio fopen
        LEA     DX, Nombre+2      ; Apuntar a la cadena con el nombre
        MOV     AL, 0           ; Abrir para lectura
        INT     21h             ; En este momento se abre
        JNC     Lectura
        Error:  
        mov  AH,09  
		lea dx, errormsj ; carga a dx lo qe hay en msg
		int 21h ; imprime la cadena
		mov ah,07h
		int 21h
		ret  
        Lectura:
        MOV     Archivo, AX     ; Guardar el manejador o handle en la variable
        ;   
        ; 3a. parte: ciclo, leer un caracter y en vez de mostrarlo en
        ; pantalla, guardarlo en el segundo archivo
        ;Ciclo:
        MOV     AH, 3Fh         ; Servicio para leer
        LEA     DX, Buffer      ; Buffer donde quedar la informaci¢n
        MOV     BX, Archivo     ; Handle
        MOV     CX, 1           ; Voy a leer 1 caracter a la vez
        INT     21h
        JC      Error
        CMP     AX, 0           ; Caracteres le¡dos
        JE      FinDeArchivo    ; Si son 0, terminar
        ;
        ; Escribir
        ;
        MOV     AH, 40h         ; Servicio para escribir
        LEA     DX, Buffer      ; Buffer de donde se toma la informaci¢n
        MOV     BX, Archivo2    ; Handle
        MOV     CX, 1           ; Voy a escribir 1 caracter a la vez
        INT     21h
        JC      Error
       ; JMP SHORT Ciclo         ; Ciclarse. Uso SHORT porque est a menos
                                ; de 127 bytes de distancia
        FinDeArchivo:
        ;
       ; Cerrar los archivos
        ;
        MOV     AH, 3Eh         ; Servicio fclose
        MOV     BX, Archivo     ; Handle
        INT     21h
        MOV     BX, Archivo2    ; Handle
        INT     21h
        ; MOV     AX, 4C00h       ; Terminar el programa con c¢digo 0
        ; INT     21h
	
 mov  AH,09  
lea dx, salirmsj ; carga a dx lo qe hay en msg
int 21h ; imprime la cadena
mov ah,07h
int 21h
ret  

limpiar proc near
    mov ax, 0600h ;
    mov bh,7 ; ; color (7 para b/n)
    mov cx, 0000 ; desde 0,0
    mov dx, 184fh ; hasta 24,79
    int 10h
    ret
limpiar endp       

cursor proc near
    mov ah,02h
    mov bh,0h
    mov dh,1; dh para la fila
    mov dl,1; dl es para la columna
    int 10h
    ret

endp
endp _copiar
END inicio