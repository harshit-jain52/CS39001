.data   

length:     .word   10                              # Length of the array
array:      .word   7, 8, 9, 1, 4, 10, 5, 6, 7, 2   # The input array
dp:         .word   1, 1, 1, 1, 1, 1, 1, 1, 1, 1    # Array to store length of max lis till that index
parent:     .word   0, 1, 2, 3, 4, 5, 6, 7, 8, 9    # Array to store the parent indexes

.text   

main:       
    la      $s0,            array                   # Load address of array
    la      $s1,            dp                      # Load address of array
    la      $s2,            parent                  # Load address of array
    lw      $s3,            length                  # Load length of array

    jal     lis

exit:       
    li      $v0,            10
    syscall 

lis:        
    li      $t0,            1                       # Initialize outer loop index to 1

outerLoop:  
    beq     $t0,            $s3,        resultX
    sll     $t1,            $t0,        2           # Calculate offset (index * 4)
    add     $t2,            $s0,        $t1         # Calculate address of element
    add     $t3,            $s1,        $t1         # Calculate address of DP
    add     $t4,            $s2,        $t1         # Calculate address of parent
    li      $t5,            0

innerLoop:  

    beq     $t5,            $t0,        incrementi  # increment outer loop counter
    sll     $t1,            $t5,        2           # Calculate offset (index * 4)
    add     $t6,            $s0,        $t1         # Calculate address of current element
    add     $t7,            $s1,        $t1         # Calculate address of current DP

    lw      $s5,            0($t6)
    lw      $s6,            0($t2)

    beq     $s5,            $s6,        skipUpdate  # if current element >= outer loop element - skip
    bgt     $s5,            $s6,        skipUpdate  #

    lw      $s6,            0($t7)
    lw      $s7,            0($t3)

    addi    $s4,            $s6,        1           # new length of lis to compare

    beq     $s7,            $s4,        skipUpdate  # if current lis length is >= new length of lis, skip
    bgt     $s7,            $s4,        skipUpdate  #

    sw      $s4,            0($t3)
    sw      $t5,            0($t4)

skipUpdate: 

    addi    $t5,            $t5,        1
    b       innerLoop

incrementi: 
    addi    $t0,            $t0,        1
    b       outerLoop

resultX:    

    li      $t0,            0                       # counter
    li      $t1,            0                       # index of last element of max lis
    li      $t2,            1                       # length of max lis




maxloop:    

    beq     $t0,            $s3,        compute     # if whole sequence traversed, move to compute label
    sll     $t3,            $t0,        2           # Calculate offset (index * 4)
    add     $t4,            $s1,        $t3         # Calculate address of DP

    lw      $t5,            0($t4)                  # lis length upto current index

    blt     $t5,            $t2,        noupdate    # if lis length < max lis length, skip

    move    $t1,            $t0                     # t1 stores index of last element of max lis
    move    $t2,            $t5                     # t2 stores length of max lis

noupdate:   

    addi    $t0,            $t0,        1           # increment counter
    b       maxloop




compute:    
    move    $t0,            $t1                     # load index of last element of max lis to t0 

compute_seq:

    sll     $t3,            $t0,        2           # Calculate offset (index * 4)
    add     $t4,            $s2,        $t3         # Calculate address of parent
    lw      $t5,            0($t4)                  # index of parent

    li      $t7,            -1                      # store -1 in dp array as an indicator for element being part of longest lis

    add     $t6,            $s1,        $t3
    sw      $t7,            0($t6)

    beq     $t5,            $t0,        print       

    move    $t0,            $t5                     # index = parent of index
    b       compute_seq

print:      

    la      $a0,            length_lis
    li      $v0,            4                       # loads print string syscall command
    syscall 

    li      $v0,            1                       # loads print int syscall command
    move    $a0,            $t2
    syscall 

    li      $t0,            0

    la      $a0,            sequence
    li      $v0,            4                       # loads print string syscall command
    syscall 

    b       printloop

printloop:                                          # print all elements whose corresponding dp element is -1

    beq     $t0,            $s3,        exit

    sll     $t3,            $t0,        2           # Calculate offset (index * 4)
    add     $t4,            $s1,        $t3         # Calculate address of DP

    lw      $t5,            0($t4)

    bne     $t5,            -1,         noprinti

    add     $t6,            $s0,        $t3
    lw      $t7,            0($t6)

    li      $v0,            1                       # loads print int syscall command
    move    $a0,            $t7
    syscall 

    la      $a0,            space
    li      $v0,            4                       # loads print string syscall command
    syscall 

noprinti:   

    addi    $t0,            $t0,        1           # increment counter
    b       printloop

.data   

length_lis: .asciiz "Length of LIS: "
sequence:   .asciiz "\nSequence: "
space:      .asciiz " "