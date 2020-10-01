.data
argument: .word 7 # Number of pascal 
str1: .string " "
str2: .string "\n"

.text

main:
    addi s0, zero, 6
    addi s1, zero, -1
loop1:
	la a0, str2
    li a7, 4
    ecall
	addi s2,zero,-1
	addi s1,s1,1
	beq s1,s0,exit
	bne s1,s0,loop2
loop2:
	addi s2,s2,1
	mv a0,s1
	mv a1,s2
	jal pascal
print:
	mv a0, t1
    li a7, 1
    ecall
	addi t1,zero,0
	la a0, str1
    li a7, 4
    ecall
	

	beq s2,s1,loop1
	bne s2,s1,loop2

pascal:

	beq a0,a1,return1   #m==n
    beq zero,a1,return1  #m==0    
    addi sp, sp, -12
    sw ra  0(sp)	 #save $ra into stack
    sw a0  4(sp)   #save n into stack
	sw a1  8(sp)   #save m into stack  

	addi a0,a0,-1     #n-1
	jal pascal			#pascal(n-1,m)
	addi a1,a1,-1     #m-1
	jal pascal 			  #pascal(n-1,m-1)
	
	lw ra 0(sp)           
	lw a0 4(sp)
	lw a1 8(sp)   
    addi sp, sp, 12
    jr ra

return1:
	addi t1,t1, 1
	jr ra
exit:



