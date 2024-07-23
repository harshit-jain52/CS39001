# Takes in a positive integer - num and prints out its prime factors
# Registers Used :
# $t0 for storing num
# $t1 for storing possible factor k
# $t2 for storing num%k

.text

main:
    la      $a0,                        num_msg                         # loads address of entering number msg in $a0
    li      $v0,                        4                               # loads print string syscall command
    syscall 

    li      $v0,                        5                               # loads read int syscall command
    syscall 
    move    $t0,                        $v0                             # store the value in $t0

    blt     $t0,                        1,                  invalid     # check if num is positive
    beq     $t0,                        1,                  one         # check if num is 1

    li      $t1,                        2                               # initialize k with 2

    la      $a0,                        msg                             # loads address of msg in $a0
    li      $v0,                        4                               # loads print string syscall command
    syscall 

primeFactorsCalculation:                                                # loop for iterating k from 2 to num
    bgt     $t1,                        $t0,                exit
    rem     $t2,                        $t0,                $t1         # evaluate remainder of num%k
    beqz    $t2,                        printPrimeFactor                # check divibility of num by k
    addi    $t1,                        $t1,                1           # increment k
    b       primeFactorsCalculation

printPrimeFactor:
    li      $v0,                        1                               # loads print int syscall command
    move    $a0,                        $t1                             # loads value of prime factor in $a0
    div     $t0,                        $t1
    mflo    $t0                                                         # num  = num/k
    syscall 

    la      $a0,                        space                           # loads address of space string in $a0
    li      $v0,                        4                               # loads print string syscall command
    syscall 

    b       primeFactorsCalculation

invalid:
    la      $a0,                        invalid_input                   # loads address of invalid input warning in $a0
    li      $v0,                        4                               # loads print string syscall command
    syscall 
    b       exit

one:
    la      $a0,                        one_msg                         # loads address of one_msg in $a0
    li      $v0,                        4                               # loads print string syscall command
    syscall 
exit:
    li      $v0,                        10                              # load exit command into $v0
    syscall 

.data
num_msg: .asciiz "Enter a positive Integer\n"
one_msg: .asciiz "1 has no prime factors"
invalid_input: .asciiz "Invalid Input\n"
msg: .asciiz "Prime factor(s): \n"
space: .asciiz " "