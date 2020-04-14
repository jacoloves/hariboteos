[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_io_hlt
	EXTERN	_io_load_eflags
	EXTERN	_io_cli
	EXTERN	_io_out8
	EXTERN	_io_store_eflags
[FILE "bootpack.c"]
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	SUB	ESP,20
	CALL	_init_palette
	MOVSX	EBX,WORD [4086]
	MOVSX	EAX,WORD [4084]
	MOV	DWORD [-20+EBP],EAX
	MOV	EAX,DWORD [4088]
	MOV	DWORD [-16+EBP],EAX
	MOV	EDI,DWORD [-20+EBP]
	LEA	EAX,DWORD [-29+EBX]
	DEC	EDI
	PUSH	EAX
	PUSH	EDI
	PUSH	0
	PUSH	0
	PUSH	14
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	CALL	_boxfill8
	LEA	EAX,DWORD [-28+EBX]
	PUSH	EAX
	PUSH	EDI
	PUSH	EAX
	PUSH	0
	PUSH	8
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	CALL	_boxfill8
	LEA	EAX,DWORD [-27+EBX]
	ADD	ESP,56
	PUSH	EAX
	PUSH	EDI
	PUSH	EAX
	PUSH	0
	PUSH	7
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	CALL	_boxfill8
	LEA	EAX,DWORD [-1+EBX]
	PUSH	EAX
	LEA	EAX,DWORD [-26+EBX]
	PUSH	EDI
	PUSH	EAX
	PUSH	0
	PUSH	8
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	CALL	_boxfill8
	LEA	EAX,DWORD [-24+EBX]
	ADD	ESP,56
	MOV	DWORD [-24+EBP],EAX
	PUSH	EAX
	PUSH	59
	PUSH	EAX
	PUSH	3
	PUSH	7
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	CALL	_boxfill8
	LEA	EAX,DWORD [-4+EBX]
	PUSH	EAX
	MOV	DWORD [-28+EBP],EAX
	PUSH	2
	PUSH	DWORD [-24+EBP]
	PUSH	2
	PUSH	7
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	DWORD [-28+EBP]
	PUSH	59
	PUSH	DWORD [-28+EBP]
	PUSH	3
	PUSH	15
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	CALL	_boxfill8
	LEA	EAX,DWORD [-5+EBX]
	PUSH	EAX
	LEA	EAX,DWORD [-23+EBX]
	PUSH	59
	MOV	DWORD [-32+EBP],EAX
	PUSH	EAX
	SUB	EBX,3
	PUSH	59
	PUSH	15
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	EBX
	PUSH	59
	PUSH	EBX
	PUSH	2
	PUSH	0
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	CALL	_boxfill8
	PUSH	EBX
	PUSH	60
	PUSH	DWORD [-24+EBP]
	PUSH	60
	PUSH	0
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	CALL	_boxfill8
	MOV	EDI,DWORD [-20+EBP]
	ADD	ESP,56
	MOV	ESI,DWORD [-20+EBP]
	PUSH	DWORD [-24+EBP]
	SUB	ESI,4
	SUB	EDI,47
	PUSH	ESI
	PUSH	DWORD [-24+EBP]
	PUSH	EDI
	PUSH	15
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	CALL	_boxfill8
	PUSH	DWORD [-28+EBP]
	PUSH	EDI
	PUSH	DWORD [-32+EBP]
	PUSH	EDI
	PUSH	15
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	EBX
	PUSH	ESI
	PUSH	EBX
	PUSH	EDI
	PUSH	7
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	CALL	_boxfill8
	MOV	EAX,DWORD [-20+EBP]
	PUSH	EBX
	SUB	EAX,3
	PUSH	EAX
	PUSH	DWORD [-24+EBP]
	PUSH	EAX
	PUSH	7
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	CALL	_boxfill8
	ADD	ESP,56
L2:
	CALL	_io_hlt
	JMP	L2
[SECTION .data]
_table_rgb.0:
	DB	0
	DB	0
	DB	0
	DB	-1
	DB	0
	DB	0
	DB	0
	DB	-1
	DB	0
	DB	-1
	DB	-1
	DB	0
	DB	0
	DB	0
	DB	-1
	DB	-1
	DB	0
	DB	-1
	DB	0
	DB	-1
	DB	-1
	DB	-1
	DB	-1
	DB	-1
	DB	-58
	DB	-58
	DB	-58
	DB	-124
	DB	0
	DB	0
	DB	0
	DB	-124
	DB	0
	DB	-124
	DB	-124
	DB	0
	DB	0
	DB	0
	DB	-124
	DB	-124
	DB	0
	DB	-124
	DB	0
	DB	-124
	DB	-124
	DB	-124
	DB	-124
	DB	-124
[SECTION .text]
	GLOBAL	_init_palette
_init_palette:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	_table_rgb.0
	PUSH	15
	PUSH	0
	CALL	_set_palette
	LEAVE
	RET
	GLOBAL	_set_palette
_set_palette:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	PUSH	ECX
	MOV	EBX,DWORD [8+EBP]
	MOV	EDI,DWORD [12+EBP]
	MOV	ESI,DWORD [16+EBP]
	CALL	_io_load_eflags
	MOV	DWORD [-16+EBP],EAX
	CALL	_io_cli
	PUSH	EBX
	PUSH	968
	CALL	_io_out8
	CMP	EBX,EDI
	POP	EAX
	POP	EDX
	JLE	L11
L13:
	MOV	EAX,DWORD [-16+EBP]
	MOV	DWORD [8+EBP],EAX
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	JMP	_io_store_eflags
L11:
	MOV	AL,BYTE [ESI]
	INC	EBX
	SHR	AL,2
	MOVZX	EAX,AL
	PUSH	EAX
	PUSH	969
	CALL	_io_out8
	MOV	AL,BYTE [1+ESI]
	SHR	AL,2
	MOVZX	EAX,AL
	PUSH	EAX
	PUSH	969
	CALL	_io_out8
	MOV	AL,BYTE [2+ESI]
	SHR	AL,2
	ADD	ESI,3
	MOVZX	EAX,AL
	PUSH	EAX
	PUSH	969
	CALL	_io_out8
	ADD	ESP,24
	CMP	EBX,EDI
	JLE	L11
	JMP	L13
	GLOBAL	_boxfill8
_boxfill8:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	PUSH	EDI
	PUSH	EDI
	MOV	AL,BYTE [16+EBP]
	MOV	ECX,DWORD [24+EBP]
	MOV	EDI,DWORD [28+EBP]
	MOV	BYTE [-13+EBP],AL
	CMP	ECX,DWORD [32+EBP]
	JG	L26
	MOV	EBX,DWORD [12+EBP]
	IMUL	EBX,ECX
L24:
	MOV	EDX,DWORD [20+EBP]
	CMP	EDX,EDI
	JG	L28
	MOV	ESI,DWORD [8+EBP]
	ADD	ESI,EBX
	ADD	ESI,EDX
	MOV	DWORD [-20+EBP],ESI
L23:
	MOV	ESI,DWORD [-20+EBP]
	MOV	AL,BYTE [-13+EBP]
	INC	EDX
	MOV	BYTE [ESI],AL
	INC	ESI
	MOV	DWORD [-20+EBP],ESI
	CMP	EDX,EDI
	JLE	L23
L28:
	INC	ECX
	ADD	EBX,DWORD [12+EBP]
	CMP	ECX,DWORD [32+EBP]
	JLE	L24
L26:
	POP	EBX
	POP	ESI
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
