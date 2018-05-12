;macro proporcionada por los compañeros de la int 16
 READKEY MACRO ;Equivalente de ReadKey en otros lenguajes
 MOV AH,00 ;CAPTURA DESDE TECLADO
 INT 16h ;INTERRUPCION DE 16H ENTRADA/SALIDA DE TECLADO
 ENDM
 imprimir MACRO titulo ;Macro con parametro (titulo)
 MOV DX,OFFSET titulo
 MOV AH,09h
 INT 21h
 ENDM 

.MODEL SMALL
.stack
.DATA
msj1 db 13,10, "Escriba la cadena: ", "$"
msj2 db 13,10, "Presione una tecla para salir: ", "$"
aux     db   ?
contador    db ? 
pa_abajo db ?
.CODE

inicio:
mov ax,@Data
mov ds,ax
mov ah,09h
mov dx, offset msj1
int 21h
mov cx,100 
;Declaracion del vector
vtext db 10 dup('$') 

pedir: ;aca comienzo a pedir letra x letra de la cadena
mov ax,0000
        mov ah,01h
        int 21h
;Guardamos el valor tecleado por el usuario en la posicion si del vector.
        mov vtext[si],al
        inc si   ;Incrementamos nuestro contador
        cmp al,0dh  ;Se repite el ingreso de datos hasta que se teclee un Enter.
        ja pedir ;si no es igual
        jb pedir 

imprimir:
call limpiar 
mov cx,si;asigno a cx el valor final del contador
mov contador,cl
                         
jugar:;COMIENZO A JUGAR AVER SI ME FUNCIONA

READKEY ;espera la letra del teclado
 ;vamos a capturar las presionadas 
CMP AH,60
JE diagonal 

CMP AH,72
;JE pres_arriba

CMP AH,75
;JE pres_izquierda

CMP AH,80
JE abajo;abajo

CMP AH,77
JE derecha;dercha

CMP AL,1BH ;
JE SALIR ;Etiqueta que va a donde se regresa a modo MSDOS, y termina el
JNE jugar ;Otra iteración o ciclo (Leemos otra tecla para mover punto)
;-------------fin de capturar la presionada
derecha:
call vas_derecha

jmp jugar 

abajo:
call vas_abajo
jmp jugar 

diagonal:
call vas_diagonal
jmp jugar

;call cursor_diag
;call escribe; llamada a la funcion de escritura del caracter

;loop sacando;se decrementa cx recordemos q tiene el numero de caracteres de la cadena
;loop sacando
;call salir   
;jmp jugar


limpiar proc near
mov ax, 0600h 
mov bh,7
mov cx, 0000
mov dx, 184fh
int 10h
mov pa_abajo,dh
ret
limpiar endp

cursor_hor proc near; esto es para posicionarlo horizontalmente se juega con dl

mov dl,cl;asigno a dl el valor de cl xq es la cantidad de caracteres q
sub dl,01;se ingreso y luego resto 1 para que haya doble espacio entre
add dl,dl;cada letra para lego sumarle dl y tener ese doble espacio
mov dh,00;este de momento no entra en juego y queda en 0 x defecto
mov ah,2
mov bh,0
int 10h
ret
endp

cursor_ver proc near
mov dl,cl;asigno a dl el valor de cl xq es la cantidad de caracteres q
sub dl,01;se ingreso y luego resto 1 para que haya doble espacio entre
add dl,dl;cada letra para lego sumarle dl y tener ese doble espacio
mov dh,00;este de momento no entra en juego y queda en 0 x defecto

xchg dh,dl; la funcion xcgh hace el cambio entre los valores de dh y dl
        ;anteriormente tenian unos valores en forma horizontal q con esta
        ;funcion han sido cambiados para posicionarlo de forma vertical
mov ah,2
mov bh,0
int 10h
ret
endp

cursor_diag proc near
mov ah,2
mov bh,0
mov dl,cl
sub dl,01;se ingreso y luego resto 1 para que haya doble espacio entre
add dl,dl;cada letra para lego sumarle dl y tener ese doble espacio
mov dh,dl; solamente movemos lo de dl a dh para q tengan el mismo valor
        ;de esta forma se posicionara diagonalmente
int 10h
ret
endp

vas_derecha proc near
for:
call cursor_hor
mov al,vtext[si-1] 
mov ah,14
mov bh,0
mov ah,09h
mov al,al
mov bh,0
mov bl,5h
mov aux,bh
mov dh,cl
mov cx,1
mov cx,cx
int 10h
mov cl,dh
mov dh,aux 
dec si
sub cl,01
cmp si,00  ;Se repite el ingreso de datos hasta que se teclee un Enter.
ja for
mov cl,contador;anteriormente guardo la cantidad de letras que son para otra accion como las dec
mov si,cx; para imprimir las letras que tien el vector
jb for
 
ret
vas_derecha endp
;fin vas para la derecha cadena
vas_abajo proc near
for1:
call cursor_ver
mov al,vtext[0] 
mov ah,14
mov bh,0
mov ah,09h
mov al,al
mov bh,0
mov bl,3h
mov aux,cl
;mov dh,cl
mov cx,1
mov cx,cx
int 10h
mov cl,aux
;mov dh,aux 
dec si
sub cl,01
cmp si,00  ;Se repite el ingreso de datos hasta que se teclee un Enter.
ja for1
mov cl,contador;anteriormente guardo la cantidad de letras que son para otra accion como las dec
mov si,cx; para imprimir las letras que tien el vector
jb for1
 
ret
vas_abajo endp 

vas_diagonal proc near
for2:
call cursor_diag
mov al,vtext[si-1] 
mov ah,14
mov bh,0
mov ah,09h
mov al,al
mov bh,0
mov bl,4h
mov aux,cl
;mov dh,cl
mov cx,1
mov cx,cx
int 10h
mov cl,aux
;mov dh,aux 
dec si
sub cl,01
cmp si,00  ;Se repite el ingreso de datos hasta que se teclee un Enter.
ja for2
mov cl,contador;anteriormente guardo la cantidad de letras que son para otra accion como las dec
mov si,cx; para imprimir las letras que tien el vector
jb for2
 
ret
vas_diagonal endp


salir:
mov dx,si
xchg dh,dl
add dh,dh
mov ah,2
mov bh,0
int 10h
mov ah,09h
mov dx, offset msj2
int 21h
mov ah,01h
int 21h
mov ax,4c00h
int 21h
end inicio