.data
row_prompt: .asciiz "\nNumber of rows : "
col_prompt: .asciiz "\nNumber of columns: "
a_prompt:   .asciiz "\nEnter a : "
b_prompt:   .asciiz "\nEnter b: "
space:      .asciiz " "
newline:    .asciiz "\n"
matrix:     .asciiz "\nMatrix:\n"
transpose:  .asciiz "\nTranspose Matrix:\n"

.text

main:
    la      $a0,                row_prompt
    li      $v0,                4
    syscall

    li      $v0,                5
    syscall

    move    $s0,                $v0                         # number of rows

    la      $a0,                col_prompt
    li      $v0,                4
    syscall

    li      $v0,                5
    syscall

    move    $s1,                $v0                         # number of columns

    la      $a0,                a_prompt
    li      $v0,                4
    syscall

    li      $v0,                5
    syscall

    li      $t0,                -1
    move    $s2,                $v0                         # a
    mul     $s2,                $s2,        $t0             # -a

    la      $a0,                b_prompt
    li      $v0,                4
    syscall

    li      $v0,                5
    syscall

    move    $s3,                $v0                         # b
    mul     $s3,                $s3,        $t0             # - b

    mul     $t0,                $s1,        $s0             # t0 stores n * m
    li      $t1,                0                           # t1 is the counter

    li      $t2,                0                           # i
    li      $t3,                0                           # j

    move    $fp,                $sp

populate_matrix:
    beq     $t0,                $t1,        end_pop

    move    $a0,                $t2
    move    $a1,                $t3

    jal     calculate

    addi    $sp,                $sp,        -4
    sw      $v0,                0($sp)

    addi    $t1,                $t1,        1

    addi    $t3,                $t3,        1
    beq     $t3,                $s1,        increment_i
    b       populate_matrix

increment_i:
    addi    $t2,                $t2,        1
    li      $t3,                0
    b       populate_matrix

end_pop:

print_mat:                                                  # Print Matrix

    la      $a0,                matrix
    li      $v0,                4
    syscall

    addi    $fp,                $fp,        -4
    li      $t0,                0                           # i
    li      $t1,                0                           # j

while_i:

    beq     $t0,                $s0,        end_while_i

while_j:

    beq     $t1,                $s1,        end_while_j

    mul     $t2,                $t0,        $s1
    add     $t2,                $t2,        $t1             # i*m + j

    sll     $t2,                $t2,        2               # offset

    sub     $t3,                $fp,        $t2
    lw      $a0,                0($t3)                      # corresponding element
    li      $v0,                1
    syscall

    la      $a0,                space
    li      $v0,                4
    syscall

    addi    $t1,                $t1,        1
    b       while_j

end_while_j:

    la      $a0,                newline
    li      $v0,                4
    syscall

    addi    $t0,                $t0,        1
    li      $t1,                0

    b       while_i

end_while_i:

print_tra:                                                  # Transpose

    la      $a0,                transpose
    li      $v0,                4
    syscall

    li      $t0,                0                           # i
    li      $t1,                0                           # j

while_i_tra:

    beq     $t0,                $s1,        end_while_i_tra

while_j_tra:

    beq     $t1,                $s0,        end_while_j_tra

    mul     $t2,                $t1,        $s1
    add     $t2,                $t2,        $t0             # j*m + i

    sll     $t2,                $t2,        2               # offset

    sub     $t3,                $fp,        $t2
    lw      $a0,                0($t3)                      # corresponding element
    li      $v0,                1
    syscall

    la      $a0,                space
    li      $v0,                4
    syscall

    addi    $t1,                $t1,        1
    b       while_j_tra

end_while_j_tra:

    la      $a0,                newline
    li      $v0,                4
    syscall

    addi    $t0,                $t0,        1
    li      $t1,                0

    b       while_i_tra

end_while_i_tra:

exit:
    li      $v0,                10
    syscall

calculate:                                                  # function to calculate the entry of the 2D matrix
    move    $t5,                $ra                         # current $ra
    move    $t6,                $a0                         # i
    move    $t7,                $a1                         # j

    move    $a0,                $s2
    move    $a1,                $t6
    jal     exponent

    move    $v1,                $v0

    move    $a0,                $s3
    move    $a1,                $t7
    jal     exponent

    mul     $v1,                $v1,        $v0
    move    $v0,                $v1
    jr      $t5

exponent:                                                   # function to calculate a0 ^ a1
    li      $v0,                1
    li      $t8,                0

while_exp:
    bge     $t8,                $a1,        end_exp
    mul     $v0,                $v0,        $a0
    addi    $t8,                $t8,        1
    j       while_exp

end_exp:
    jr      $ra