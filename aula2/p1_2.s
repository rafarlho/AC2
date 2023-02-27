.data
    .equ read_core_timer,11
    .equ reset_core_timer,12
    .equ put_char, 3
    .equ print_int, 6
.text
.globl main
main:
    addiu $sp,$sp,-4
    sw $ra,0($sp)

    li $t0,0
while:
    
    li $a0,1000
    jal delay

    li $a1,4
    sll $a1,$a1,16
    ori $a1,$t1,10
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
    lw $ra,0($sp)
    addiu $sp,$sp,4
    jr $ra
 

 .data
 .text
 delay:
    li $v0,reset_core_timer
    syscall
while_delay:
    li $v0,read_core_timer
    syscall
    mul $t2,$a0,20000
    bge $v0,$t2,endw_delay
    j while_delay    
endw_delay:
    jr $ra