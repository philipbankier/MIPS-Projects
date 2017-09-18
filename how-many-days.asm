.data
	YEARS: .word 2
	DAYS: .word 0
	



.text
	.globl main
	main:
		lw $t0, YEARS
		lw $t1, DAYS 
		
		
		bnez $t0, loop
	
		j fin 
	 
	loop: 	beqz  $t0, fin
		add $t1, $t1, 365
		sub $t0, $t0, 1
		j loop
		
	fin:	
		li $v0, 10
		syscall 
	
