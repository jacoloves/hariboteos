; naskfunc
; TAB=4

[FORMAT "WCOFF"]
[BITS 32]

; object file

[FILE "naskfunc.nas"]

        GLOBAL  _io_hlt

; function

[SECTION .test]

_io_hlt:
        HLT
        RET