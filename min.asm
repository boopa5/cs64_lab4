.data
	prompt: .asciiz "Enter the next number:\n"
	response: .asciiz "Minimum: "
.text
main:
	la $a0 prompt
	li $v0 4
	syscall

	li $v0 5
	syscall
	move $t0 $v0

	la $a0 prompt
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	move $t1 $v0

	la $a0 prompt
	li $v0 4
	syscall

	li $v0 5
	syscall
	move $t2 $v0

	la $a0 response
	li $v0 4
	syscall

	slt $t3 $t0 $t1
	beq $t3 1 smallr
	
	slt $t3 $t1 $t2
	beq $t3 1 printo

	j printt

	smallr:
		slt $t3 $t0 $t2
		beq $t3 1 printz
		j printt

	printz:
		move $a0 $t0
		li $v0 1
		syscall
		j exit
	printo:
		move $a0 $t1
		li $v0 1
		syscall
		j exit
	printt:
		move $a0 $t2
		li $v0 1
		syscall
		j exit

exit:
	li $v0 10
	syscall
