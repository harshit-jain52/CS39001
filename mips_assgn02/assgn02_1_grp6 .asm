.text

main:
    la      $a0,    num_msg                     # loads address of entering number msg in $a0
    li      $v0,    4                           # loads print string syscall command
    syscall 

    li      $v0,    5                           # loads read int syscall command
    syscall 
    move    $t0,    $v0                         # store the value in $t0

    add     $t4,    $zero,      $zero

loop:

    srl     $t1,    $t0,        8
    sll     $t2,    $t0,        24
    srl     $t2,    $t2,        24

    add     $t4,    $t4,        $t1
    add     $t0,    $t1,        $t2

    bgt     $t0,    255,        loop

    bne     $t0,    255,        print_ans


handle:
    li      $t0,    0
    add     $t4,    $t4,        1

print_ans:
    la      $a0,    quotient
    li      $v0,    4                           # loads print string syscall command
    syscall 

    li      $v0,    1                           # loads print int syscall command
    move    $a0,    $t4
    syscall 

    la      $a0,    remainder
    li      $v0,    4                           # loads print string syscall command
    syscall 

    li      $v0,    1
    move    $a0,    $t0
    syscall 

exit:
    li      $v0,    10                          # load exit command into $v0
    syscall 

.data
num_msg: .asciiz "Enter a positive Integer: "
invalid_input: .asciiz "Invalid Input\n"
quotient: .asciiz "Quotient: "
remainder: .asciiz "\nRemainder: "
space: .asciiz " "