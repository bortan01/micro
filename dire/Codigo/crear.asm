; Programa ejemplo: similar al type, mostrar un archivo en pantalla
;
.model small
.stack 100h
.data
; El Nombre est fijo para el ejemplo

mensaje     DB    13,10,"Digite la ruta y nombre del archivo: $"
Nombre  DB    80 DUP (0)   	; BufferLeerDisco para leer desde el teclado
errormsj     DB    13,10,"ERROR: Presione una tecla para continuar...","$"
salirmsj db 13,10, "Presione una tecla para continuar", "$"
mensaje1 db 13,10, "Archivo no encontrado", "$"
;
Archivo DW ?
Buffer DB ?
.code
Inicio:
public _crear
_crear proc

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

Error: 
mov ah,3ch
mov cx,00
lea dx,Nombre+2
int 21h
JC error
mov archivo,ax


Lectura:
MOV Archivo, AX ; Guardar el manejador o handle en la variable
;
; 2a. parte: ciclo, leer un caracter y mostrarlo en pantalla
;
Ciclo:
MOV AH, 3Fh ; Servicio para leer
LEA DX, Buffer ; Buffer donde quedar la informaci¢n
MOV BX, Archivo ; Handle
MOV CX, 1 ; Voy a leer 1 caracter a la vez
INT 21h
JC Error
CMP AX, 0 ; Caracteres le¡dos
JE FinDeArchivo ; Si son 0, terminar
;
; Imprimir
;
MOV AH, 2 ; Servicio de imprimir un caracter
MOV DL, Buffer
INT 21h
JMP SHORT Ciclo ; Ciclarse. Uso SHORT porque est a menos
; de 127 bytes de distancia
FinDeArchivo:
;
; Cerrar los archivos
;
MOV AH, 3Eh ; Servicio fclose
MOV BX, Archivo ; Handle
INT 21h
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
endp _crear
END inicio