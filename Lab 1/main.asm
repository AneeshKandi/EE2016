;
; Exp1_Problem4.asm
;
; Created: 01-09-2021 3.33.35 PM
; Author : ANEESH KANDI
;
; SIR, I HAVE MODIFIED CODE HERE. I REPLACED BRCC WHICH I USED BEFORE WITH BRGE. NOW IT COMPARES SIGNED INPUTS. THE FINAL ANSWER WILL BE "5F" AS YOU SAID NOT "F9"

.CSEG 
LDI ZL,LOW(2*NUM)
LDI ZH,HIGH(2*NUM);
LDI XL,0x60
LDI XH,0x00
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
abc: ST X,R0
NOP 
NUM:.db 0xD3,0x3D,0xF9, 0x54
