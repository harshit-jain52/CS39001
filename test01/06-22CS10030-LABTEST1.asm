# Descriptive constants for syscalls
int_out_sys=1
str_out_sys=4
int_in_sys=5
exit_sys=10

# Parts of strings to output
.data
prompt: .asciiz "Enter two numbers: "
alert: .asciiz "Invalid Input: Integers must be positive"
the_gcd_of: .asciiz "The GCD of "
and_space: .asciiz " and "
is_space: .asciiz " is "
the_gcd_value_is: .asciiz "\nThe GCD value is"
not_space: .asciiz " not"
a_prime: .asciiz " a prime"
end: .asciiz "\n--End of program--\n"

.text
# main()
main:
# Input two integers (ENTER separated)
    li $v0, str_out_sys
    la $a0, prompt
    syscall

    li $v0, int_in_sys
    syscall
    move $s0, $v0 # Num1

    li $v0, int_in_sys
    syscall
    move $s1, $v0 # Num2

    # If input is non-positive
    blez $s0, invalid_input
    blez $s1, invalid_input
    
    j part1

invalid_input:
    li $v0, str_out_sys
    la $a0, alert
    syscall
    j exit

part1:
# Find GCD of Num1 and Num2
    move $a0, $s0
    move $a1, $s1
    jal gcd

    move $s2, $v0

output1:
# Output in the form given in sample output
    li $v0, str_out_sys
    la $a0, the_gcd_of
    syscall

    li $v0, int_out_sys
    move $a0, $s0
    syscall

    li $v0, str_out_sys
    la $a0, and_space
    syscall

    li $v0, int_out_sys
    move $a0, $s1
    syscall

    li $v0, str_out_sys
    la $a0, is_space
    syscall

    li $v0, int_out_sys
    move $a0, $s2
    syscall

part2:
# Check whether GCD is prime or not
    move $a0, $s2
    jal isPrime

    move $s3, $v0

output2:
# Output in the form given in sample output
output2_1:
    li $v0, str_out_sys
    la $a0, the_gcd_value_is
    syscall

    bnez $s3, output2_2

    # Output "not" if gcd is not a prime
    li $v0, str_out_sys
    la $a0, not_space
    syscall

output2_2:
    li $v0, str_out_sys
    la $a0, a_prime
    syscall

# Terminate the program
exit:
    li $v0, str_out_sys
    la $a0, end
    syscall

    li $v0, exit_sys
    syscall

# int gcd(int a0, int a1)
gcd:
    move $t0, $a0
    move $t1, $a1

    bge $t1, $t0, skipSwap

    # Swap to ensure t0 is smaller of the two
    move $t2, $t0
    move $t0, $t1
    move $t1, $t2

skipSwap:
    li $v0, 1
    li $t2, 1

whileGCD:   # Check for gcd till t0
    div $t0, $t2
    mfhi $t4 # t4=t0%t2
    div $t1, $t2
    mfhi $t5 # t5=t1%t2

    # Divisibility check
    bnez $t4, notGCD
    bnez $t5, notGCD

    move $v0, $t2
notGCD:
    addi $t2, $t2,1
    ble $t2, $t0, whileGCD

returnGCD:
    jr $ra

# bool isPrime(int a0)
isPrime:
    li $v0, 1
    beq $a0, $v0, notPrime  # 1 is not a prime
    li $t0, 2

whilePrime: # Check for factor till sqrt(a0)
    mul $t1, $t0, $t0
    bgt $t1, $a0, returnIsPrime
    
    div $a0, $t0
    mfhi $t1 # t1=a0%t0

    beqz, $t1, notPrime
    addi $t0, $t0, 1
    j whilePrime

notPrime:
    li $v0,0

returnIsPrime:
    jr $ra