.data
	message: .asciiz "Calculate Factorial"
	ask: 	.asciiz  "\nEnter a number: "
	response: .asciiz	"\n The factorial is "
	end: .asciiz  "\nEND"
	num: 	.word 	0
	ans:	.word 	0
	
	


.text
	.globl MAIN
	MAIN:
		li $v0, 4
		la $a0, message
		syscall 
		
		li $v0, 4
		la $a0, ask
		syscall 
		
		li $v0, 5
		syscall 
		sw $v0, num
		
		lw $a0, num
		jal FACT
		sw $v0,ans
		
		li $v0, 4
		la $a0, response
		syscall 

		li $v0, 1
		lw $a0, ans
		syscall 
		
		li $v0, 4
		la $a0, end
		syscall 
		
		li $v0, 10
		syscall 



	.globl FACT
	FACT:
		addu $sp, $sp, -8
		sw $ra,($sp)
		sw $s0, 4($sp)
		
		#base case
		li $v0, 1
		beq $a0, 0, fin
		
		move $s0, $a0
		sub $a0, $a0, $v0
		jal FACT
		
		mul $v0, $s0, $v0
		
		fin:
			lw $ra, ($sp)
			lw $s0, 4($sp)
			addu $sp, $sp, 8
			jr $ra
	
