.data
str1:   .asciiz "   "
.equ read_core_timer,11
.equ reset_core_timer,12
.equ put_char, 3
.equ print_int, 6
.text
.globl main
main:
    addiu $sp,$sp,-4
    sw $ra,0($sp)

    li $t1,0
    li $t2,0
    li $t3,0
    li $t4,0 #rem
while:
    
    li $a0,100
    jal delay

    li $a1,4
    sll $a1,$a1,16
    ori $a1,$a1,10
    move $a0,$t1
    li $v0,print_int
    syscall
    addiu $t1,$t1,1

    la $a0,str1
    li $v0,8
    syscall

    move $a0,$t2
    li $v0,print_int
    syscall

    la $a0,str1
    li $v0,8
    syscall

    move $a0,$t3
    li $v0,print_int
    syscall

    addiu $t4,$t4,1
if1:
    rem $t5,$t4,2
    bnez $t5,if2
    addiu $t2,$t2,1
if2:
    bne $t4,10,endifs
    addiu $t3,$t3,1
    li $t4,0
endifs:
    li $a0,'\r'
    li $v0,put_char
    syscall
    
    j while
endw:

    li $v0,0

    lw $ra,0($sp)
    addiu $sp,$sp,4
    jr $ra


#####################################
.data
.equ read_core_timer,11
.equ reset_core_timer,12
.text
delay:
   li $v0,reset_core_timer
   syscall
   li $t0,0
while_delay:
    li $v0,read_core_timer
    syscall
    mul $t0,$a0,20000
    bge $v0,$t0,endw_delay
    j while_delay    
endw_delay:
    jr $ra
#####################################