.data
prompt:     .asciiz "\nInput : "
out_prompt: .asciiz "\nOutput: "
userInput:  .space  100

.text

main:
    la      $a0,        prompt
    li      $v0,        4
    syscall

    li      $v0,        8
    la      $a0,        userInput       # Take input string
    syscall

    li      $s0,        0

while_read:
    lb      $t0,        0($a0)
    beqz    $t0,        end_read

    addi    $sp,        $sp,        -1  # store string in stack
    sb      $t0,        0($sp)
    addi    $s0,        $s0,        1
    addi    $a0,        $a0,        1
    j       while_read

end_read:
    addi    $sp,        $sp,        1
    addi    $s0,        $s0,        -1

    la      $a0,        out_prompt
    li      $v0,        4
    syscall

while_out:                              # output the reversed string using stack
    beqz    $s0,        end_out
    li      $v0,        11
    lb      $a0,        0($sp)          # stack top
    syscall

    addi    $sp,        $sp,        1
    addi    $s0,        $s0,        -1

    j       while_out

end_out:

exit:
    li      $v0,        10
    syscall
