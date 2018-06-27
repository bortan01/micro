; Programa de Clave C‚sar
; 
; Lenguaje Ensamblador
;
; La clave C‚sar consiste en cambiar cada letra por la letra que est  
; colocada "n" posiciones m s adelante en el alfabeto. Se dice que Julio
; C‚sar us¢ n=3. Para las £ltimas 3 letras del alfabeto, se les hace
; corresponder con las 3 primeras
;
; Con n = 3, y en el alfabeto ASCII, la tabla de equivalencia ser¡a:
;
; A B C D E F G H I J K L M N O P Q R S T U V W X Y Z         Original
; D E F G H I J K L M N O P Q R S T U V W X Y Z A B C         En clave
;
; Ejemplo:
;
; El mensaje "AQUIESTOY" se codifica
;            "DTXLHVWRB"

.model small                    ; Directiva del modelo de memoria
.stack 100h                     ; Reservamos la pila
.data
Mensaje DB      'AQUIESTOY$'            ; Mensaje a encriptar, con
                                        ; el signo de $ como delimitador
EnClave DB      40 DUP (?)              ; Reservamos 40 bytes para poner
                                        ; nuestro mensaje en clave.
                                        ; No los inicializamos pues no 
                                        ; sabemos el valor que tendr n al
                                        ; final
.code

Inicio:                                 ; Etiqueta que marca el inicio del
                                        ; programa

        MOV     AX, @data               ; Instrucciones que inicializan
        MOV     DS, AX                  ; el Data Segment

        ; Primera parte del algoritmo: inicializar variables
        LEA     SI, Mensaje             ; SI lo vamos a usar como apuntador
                                        ; al byte que estamos codificando
        LEA     DI, EnClave             ; y DI como apuntador al byte de
                                        ; resultado

        ; Segunda parte: ciclo que codifique

Ciclo:                                  ; Etiqueta que marca la direcci¢n
                                        ; de inicio del c¢digo repetitivo
        MOV     AL, [SI]                ; Pone en AL el c¢digo ASCII de 
                                        ; la letra que se va a codificar
        CMP     AL, '$'                 ; Para ver si es el delimitador
        JE      FinCiclo                ; Si la letra es '$', entonces ya
                                        ; terminamos el ciclo y salimos

        ; Este c¢digo se ejecuta si no se cumpli¢ la condici¢n, es decir
        ; si no hemos llegado al fin del mensaje

        CMP     AL, 'X'                 ; Si es una de las £ltimas 3 letras
        JAE     OtroCodigo              ; Entonces va a codificar de otra
                                        ; forma
        ADD     AL, 3                   ; Le suma 3, lo que en ASCII da
                                        ; la equivalencia, ej. A + 3 = D
        MOV     [DI], AL                ; Coloca en el byte apuntado por DI
                                        ; el resultado
        INC     SI                      ; Incrementamos los apuntadores
        INC     DI                      ; de manera que apuntan a la siguiente
                                        ; letra
        JMP     Ciclo                   ; Salto incondicional, seguimos en el
                                        ; ciclo de codificaci¢n

        ; Secci¢n de c¢digo para el caso especial

OtroCodigo:                             ; Etiqueta que marca esta secci¢n

        SUB     AL, 'X' - 'A'           ; Le resta la diferencia necesaria
                                        ; para transformar 'X' en 'A', que
                                        ; es igual que 'Y' en 'B' y 'Z' en 'C'
        MOV     [DI], AL                ; Coloca en el byte apuntado por DI
                                        ; el resultado
        INC     SI                      ; Incrementamos los apuntadores
        INC     DI                      ; de manera que apuntan a la siguiente
                                        ; letra
        JMP     Ciclo                   ; Regresa al ciclo de codificaci¢n

FinCiclo:                               ; Etiqueta que indica el c¢digo de
                                        ; salida
        MOV     [DI], AL                ; Coloca el signo de $ al final del
                                        ; resultado

        ; C¢digo de terminaci¢n de programa - siempre necesario
        MOV     AH, 4Ch                 ; N£mero de servicio de la 
                                        ; interrupci¢n, indica regresar a DOS
        INT     21h                     ; Llamada a la interrupci¢n, regresamos
                                        ; a DOS
        END     Inicio  
