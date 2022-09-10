// Keeps setting the counter to 0
addi x3, x0, 0
lui x3,0x30020 # x3 = 0x3001000 (GPIO write addr)
loop:
sw x0, 0(x3)  
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
j loop
