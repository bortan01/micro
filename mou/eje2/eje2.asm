.model small
.stack 100h
.data
; Variables para las coordenadas del Marco
X1      DB      ?
Y1      DB      ?
X2      DB      ?
Y2      DB      ?
.code
; Parametros: CL = X1, CH = Y1, DL = X2, DH = Y2 (coordenadas de las esquinas)
;             BH = Numero de pagina, BL = Color.  
Marco   PROC
        MOV     AH, 5   ; Servicio de ajustar pagina activa
        MOV     AL, BH  ; Pagina deseada
        INT     10h     ; Llamado a BIOS, se ajusta la pagina
        ; Ahora, limpiar la ventana que queremos trabajar, esto  se haria:
        ;MOV     AH, 6   ; Servicio de scroll/limpiar
        ;MOV     AL, 0   ; Lineas a desplazar 0 = Limpiar
        ; Pero es mas eficiente:
        MOV     AX, 0600h       ; Une las dos instrucciones anteriores
        ; Ajustar el color, sin perder el numero de pagina
        XCHG    BH, BL  ; Queda en BH el color, en BL numero de pagina
        INT     10h     ; Limpia la ventana con las coordenadas indicadas.
        ; Empezaremos a trazar lineas, ya vimos que necesitaremos guardar
        ; las variables
        MOV     X1, CL
        MOV     X2, DL
        MOV     Y1, CH
        MOV     Y2, DH
        ; Esquina inferior derecha, donde se posiciona el cursor
        MOV     AH, 2   ; Servicio Gotoxy
        ; Ya tengo las coordenadas DL, DH = X2, Y2
        ; Tomo la pagina
        XCHG    BH, BL  ; Queda en BH la pagina y en BL el atributo de color
        INT     10h     ; queda el cursor posicionado, Ya estoy ahi, ahora pinto la esquina
        MOV     AH, 9   ; Servicio para poner caracter y atributo
        ; Ya tengo en BH la pagina, y en BL el color
        MOV     AL, 217 ; Caracter 217, esquina inferior derecha '+' 
        MOV     CX, 1   ; Colocar un caracter en pantalla
        INT     10h
        ; Ciclo para pintar la linea de la derecha
CicloDerecha:
        ; posicionar el cursor
        MOV     AH, 2   ; Servicio Gotoxy
        DEC     DH      ; Primero, me dirijo al caracter que esta un renglon arriba
        CMP     DH, Y1  ; Si llego al renglon Y1, hay que pintar la esquina
        JE      EsqSupDer       
        INT     10h     ; queda el cursor posicionado, y se dibuja la l¡nea
        MOV     AH, 9   ; Servicio para poner caracter y atributo
        MOV     AL, 179 ; Caracter 179, linea vertical '¦'
        ; BH, BL y CX conservan hasta ahora la pagina, el atributo de color y  el numero de caracteres a pintar
        INT     10h
        JMP     CicloDerecha
EsqSupDer:      ; Codigo para la esquina superior derecha
        INT     10h     ; queda el cursor posicionado y  Ahora dibujo la esquina
        MOV     AH, 9   ; Servicio para poner caracter y atributo
        MOV     AL, 191 ; Caracter 191, esquina superior derecha '+'
        ; BH, BL y CX conservan hasta ahora la pagina, el atributo de color y 
        ; el numero de caracteres a pintar
        INT     10h
        ; Ahora, toca la linea superior; conservamos el manejo de coordenadas
        ; De hecho, es muy similar a la linea derecha
CicloSuperior:
        MOV     AH, 2   ; Servicio gotoxy
        DEC     DL      ; Disminuye X
        CMP     DL, X1  ; Si llego a la columna X1, hay que pintar esquina
        JE      EsqSupIzq
        INT     10h     ; queda el cursor posicionado,  Ahora dibujo la linea
        MOV     AH, 9   ; Servicio para poner caracter y atributo
        MOV     AL, 196 ; Caracter 196, linea horizontal '-'
        ; BH, BL y CX siguen conservandose 
        INT     10h
        JMP SHORT CicloSuperior
        ; Esquina superior izquierda, igual que con la derecha
