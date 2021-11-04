init:

	li a0, 0x3
    addi t1, t1, 0x1          #t1 gets the value of 1
    jal ra, fibonacci_seq     # now that we have the return address we will jumop to function
    mv a0, t4                 # move the value of t4 into a0
    ebreak                    # end it just to make sure
  
fibonacci_seq:
	addi sp, sp, -12            #set up the space for stack pointer 
    sw ra, 8(sp)              #store the word in the stack pointer at position 8 bit
    sw a0, 4(sp)              #store a0 in the stack pointer at position 4
    beq a0, zero, Zero        #branch for equality and check if the value of a0 is 0
    beq a0, t1, One           #branch for equality and check if the value of a0 is equivalent to 1
    addi a0, a0, -1           # subtract by one
    jal ra, fibonacci_seq     #jump back to function
    sw, t4, 0(sp)
    lw, a0, 4(sp)
    addi a0, a0, -2           #subtract by 2
    jal ra, fibonacci_seq     #jump back to function
    lw t3, 0(sp)
    add t4, t4, t3            #add n-1 + n-2
    lw ra, 8(sp)
    addi sp, sp, 12
    jalr ra
    
Zero:
	addi sp, sp, 12
    jr ra
    
One:
	addi t4, zero, 0x1
    jr ra
