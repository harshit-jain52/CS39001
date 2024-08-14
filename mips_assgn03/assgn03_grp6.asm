# Take newline-separated input (press ENTER after entering each integer)

.data   
array:      .space  40                              # array of 10 integers
size:       .word   10
input_str:  .asciiz "\nInput Array (size=10): "
output_str: .asciiz "\nOutput Max-Heap: "
space:      .asciiz " "

.text   

main:       
    la      $a0,        input_str
    li      $v0,        4
    syscall 

    li      $v0,        4

    la      $s0,        array
    lw      $s2,        size
    li      $t0,        0

while:      
    bge     $t0,        $s2,        end_while
    li      $v0,        5
    syscall 
    sw      $v0,        0($s0)

    addi    $s0,        $s0,        4
    addi    $t0,        $t0,        1
    j       while

end_while:  

create_max_heap:

    la      $s0,        array
    li      $t2,        2
    div     $s2,        $t2
    mflo    $t2
    addi    $t3,        $t2,        -1              # startIdx = (n/2) - 1

heaploop:   
    blt     $t3,        0,          printheap
    move    $a0,        $t3
    jal     heapify
    addi    $t3,        $t3,        -1
    j       heaploop

heapify:    
    addi    $sp,        $sp,        -4              # allocate stack space
    sw      $ra,        ($sp)                       # store previous PC

    move    $s4,        $a0                         # largest = i
    mul     $t5,        $a0,        2
    addi    $t6,        $t5,        1               # l = 2*i+1
    addi    $t7,        $t5,        2               # r = 2*i+2

    bge     $t6,        $s2,        skip_cond1      # l > n

    sll     $t5,        $t6,        2
    add     $t0,        $s0,        $t5
    lw      $t0,        0($t0)

    sll     $t5,        $s4,        2
    add     $t1,        $s0,        $t5
    lw      $t1,        0($t1)

    ble     $t0,        $t1,        skip_cond1      # A[l] < A[largest]

    move    $s4,        $t6                         # largest = l

skip_cond1: 

    bge     $t7,        $s2,        skip_cond2      # r>n

    sll     $t5,        $t7,        2
    add     $t0,        $s0,        $t5
    lw      $t0,        0($t0)

    sll     $t5,        $s4,        2
    add     $t1,        $s0,        $t5
    lw      $t1,        0($t1)

    ble     $t0,        $t1,        skip_cond2      # A[r] < A[largest]

    move    $s4,        $t7                         # largest  = r

skip_cond2: 

    beq     $s4,        $a0,        skipSwap        # if largest = i, don't swap

swap:                                               # swap A[i],A[largest]
    sll     $t5,        $s4,        2
    sll     $t6,        $a0,        2
    add     $t5,        $s0,        $t5
    add     $t6,        $s0,        $t6
    lw      $t7,        0($t5)
    lw      $t8,        0($t6)
    sw      $t7,        0($t6)
    sw      $t8,        0($t5)

    move    $a0,        $s4
    jal     heapify                                 # recursive call

skipSwap:   
    lw      $ra,        ($sp)                       # restore the PC
    addi    $sp,        $sp,        4
    jr      $ra

printheap:  
    la      $a0,        output_str
    li      $v0,        4
    syscall 

    la      $s0,        array
    li      $t0,        0

while_heap: 
    bge     $t0,        $s2,        end_while_heap
    li      $v0,        1

    lw      $a0,        0($s0)
    syscall 

    la      $a0,        space
    li      $v0,        4
    syscall 

    addi    $s0,        $s0,        4
    addi    $t0,        $t0,        1
    j       while_heap

end_while_heap:

exit:       
    li      $v0,        10
    syscall 
