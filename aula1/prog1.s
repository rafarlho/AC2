.data
str1 :  .asciiz "AC2 - Aulas práticas\n"
.equ print_str,8
.text
.globl main
main:
    la $a0,str1 
    li $v0,print_str
    syscall
    li $v0,0
    jr $ra