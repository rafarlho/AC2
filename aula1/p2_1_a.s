.data
.text
.globl main
main:

do:
    li $v0,2
    syscall
    move $t0,$v0
    addiu $t0,$t0,1
    move $a0,$t0
    li $v0,3
    syscall
    bne $t0,'\n',do
    li $v0,0
    jr $ra