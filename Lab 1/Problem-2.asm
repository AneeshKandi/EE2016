; Exp1_Problem2.asm
;
; Author : ANEESH KANDI
;

.CSEG
      LDI ZL, LOW(2*NUM)
      LDI ZH, HIGH(2*NUM)
      LPM R16, Z+   ; Higher byte of first number 
      LPM R17, Z+   ; Lower byte of first number
      LPM R18, Z+   ; Higher byte of second number
      LPM R19, Z    ; Lower Byte of second number
      LDI R20, 00
      ADD R17, R19
      ADC R16, R18
      BRCC abc      ; jump if no carry,
      LDI R20,0x01  ; else make carry 1
abc:  NOP
NUM:  .db $12, $A5, $B2, $54   ; Since ATMega 8 is an 8-bit processor, the inputs need to be of 8-bits
