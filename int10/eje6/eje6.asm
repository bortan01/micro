.model small
.stack
.data
.code
	inicio:
		mov ah,2h
		mov bh,5h
		mov dh,20h
		int 10h
		
		.exit
	end inicio


