PUBLIC	PR_Out10
EXTRN	PR_NewLine:NEAR




Code	SEGMENT	PUBLIC
	ASSUME CS:Code
;--------------------------------------------------------------------------------------
;�������� ����������, ���������� ����� ����, ��� ���������� ����� ��� ����� (15 ��� 15, -15 ��� 65521)
;--------------------------------------------------------------------------------------
PR_Out10	PROC	NEAR
		PUSH	BP									;�������� ��������
		MOV		BP,SP
		PUSH	AX									;���������� ��� �������
		PUSH	DX
		PUSH	BX

		MOV		AX,[BP+4]						;�������� � �� �����, ������� ���� �����������
		MOV		BX,10								;������ ����� �� ������; BX ������� ����� ���������
															;������� �������� ����� (� �� ��������� ������������)

	;� ������, �������� ���������: ����������� � �� ����� ���������� 123, ����� ������� �� ������� ����� ��� ��� �����,
	;�� ���� > ___ , � ����� ����� �������� �� ������� �����: > __3 , > _23 , > 123

		PUSH	AX									;�������� ��, ������ ��� ��� ��� ��� ���� ��������

;� ���� ����� ����� �������� ����������� ���������� ���������
LO10_Div1:
		MOV		DX,0
		DIV		BX								;AX ����� �� BX(���������), ������� ����� ������ � DX
		PUSH	AX								;�������� �������� AX (����� �����)
		MOV		AH,2							;�������� �������
		MOV		DL,'a'
		INT		21h
		POP		AX								;��������������� �����
		CMP		AX,0							;���� ��� �� ����
		JNE		LO10_Div1					;�� ����

		MOV	AH,2
		MOV DL,8								;������ ���� ����� �����
		INT 21h

		POP		AX								;��������������� ����������� �����

	LO10_Div2:
		MOV		DX,0
		DIV		BX								;AX ����� �� BX(���������), ������� ����� ������ � DX
		PUSH	AX								;�������� �������� AX (����� �����)
		MOV		AH,2
		ADD		DL,'0'						;�������� �������� DX (�������)
		INT		21h
		MOV		DL,8							;��������� ����� ������
		INT		21h
		INT		21h
		POP		AX								;��������������� ���������� �����
		CMP		AX,0							;���� ����� ��� �� ����
		JNE		LO10_Div2					;�� ����


	POP		BX
	POP		DX
	POP		AX
	POP		BP
	RET
PR_Out10	ENDP
;--------------------------------------------------------------------------------------
Code	ENDS

END