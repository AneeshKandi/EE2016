; Exp1_Problem4.asm
;
; Author : ANEESH KANDI
;
; This program compares the numbers assuming that they are Signed Numbers. 
; If you want to compare unsigned numbers, replace "BRGE" to "BRCC" in the code

.CSEG 
       LDI ZL,LOW(2*NUM)
       LDI ZH,HIGH(2*NUM)
       LDI XL,0x60      ; SRAM location
       LDI XH,0x00
       ; Bubble Sort
       LPM R0,Z+
       LPM R1,Z+
       CP R0,R1
       BRGE check1
       MOV R0,R1
       check1: LPM R1,Z+
       CP R0,R1
       BRGE check2
       MOV R0,R1
       check2: LPM R1,Z
       CP R0,R1
       BRGE abc
       MOV R0,R1
abc:   ST X,R0
NOP 
NUM:   .db 0xD3,0x3D,0xF9, 0x54
