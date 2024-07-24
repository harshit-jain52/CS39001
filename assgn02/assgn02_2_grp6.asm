.data
array:      .word 10, 3, 15, 7, 8, 23, 74, 1, 5, 99
length:     .word 10                                    # Length of the array
smallest_k: .word 0                                     # To store k-th smallest value
largest_k:  .word 0                                     # To store k-th largest value
num_msg: .asciiz "Enter a number k <= n: "
kth_smallest: .asciiz "Kth Smallest: "
kth_largest: .asciiz "\nKth Largest: "

.text

main:
    la      $t0,            array                       # Load address of array
    lw      $t1,            length                      # Load length of array

    la      $a0,            num_msg                     # Load address of entering number msg in $a0
    li      $v0,            4                           # Load print string syscall command
    syscall 

    li      $v0,            5                           # Load read int syscall command
    syscall 
    move    $t2,            $v0                         # store k in $t0

    jal     bubble_sort                                 # Sort the array


# Find k-th smallest (index k-1 in 0-based index)
    sub     $t3,            $t2,            1
    sll     $t4,            $t3,            2           # Calculate offset (index * 4)
    add     $t4,            $t4,            $t0         # Calculate address of k-th smallest element
    lw      $t5,            0($t4)                      # Load k-th smallest element
    la      $t6,            smallest_k                  # Address of smallest_k
    sw      $t5,            0($t6)                      # Store k-th smallest element

    la      $a0,            kth_smallest
    li      $v0,            4                           # Load print string syscall command
    syscall 

    li      $v0,            1                           # Load print int syscall command
    move    $a0,            $t5
    syscall 


# Find k-th largest (index length-k in 0-based index)
    lw      $t1,            length
    sub     $t3,            $t1,            $t2
    sll     $t4,            $t3,            2           # Calculate offset (index * 4)
    add     $t4,            $t4,            $t0         # Calculate address of k-th largest element
    lw      $t5,            0($t4)                      # Load k-th largest element
    la      $t6,            largest_k                   # Address of largest_k
    sw      $t5,            0($t6)                      # Store k-th largest element

    la      $a0,            kth_largest
    li      $v0,            4                           # Load print string syscall command
    syscall 

    li      $v0,            1                           # Load print int syscall command
    move    $a0,            $t5
    syscall 


exit:
    li      $v0,            10
    syscall 


bubble_sort:
    sub     $t1,            $t1,            1           # length - 1


outerLoop:
    move    $t3,            $zero                       # swapped flag to 0
    li      $t4,            0                           # Initialize inner loop index to 0


innerLoop:
    sll     $t5,            $t4,            2           # Calculate offset (index * 4)
    add     $t6,            $t0,            $t5         # Calculate address of current element
    lw      $t7,            0($t6)                      # Load current element
    lw      $t8,            4($t6)                      # Load next element
    ble     $t7,            $t8,            skipSwap


# Swap array[i] and array[i+1]
    sw      $t8,            0($t6)
    sw      $t7,            4($t6)
    li      $t3,            1                           # Set swapped flag to 1


skipSwap:
    addi    $t4,            $t4,            1
    bne     $t4,            $t1,            innerLoop


    beq     $t3,            $zero,          end_sort    # If no elements were swapped, end sorting
    sub     $t1,            $t1,            1
    bgez    $t1,            outerLoop


end_sort:
    jr      $ra