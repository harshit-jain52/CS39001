    # Registers Used:
    # s0 -> Array of bits
    # s1 -> M
    # s2 -> d
    # s3 -> N
    # t2 -> length of binary representation of d

.data   
bits:       .space  128
input_m:    .asciiz "\nEnter M (Base): "
input_d:    .asciiz "Enter d (Exponent): "
input_n:    .asciiz "Enter N (Mod): "
output_bin: .asciiz "\nThe exponent in binary is: "
output_exp: .asciiz "\nThe exponentiation value (M^d) mod N is: "
space:      .asciiz " "

.text   

main:       
    la      $s0,                bits

    la      $a0,                input_m
    li      $v0,                4
    syscall 
    li      $v0,                5
    syscall 
    move    $s1,                $v0                                 # Input M

    la      $a0,                input_d
    li      $v0,                4
    syscall 
    li      $v0,                5
    syscall 
    move    $s2,                $v0                                 # Input d

    la      $a0,                input_n
    li      $v0,                4
    syscall 
    li      $v0,                5
    syscall 
    move    $s3,                $v0                                 # Input N

    move    $a0,                $s2
    jal     DecimalToBinary


printarray:                                                         # Print binary representation stored in 'bits' array
    la      $a0,                output_bin
    li      $v0,                4
    syscall 

    li      $t0,                0
    beqz    $s2,                print_zero                          # if d = 0

print_while:
    bge     $t0,                $t2,        end_print_while
    li      $v0,                1

    lw      $a0,                0($s0)
    syscall 

    la      $a0,                space
    li      $v0,                4
    syscall 

    addi    $s0,                $s0,        -4                      # Iterating from MSB to LSB
    addi    $t0,                $t0,        1
    j       print_while

print_zero: 
    li      $a0,                0
    li      $v0,                1
    syscall 

end_print_while:
    addi    $s0,                $s0,        4

printFinal: 
    la      $a0,                output_exp
    li      $v0,                4
    syscall 

    move    $a0,                $s1
    jal     ModExp
    move    $a0,                $v0
    li      $v0,                1
    syscall 

exit:       
    li      $v0,                10
    syscall 


Square:                                                             # Function to return the square of argument a0
    mul     $v0,                $a0,        $a0
    jr      $ra

Multiply:                                                           # Function to return the product of arguments a0 and a1
    mul     $v0,                $a0,        $a1
    jr      $ra

DecimalToBinary:                                                    # Function to store the binary representation of argument a0 in 'bits' array (s0)
    li      $t2,                0
    li      $t0,                2

while:      
    beqz    $a0,                end_while

    div     $a0,                $t0

    mflo    $a0                                                     # a0 = a0/2
    mfhi    $t1                                                     # current bit - 0 or 1

    sw      $t1,                0($s0)
    addi    $s0,                $s0,        4                       # Iterating from LSB to MSB
    addi    $t2,                $t2,        1

    b       while

end_while:  
    addi    $s0,                $s0,        -4
    jr      $ra

ModExp:                                                             # Function to calculate base (argument a0) to the power (in 'bits' array) mod s3
    addi    $sp,                $sp,        -4
    sw      $ra,                0($sp)                              # store current PC

    li      $v1,                1                                   # v1 -> final answer
    move    $t8,                $a0                                 # t8 -> powers of the base
    li      $t0,                0

while_exp:  
    bge     $t0,                $t2,        end_exp
    lw      $t3,                0($s0)

    bne     $t3,                1,          skip                    # if current bit is zero
    move    $a0,                $v1
    move    $a1,                $t8
    jal     Multiply                                                # v1 = v1*t8 mod N
    move    $v1,                $v0
    div     $v1,                $s3
    mfhi    $v1

skip:       
    move    $a0,                $t8
    jal     Square                                                  # t8 = t8*t8 mod N
    move    $t8,                $v0
    div     $t8,                $s3
    mfhi    $t8

    addi    $t0,                $t0,        1
    addi    $s0,                $s0,        4                       # Iterating from LSB to MSB

    b       while_exp

end_exp:    
    move    $v0,                $v1
    lw      $ra,                0($sp)                              # restore PC
    jr      $ra
