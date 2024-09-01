.globl main

.data
      sum: .space 4

.text
main:
	# Tests simple looping behaviour
	li t0, 101 #if left at 100 it'll branch at 100 instead of adding 100
	li t1, 0
	la t2, sum 
loop:
	beq t1, t0, success
	add t3, t3, t1 #t2 or sum equal previous sum plus current number
	addi t1, t1, 1 #i++
	sw t3, 0(t2)
	j loop
failure:
	li a0, 0
	li a7, 93 
	ecall
success:
	lw a0, 0(t2) #print t2
	li a7, 1 
	ecall
	
	li a7, 10 #got rid of the dropped off bottom by issuing an explict exit
	ecall
	