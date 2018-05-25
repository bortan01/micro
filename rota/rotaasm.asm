.model small
.stack
.data
	Valor db 150
	
.code
inicio:
	mov ax,@data
	mov ds,ax    
	
	;shl Valor,10;desplazamiento a la izquierda multiplica por 2 en cada iteracion
	;shr Valor,10 ;desplazamiento a la derecha divide entre 2 por cada iteracion 
	;rol Valor,10 ;rotacion simple a la izquierda
	;ror Valor,10 ;rotacion simple a la derecha
	;rcl Valor,10 ;rotacion a la izquierda por cf
	;rcr Valor,10 ;rotacion a la derecha por cf 
	;sal Valor,10 ;igual que shl  
	;sar Valor,10 ;mantiene y desplaza el numero mas significativo de izquierda a derecha
	
salir:
    .exit
  
end inicio