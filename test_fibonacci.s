sets:
	addi sp, sp, -4
    sw ra, 0(sp)
    addi t1, zero, 0x1
    jal ra, fibonacci_seq
    lw ra, 0(sp)
    addi sp, sp, 4
    mv a0, t4
    jr ra
  
fibonacci_seq:
	addi sp, sp, -12
    sw ra, 8(sp)
    sw a0, 4(sp)
    beq a0, zero, Zero
    beq a0, t1, One
    addi a0, a0, -1
    jal ra, fibonacci_seq
    sw, t4, 0(sp)
    lw, a0, 4(sp)
    addi a0, a0, -2
    jal ra, fibonacci_seq
    lw t3, 0(sp)
    add t4, t4, t3
    lw ra, 8(sp)
    addi sp, sp, 12
    jalr ra
    
Zero:
	addi sp, sp, 12
    jr ra
    
One:
	addi t4, zero, 0x1
    jr ra

main:
	li a0, 0x14
    call sets
    mv s0, a0
    li a0, 10
    ecall
    j exit
    
exit:
	ebreak
