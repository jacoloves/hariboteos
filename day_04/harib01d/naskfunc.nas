; naskfunc
; TAB=4

[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[BITS 32]

; object file

[FILE "naskfunc.nas"]

        GLOBAL  _io_hlt,_write_mem8

; function

[SECTION .test]

_io_hlt:
        HLT
        RET

_write_mem8:    ; void write_mem8(int addr, int data);
        MOV     ECX,[ESP+4]     ; [ESP+4] in addr read ECX
        MOV     AL,[ESP+8]      ; [ESP+8] in data read AL
        MOV     [ECX],AL
        RET
