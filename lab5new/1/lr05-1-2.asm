PUBLIC output_X
EXTRN X: byte

DS2 SEGMENT AT 0b800h
	CA LABEL byte
	ORG 80 * 2 * 2 + 2 * 2;задание текущей позиции
	Z LABEL word;€чейка указанного типа в тек. позиции
DS2 ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
	assume CS:CSEG, ES:DS2
output_X proc near
	mov ax, DS2
	mov es, ax
	mov ah, 5
	mov al, X
	mov z, ax
	ret
output_X endp
CSEG ENDS
END