#####################################################################
# Implementação do algoritmo Insertion Sort
# Primeiro eu alimento o array com os valores de 5 a 1(em ordem decrescente), depois ordeno o array e imprimo todas as posições
#####################################################################

.data 
	msg1: 	.asciiz "\nArray Recebido: "	
	msg2: 	.asciiz "\nArray Ordenado: "	
	space:	.byte ' ' 	
	Array: 
		.align 2
		.space 20
		
.text
		move $t0, $zero				#inicializo o índice do array com 0
		li   $t1, 5				#contém o valor do iterador que vai percorrer o array
		li   $t2, 20				#o tamanho do array(20 bytes)
		move $t3, $zero				#variável auxiliar do loop
		move $t4, $zero				#variável j auxiliar do loop
		move $t5, $zero				#variável para armazenar o valor 0
		move $t6, $zero				#variável para armazenar o valor de j-1 no While
		move $t7, $zero				#variável para armazenar o valor de array[j-1] no While
		
	Loop: 	
		beq $t0, $t2, stopLoop			#se o iterador for igual 0, pula para stopLoop
		sw  $t1, Array($t0)
		
		addi $t0, $t0, 4			#incrementa em 4 o indice do array
		sub  $t1, $t1, 1			#decrementa em 1 o iterador
		j Loop	
		
	stopLoop:
		move $t0, $zero				#reinicializo o índice do array com 0
		
		li $v0, 4				#carrega a instruão de printar bytes
		la $a0, msg1				#carrega a instruão de printar a mensagem do array recebido
		syscall				
		
	printArray:
		beq $t0, $t2, stopPrint			#se o contador for igual ao tamanho do array pula pata stopPrint
		li $v0, 1				#carrega a instrução de printar inteiros
		lw $a0, Array($t0)			#carrega o valor a ser printado 
		syscall
	
		li $v0, 4				#carrega a instruão de printar bytes
		la $a0, space				#carrega a instruão de printar o espaço em branco
		syscall				
		
		addi $t0, $t0, 4			#incrementa em 4 o indice do array
		j printArray				#pula para o inicio da função
		
	stopPrint:
		move $t0, $zero				#reinicializo o índice do array com 0
		move $t1, $zero				#reinicializo o índice do lopp com 0
		
	orderNumbers:
		beq $t0, $t2, stopOrderNumbers		#se o contador for igual ao tamanho do array pula para stopOrderNumbers
		lw $t3, Array($t0)			#aux = array[i]
		addi $t4, $t0, 0			#j = i
		
		j while
		
	while: 
		ble $t4, $zero, endOrderNumbers		#se j for menor ou igual a zero pula para endOrderNumbers
		
		sub $t6, $t4, 4				#armazena j-1 em t6
		lw $t7, Array($t6)			#t7 = array[j-1]
		blt $t7, $t3, endOrderNumbers		#se array[j-1] for menor que aux, pula para endOrderNumbers
							
							#numbers[j] = numbers[j - 1];
							
		sw $t7, Array($t4)			#array[j] = array[j-1]		
		sub $t4, $t4, 4				#j -= 1
		
		j while
		
	endOrderNumbers:
		sw $t3, Array($t4)			#array[j] = aux
		
		addi $t0, $t0, 4			#incrementa em 4 o indice do array
		addi $t1, $t1, 1			#incrementa em 1 o indice do loop
		j orderNumbers				#pula para o inicio da função	

		
	stopOrderNumbers:		
		move $t0, $zero				#reinicializo o índice do array com 0
		li $v0, 4				#carrega a instrução de printar bytes
		la $a0, msg2				#carrega a instrução de printar oa mensagem de array ordenado
		syscall						
		
	printOrderedArray:
		beq $t0, $t2, stopPrintOrderedArray	#se o contador for igual ao tamanho do array pula para stopPrintOrderedArray
		li $v0, 1				#carrega a instrução de printar inteiros
		lw $a0, Array($t0)			#carrega o valor a ser printado 
		syscall
	
		li $v0, 4				#carrega a instrução de printar bytes
		la $a0, space				#carrega a instrução de printar o espaço em branco
		syscall					
		
		addi $t0, $t0, 4			#incrementa em 4 o indice do array
		j printOrderedArray			#pula para o inicio da função
		
	stopPrintOrderedArray:
		move $t0, $zero				#reinicializo o índice do array com 0
		move $t1, $zero				#reinicializo o índice do lopp com 0	
		
