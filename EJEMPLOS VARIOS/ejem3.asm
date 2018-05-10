.MODEL SMALL ; Define el modelo de memoria 
.stack 
.DATA ; Define el segmentos de datos 
Funcion DB 0 ;Variable que almacena la opcion a realizar 
Mensaje DB 13,10,"Ejemplo de menu" 
DB 13,10,13,10,"$" 
Pregunta DB 13,10,"Presione: ",13,10 
DB " 1 opcion uno ",13,10 
DB " 2 opcion dos ",13,10  
DB " 3 opcion tres ",13,10 
DB " 4 opcion cuatro ",13,10 
DB " 5 Salir ",13,10,"$" 
Error DB 7,13,10,"Seleccion invalida (1-5)",13,10,"$" 
opcion1 DB 7,13,10,"selecciono la opcion 1 ","$" 
opcion2 DB 7,13,10,"selecciono la opcion 2 ","$" 
opcion3 DB 13,10,"selecciono la opcion 3 ","$" 
opcion4 DB 13,10,"selecciono la opcion 4 ","$" 
.CODE ;Define el area de codigo 
inicio: 
Mov AX, @Data ;Obtiene la direccion del segmento de datos 
Mov Ds, Ax ;Inicializa a DS con esa direccion 
Mov Dx, Offset Mensaje ;Despliega el titulo del programa 
mov ah,09h 
int 21h 
Mov Dx,Offset Pregunta ;Despliega menu de opciones 
mov ah,09h 
int 21h 
mov ah,01h
int 21h 
Cmp Al, 31h ;Compara la seleccion con el digito 1 ASCII 
Je mopcion1 ;Si la opcion es mayor a 1 brinca a opcion1 
Cmp Al, 32h ;Compara la seleccion con el digito 2 ASCII 
Je mopcion2 ;Si la opcion es mayor a 1 brinca a opcion2 
Cmp Al, 33h ;Compara la seleccion con el digito 3 ASCII 
Je mopcion3 ;Si la opcion es mayor a 1 brinca a opcion3 
Cmp Al, 34h ;Compara la seleccion con el digito 4 ASCII 
Je mopcion4 ;Si la opcion es mayor a 1 brinca a opcion4 
Cmp Al, 35h ;Compara la seleccion con el digito 5 ASCII 
Je salir ;Si la opcion es mayor a 1 brinca a salir 
Mov Dx, Offset Error ;Despliega mensaje de error 
mov ah,09h 
int 21h 
mov ax,4c00h 
int 21h 
mopcion1: 
Mov Dx, Offset opcion1 ;Imprime resultado 
mov ah,09h 
int 21h 
jmp salir 
mopcion2: 
Mov Dx, Offset opcion2 ;Imprime resultado 
mov ah,09h 
int 21h 
jmp salir 
mopcion3: 
Mov Dx, Offset opcion3 ;Imprime resultado 
mov ah,09h  
int 21h 
jmp salir 
mopcion4: 
Mov Dx, Offset opcion4 ;Imprime resultado 
mov ah,09h 
int 21h 
jmp salir 
salir: 
Mov ax,4c00h 
int 21h 
End inicio