EsqSupIzq:      ; Codigo para la esquina superior izquierda
        INT     10h     ; queda el cursor posicionado
        ; Ahora dibujo la esquina
        MOV     AH, 9   ; Servicio para poner caracter y atributo
        MOV     AL, 218 ; Caracter 218, esquina superior izquierda '+'
        ; BH, BL y CX conservan hasta ahora la pagina, el atributo de color y 
        ; el numero de caracteres a pintar
        INT     10h
        ; Lo mismo que hemos hecho, pero ahora bajamos por la linea izquierda
CicloIzquierda:
        MOV     AH, 2   ; Servicio Gotoxy
        INC     DH      ; Incrementa Y => hacia abajo
        CMP     DH, Y2  ; Si llego al renglon Y2, hay que pintar esquina
        JE      EsqInfIzq
        INT     10h     ; queda el cursor posicionado
        ; Ahora dibujo la l¡nea
        MOV     AH, 9   ; Servicio para poner caracter y atributo
        MOV     AL, 179 ; Caracter 179, linea vertical '¦'
        ; Se conservan hasta ahora la pagina, el atributo de color y 
        ; el numero de caracteres a pintar
        INT     10h
        JMP SHORT CicloIzquierda
        ; Esquina inferior izquierda
EsqInfIzq:
        INT     10h     ; queda el cursor posicionado
        ; Ahora dibujo la esquina
        MOV     AH, 9   ; Servicio para poner caracter y atributo
        MOV     AL, 192 ; Caracter 192, esquina inferior izquierda '?'
        ; BH, BL y CX conservan hasta ahora la pagina, el atributo de color y 
        ; el numero de caracteres a pintar
        INT     10h
        ; Ya solo nos falta repetir lo mismo, en la linea de abajo
CicloInferior:
        MOV     AH, 2   ; Servicio gotoxy
        INC     DL      ; Incrementa X
        CMP     DL, X2  ; Si llego a la columna X2, se termino
        JE      FinMarco
        INT     10h     ; queda el cursor posicionado
        ; Ahora dibujo la l¡nea
        MOV     AH, 9   ; Servicio para poner caracter y atributo
        MOV     AL, 196 ; Caracter 196, linea horizontal '-'
        ; BH, BL y CX siguen conservandose 
        INT     10h
        JMP SHORT CicloInferior
FinMarco:
        RET     ; Termino, regreso a donde se llamo la rutina
Marco   ENDP

; Programa principal para probar el procedimiento

Principal       PROC
        ; Inicio de todo programa que use datos: inicializar DS
        MOV     AX, @data
        MOV     DS, AX
        ; Pruebas
        MOV     CL, 0           ; Marco de casi toda la pantalla
        MOV     CH, 0
        MOV     DL, 79
        MOV     DH, 23
        MOV     BH, 0           ; en pagina 0
       ; MOV    BL, 1Ah         ; verde sobre azul
         MOV    BL, 1Fh         ; Blanco sobre azul
       ; MOV    BL, 0Fh        ; Blanco sobre negro
       ; MOV    BL,9FH         ; Blanco sobre azul en parpadeo
        CALL    Marco
       ; Fin de programa, regresar control a DOS
	   
	   
	    MOV     CL, 10           ; Marco de casi toda la pantalla
        MOV     CH, 10
        MOV     DL, 69
        MOV     DH, 13
        MOV     BH, 0           ; en pagina 0
       ; MOV    BL, 1Ah         ; verde sobre azul
         MOV    BL, 1Fh         ; Blanco sobre azul
       ; MOV    BL, 0Fh        ; Blanco sobre negro
       ; MOV    BL,9FH         ; Blanco sobre azul en parpadeo
        CALL    Marco
       ; Fin de programa, regresar control a DOS
	   
	   
	   
        MOV     AH, 4Ch
        INT     21h
Principal       ENDP
        END     Principal
