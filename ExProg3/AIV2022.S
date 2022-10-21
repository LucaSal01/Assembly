.org $8000
LDX #00

input:
LDA $4000
CMP #$01 
BEQ up
CMP #$02 
BEQ down
CMP #$04
BEQ left
CMP #$08 
BEQ right
RTS

up:
JSR clear
TYA
ADC #$ef
TAY
RTS

down:
JSR clear
TYA
ADC #$0F
TAY
RTS

left:
JSR clear
DEY
RTS

right:
JSR clear
INY
RTS

clear:
LDA #00
STA $0200, Y
RTS

setpixel:
LDA #01
STA $0200, Y
RTS

start:
JSR input
JSR setpixel
JMP start

.goto $FFFA
.dw start ; non maskable
.dw start ; reset
.dw start ; input
