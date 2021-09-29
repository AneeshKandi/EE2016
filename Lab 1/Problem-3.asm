; Exp1_Problem3.asm
;
; Author : ANEESH KANDI
;

.CSEG
      LDI ZL,LOW(2*NUM);
      LDI ZH,HIGH(2*NUM);
      LPM R16, Z+
      LPM R17, Z
      MUL R16, R17    ; Answer stored in Registers R0 and R1 by default
      NOP
NUM:  .db $AB, $23
