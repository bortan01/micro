%TITLE "RUTINAS PARA PRODUCIR TONOS"
IDEAL
DOSSEG
MODEL small
DATASEG
ContReloj DW ?,?
ContA DW 1000 ;Para nota
ContD DW 1000 ;Para silencio
Entera DW 2000 ;Nota entera
Notas 	DW 4186 ;C
	DW 4435
	DW 4699 ;D
	DW 4978
	DW 5274 ;E
	DW 5588 ;F
	DW 5920
	DW 6272 ;G
	DW 6645
	DW 7040 ;A
	DW 7459
	DW 7902 ;B
CODESEG
PUBLIC Toca
;-------------------------------------------------
PROC Frec
	push dx ;Salva registros
	push ax
	mov dx,12h ;Parte superior del numerador
	mov ax,34deh ;Parte inferior del numerador
	div cx ;Divide entre frecuencia
	mov cx,ax ;El cociente es la salida
	pop ax ;Repone registros
	pop dx
ENDP Frec
;-------------------------------------------------
PROC PoneTono
	push ax
	;Carga período en el timer
	mov al,cl ;Byte bajo, primero
	out 42h,al ;Envía al 8254
	mov al,ch ;Byte alto, después
	out 42h,al
	pop ax ;Repone registro
ENDP PoneTono
;-------------------------------------------------
PROC ATono
	push ax ;Salva registro
	in al,61h ;Trae contenido de puerto B
	or al,03 ;Enciende bocina y timer
	out 61h,al ;Saca nuevo valor de puerto B
	pop ax ;Repone registro
ENDP ATono
;-------------------------------------------------
PROC Lapso
	push ax dx cx bx ;Salva registros
	mov dx,0
	mov ax,cx
	mov bx,55;18.2 tics/seg; esta linea modifique
	div bx
	mov bx,ax ;BX = número de tics
	mov ah,00 ;Trae tics del día con BIOS
	int 1ah
	mov [word ContReloj],cx ;Salva parte alta
	mov [word ContReloj + 2],dx ;Salva parte baja
@@10:
	mov ah,0 ;Lee con BIOS los tics
	int 1ah
	sub dx,bx ;Les resta tics del lapso
	sbb cx,0
	cmp cx,[word ContReloj] ;Compara parte alta
	jb @@10 ;Si es menor vuelve a leer
	ja @@20 ;Si mayor, ya termino
	cmp dx,[word ContReloj+2] ;Iguales, compara parte inferior
	jb @@10
@@20:
	pop bx cx dx ax ;recobra registros
	ret
ENDP Lapso
;------------------------------------------------
PROC QTono
	push ax ;Salva registro AX
	in al,61h ;Trae valor de puerto B
	and al,0fch ;Apaga altavoz y timer
	out 61h,al
	pop ax ;Recupera registro AX
	ret
ENDP QTono
;------------------------------------------------
PROC Nota
	push cx ;Salva registros que
	push bx ;usa
	push ax
	mov ah,0 ;Extiende número de nota
	mov cl,12 ;Divide entre 12
	div cl ;Has la división
	mov dl,al ;El cociente da la octava
	mov al,ah ;El residuo es el índice
	cbw ;Búsqueda requiere 16 bits
	shl ax,1 ;Dos bytes por nota
	mov bx,ax ;Usa direccionamiento base
	mov cx,[notas + bx] ;Trae de la tabla
	call Frec ;Convierte la frecuencia
	xchg cx,dx ;Octava en CL, periodo en DX
	neg cl ;Contador de corrimiento
	add cl,8 ;= 8 - octava
	sal dx,cl
	pop ax ;Recupera registros
	pop bx
	pop cx
ENDP Nota
;-------------------------------------------------
PROC Toca
	push si ;Salva registros usados
	push dx
	push cx
	push bx
	push ax
	; pone tempo por omisión..
	mov [Entera],1000 ;2,000 ms para una nota entera
	cld ;Incrementando
@@10:
	lodsb ;Trae byte de la lista
	; checa si llega comando de terminación..
	cmp al,'X' ;¿Final ?
	jne @@20
	jmp @@99
	; comando tempo.
@@20:
	cmp al,'T' ;¿Comando tiempo?
	jne @@30 ;No, brinca
	lodsb ;Trae tempo
	mov cl,al ;Lo pone en CX
	mov ch,0
	mov ax,60000 ;Milisegundos en un minuto
	mov dx,0 ;Borra parte superior
	div cx ;Divide entre el tiempo
	mov [Entera],ax ;ms por nota entera
	jmp @@10
	; comando nota..
@@30:
	cmp al,'N' ;¿Comando nota ? 
	jne @@40 ;No, brinca
	lodsb ;Trae número de nota
	call Nota ;Convierte
	mov cx,dx ;Resultado en CX
	call PoneTono ;Pone la frecuencia
	call Atono ;Prende el altavoz
	mov cx,[Entera] ;Trae ms por nota entera
	lodsb ;Trae duración
	mov ah,al ;Prepara multiplicador
	mov al,0 ;de duración
	sal cx,1 ;Factor de escala 1
	mul cx ;Multiplica
	mov cx,dx ;Contador total para la nota
	lodsb ;Trae estilo
	mov ah,al ;Prepara multiplicador
	mov al,0 ;de estilo
	mul cx ;Multiplica
	mov [ContA],dx ;Salva contador para nota
	sub cx,dx ;Contador para descanso
	mov [ContD],cx ;Lo salva
	mov cx,[ContA] ;Parte audible de la nota
	call Lapso ;Retardo
	call QTono ;Apaga altavoz
	mov cx,[contD] ;Parte inaudible de la nota
	call Lapso
	jmp @@10
	; Comando de descanso..
@@40:
	cmp al,'D' ;¿Comando de silencio ?
	jne @@99 ;No, salir
	mov cx,[Entera] ;Trae ms por nota entera
	lodsb ;Trae duración
	mov ah,al ;Prepara multiplicador
	mov al,0 ;de duración
	sal cx,1 ;Factor para escala 1
	mul cx ;Multiplica 
	mov cx,dx ;Contador total
	call Lapso
	jmp @@10

@@99:
	pop ax ;Recupera
	pop bx
	pop cx
	pop dx
	pop si
	ret
ENDP Toca
END ;Fin de módulo SONIDO.ASM.