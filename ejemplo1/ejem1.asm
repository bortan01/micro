.MODEL SMALL ; Define el modelo de memoria 
.stack ; cuando el stack no tiene nada  = 256  corresponde a ss
.DATA ; Define el segmentos de datos   corresponde a ds
msj DB "Texto a imprimir",13,10,"$" 
.CODE ;Define el area de codigo 
inicio: 
Mov AX, @Data ;Obtiene la direccion del segmento de datos    //oblicatoria cuando se quiere tener un segmento data 
Mov Ds, Ax ;Inicializa a DS con esa direccion 
Mov Dx, Offset Msj ;Despliega el mensaje en dx tiene que estar la direccion del mensaje 
mov ah,09h  ; para imprimir el mensaje 
int 21h 
Mov ax,4c00h 
int 21h 
End inicio
