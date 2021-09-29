;
; Exp1_Problem3.asm
;
; Created: 01-09-2021 3.28.01 PM
; Author : ANEESH KANDI
;


.CSEG
LDI ZL,LOW(2*NUM);
LDI ZH,HIGH(2*NUM);
LPM R16, Z+
LPM R17, Z
MUL R16, R17
NOP
NUM: .db $AB, $23
