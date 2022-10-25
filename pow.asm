.data
	prompt1: .asciiz "Enter the number:\n"
	prompt2: .asciiz "Enter the exponent n:\n"
	response: .asciiz "Power(x,n) is:\n"

.text
main:
	la $a0 prompt1
	li $v0 4
	syscall

	li $v0 5
	syscall
	move $t0 $v0

	la $a0 prompt2
	li $v0 4
	syscall

	li $v0 5
	syscall
	move $t1 $v0

	li $s0 0
	li $s1 1

	loop:
		slt $t2 $s0 $t1
		beq $t2 0 print
		mult $s1 $t0
		mflo $s1
		addi $s0 1
		j loop
	
	print:
		la $a0 response
		li $v0 4
		syscall

		move $a0 $s1
		li $v0 1
		syscall




exit:
	li $v0 10
	syscall
