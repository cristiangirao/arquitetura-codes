#################################################################################
# Exemplo de for 
# O exemplo armazena os valores 1 a 5 no array e depois imprime todas as posi��es do array
#################################################################################

.data 
	space:	.byte ' ' 	
	myArray: 
		.align 2
		.space 20
		
.text
		move $t0, $zero			#inicializo o �ndice do array com 0
		move $t1, $zero			#cont�m o valor do iterador que vai percorrer o array
		li   $t2, 20			#o tamanho do array(20 bytes)
	
	Loop: 	
		beq $t0, $t2, stopLoop		#se o �ndice do array for igual a 20(tamanho de bytes do array), pula para stopLoop
		sw $t1, myArray($t0)		#carrega o array na posi��o[i] em $t1
		
		addi $t0, $t0, 4		#incrementa o �ndice do array
		addi $t1, $t1, 1		#incrementa o contador i
		j Loop	
		
	stopLoop:
		move $t0, $zero			#reinicializo o �ndice do array com 0
		
	printArray:
		beq $t0, $t2, stopPrint
		li $v0, 1
		lw $a0, myArray($t0)
		syscall
	
		li $v0, 4			#carrega a instru��o de printar strings
		la $a0, space			#printa o espa�o em branco antes de chamar novamente o contador
		syscall
		
		addi $t0, $t0, 4		#incremeta o �ndice do array em 4 bytes(1 posi��o)
		j printArray
		
	stopPrint:	