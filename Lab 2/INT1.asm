.org 0x0000
rjmp reset
.org 0x0002 ; Interrupt Vector Table location of Interrupt 1
rjmp int1_ISR
.org 0x0100
reset:
;Loading stack pointer address
LDI R16,0x70
OUT SPL,R16
LDI R16,0x00
OUT SPH,R16
;Interface port B pin0 to be output so to view LED blinking
SBI DDRB, 0
LDI R16,0x00
OUT DDRD,R16 ; Set PORTD as Input
SBI PORTD, 3 ; Activate Pull-Up Resistor
;Set MCUCR register to enable low level interrupt
OUT MCUCR,R16
;Set GICR register to enable interrupt 1
LDI R16, 0x80
OUT GICR, R16
LDI R16,0x00
OUT PORTB,R16
SEI
; --------------Main Program-------------------------
ind_loop: NOP
rjmp ind_loop
; -------------------ISR starts here------------------
int1_ISR: IN R16,SREG
PUSH R16 ; Store the SREG value in Stack
LDI R16,0x0A ; LED blinks 10 times
MOV R0,R16
c1: LDI R16,0x01
OUT PORTB,R16 ;Switch ON LED
;1 second delay
LDI R16,8
a1: LDI R17,125
a2: LDI R18,250
a3: NOP
DEC R18
BRNE a3
DEC R17
BRNE a2
DEC R16
BRNE a1
LDI R16,0x00
OUT PORTB,R16 ; Switch OFF LED
; 1 second delay
LDI R16,8
b1: LDI R17,125
b2: LDI R18,250
b3: NOP
DEC R18
BRNE b3
DEC R17
BRNE b2
DEC R16
BRNE b1
DEC R0
BRNE c1 ; Repeat 10 times
POP R16 ; Pop the Original Status Register value from stack
OUT SREG, R16
RETI
