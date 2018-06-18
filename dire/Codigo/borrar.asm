; Programa ejemplo:Borrar archivo
;
.model small
.stack 100h
.data
; El Nombre est fijo para el ejemplo

mensaje     DB    13,10,"Introduce la ruta y nombre del archivo: $"
mensaje2     DB    13,10,"El archivo ha sido borrado exitosamente :) $"
Nombre  DB    80 DUP (0)   	; BufferLeerDisco para leer desde el teclado
mensaje1 db 13,10, "El archivo no se encuentra lo siento :(", "$"
salirmsj db 13,10, "Presione una tecla para continuar", "$"
;
Archivo DW ?
Buffer DB ?
.code
Inicio:
public _borrar
_borrar proc
MOV AX, @data
MOV DS, AX

 call limpiar     
    call cursor
   lea   DX,mensaje		;Lo que hacemos con estas instrucciones
    mov  AH,09                  			;es pasar a la pantalla, el contenido
    int  21h                   			;de la memoria, apuntado por EntradaDelFichero
    
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


; 1a. parte: Abrir el archivo
;
MOV AH, 3Dh ; Servicio fopen
LEA DX, Nombre+2 ; Apuntar a la cadena con el nombre
MOV AL, 0 ; Abrir para lectura
INT 21h ; En este momento se abre
JC Error 
JNC Lectura
Error: 
mov ah,09h ;funcion para imprimir una cadena
lea dx, mensaje1 ; carga a dx lo qe hay en msg1
int 21h ; imprime la cadena
;//////////////////////////////////////
lea dx, salirmsj ; carga a dx lo qe hay en msg
int 21h ; imprime la cadena
mov ah,07h
int 21h
ret   

Lectura:

   
  mov AH,41h ;Peticion para borrar
  Lea DX,Nombre+2 ;Apuntar a la direccion
  int 21h
lea   DX,mensaje2 		;Lo que hacemos con estas instrucciones
    mov  AH,09                  			;es pasar a la pantalla, el contenido de la pantalla
    int  21h 

;MOV AX, 4C01h 
;INT 21h 

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
endp _borrar
END inicio