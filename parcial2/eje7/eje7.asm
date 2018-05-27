.model small
.stack 128
.data

.code
.startup
main proc
; INT 10h / AH = 0 - configurar modo de video.
; AL = modo de video deseado.
;     00h - modo texto. 40x25. 16 colores. 8 paginas.
;     03h - modo texto. 80x25. 16 colores. 8 paginas.
;     13h - modo grafico. 40x25. 256 colores.
;           320x200 pixeles. 1 pagina.
mov ax,0013h
int 10h

; ============== Lineas verticales ======================
; INT 10h / AH = 0Ch - cambiar color de un pixel.
;   AL = color
;   CX = columna
;   DX = fila

; for CX=0 to 256
;   for DX=0 to 200
;     Poner pixel (DX,CX) con color CX
mov cx,0000h
mov dx,0000h

ciclo_1:
mov ah,0ch
mov al,cl
int 10h
inc dx
cmp dx,200
jne ciclo_1

mov dx,0000h
inc cx
cmp cx,256
jne ciclo_1

; esperar por tecla
mov ah,10h
int 16h

; ============== Lineas horizontales ======================
; INT 10h / AH = 0Ch - cambiar color de un pixel.
;   AL = color
;   CX = columna
;   DX = fila

; for DX=0 to 200
;   for CX=0 to 320
;     Poner pixel (DX,CX) con color DX
mov cx,0000h
mov dx,0000h

ciclo_2:
mov ah,0ch
mov al,dl
int 10h
inc cx
cmp cx,320
jne ciclo_2

mov cx,0000h
inc dx
cmp dx,200
jne ciclo_2

; esperar por tecla
mov ah,10h
int 16h

; regresar a modo texto
mov ax,0003h
int 10h

; finalizar el programa
mov ax,4c00h
int 21h
ret
main endp
end

