ori $s2, $0, 0 #the address of a[0] 
ori $t0, $0, 0x7111 #to try the lui $rs} //lui is {imm,{16{0}}}, not {imm, #0x0078000([39:24]=01111000) 
lui $t0, 0x7 
ori $t0, 0x8000

sw $t0, 0($s2) #a[0] = 0x00010000

ori $s0, $0, 1 
ori $s1, $0, 32 
for_1_begin: 
beq $s0, $s1, for_1_end #for i = 1 to 31
nop
ori $t0, $0, 4 
addu $s2, $s2, $t0
lw $t0, -4($s2) #get a[i-1] ori $t1, $0, 0x8000
ori $t1, $0, 0x8000
subu $t0, $t0, $t1 #try zero extern (16'b1000...)
sw $t0, 0($s2)
ori $t0, $0, 1 
addu $s0, $s0, $t0 
beq $0, $0, for_1_begin 
nop

for_1_end:
