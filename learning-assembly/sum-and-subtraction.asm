#################################################################################
# Exemplo de soma e subtração
# Replicação da função f = (g+h) - (i+j)
#################################################################################

.data 
	msgEnd: .asciiz "Valor de F: "
.text
	
	addi $s0, $zero, 5 #g = 5  -->somando 5 + 0
	addi $s1, $zero, 4 #h = 4  -->somando 4 + 0
	addi $s2, $zero, 3 #i = 3  -->somando 3 + 0
	addi $s3, $zero, 2 #j = 2  -->somando 2 + 0
	
	add $t1, $s0, $s1 #t1 recebe (s0 + s1)
	add $t2, $s2, $s3 #t2 recebe (s2 + s3)
	
	sub $t3, $t1, $t2 #t3 recebe (t1 - t2) = 4
	
	addi $v0, $0, 4   #chamada para imprimir string
	la   $a0, msgEnd
	syscall 
	
	addi $v0, $0, 1 #chamada para imprimir inteiro
	la  $a0, ($t3)
	syscall 
