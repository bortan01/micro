.MODEL small
.DATA
	
.CODE
	programa:			
	;============uso de cbw==================================
		mov ah,3 ;
        mov  al,5
        cbw ;Convertir un byte en palabra
		          
		mov ah,4ch
		int 21h
		
    end programa      
.stack
    