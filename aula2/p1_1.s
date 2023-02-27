## a) increme
# Tick = 1/20M = 50 nseg
# 200000 * 50 ns = 1 msg
# 20 milhoes = 1 seg

## b) 
.data
.equ read_core_timer,11
.equ reset_core_timer,12
.equ put_char, 3
.equ print_int, 6
.text
.globl main
main:
    li $t0,0
while:
    li $v0,reset_core_timer
    syscall
while2:
    li $v0,read_core_timer
    syscall
    li $t2,20000000#5 10 200000
    bge $v0,$t2,endw2
    j while2
endw2:
    li $a1,4
    sll $a1,$a1,16
    ori $a1,$a1,10
    move $a0,$t0
    li $v0,print_int
    syscall
    
    addiu $t0,$t0,1

    li $a0,'\r'
    li $v0,put_char
    syscall
    
    j while
endw:
    li $v0,0
    jr $ra

