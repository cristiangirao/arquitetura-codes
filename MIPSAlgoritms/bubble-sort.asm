#####################################################################
# Implementa��o do algoritmo Bubble Sort
# Primeiro eu alimento o array com os valores de 5 a 1(em ordem decrescente), depois ordeno o array e imprimo todas as posi��es
#####################################################################
.data
	msg1: 	.asciiz "\nArray Recebido: "	
	msg2: 	.asciiz "\nArray Ordenado: "	
	space:	.byte ' ' 	
	Array: 
		.align 2
		.space 20
		
.text
		move $t0, $zero				#inicializo o �ndice do array com 0
		li   $t1, 5				#cont�m o valor do iterador que vai percorrer o array
		li   $t2, 20				#o tamanho do array(20 bytes)
		move $t3, $zero				#vari�vel auxiliar do loop
		move $t4, $zero				#vari�vel j auxiliar do loop
		move $t5, $zero				#vari�vel para armazenar o valor da vari�vel auxiliar no forInside
		move $t6, $zero				#vari�vel para armazenar o valor de j+1 no forInside
		move $t7, $zero				#vari�vel para armazenar o valor de array[j-1] no forInside
		li   $t8, 16				#vari�vel para armazenar o valor de do tamanho do array - 1 posi��o
		move $t9, $zero				#vari�vel para armazenar o valor de de array[j] no forInside
		
	Loop: 	
		beq $t0, $t2, stopLoop			#se o iterador for igual 0, pula para stopLoop
		sw  $t1, Array($t0)
		
		addi $t0, $t0, 4			#incrementa em 4 o indice do array
		sub  $t1, $t1, 1			#decrementa em 1 o iterador
		j Loop	
		
	stopLoop:
		move $t0, $zero				#reinicializo o �ndice do array com 0
		
		li $v0, 4				#carrega a instru�o de printar bytes
		la $a0, msg1				#carrega a instru�o de printar a mensagem do array recebido
		syscall				
		
	printArray:
		beq $t0, $t2, stopPrint			#se o contador for igual ao tamanho do array pula pata stopPrint
		li $v0, 1				#carrega a instru��o de printar inteiros
		lw $a0, Array($t0)			#carrega o valor a ser printado 
		syscall
	
		li $v0, 4				#carrega a instru�o de printar bytes
		la $a0, space				#carrega a instru�o de printar o espa�o em branco
		syscall				
		
		addi $t0, $t0, 4			#incrementa em 4 o indice do array
		j printArray				#pula para o inicio da fun��o
		
	stopPrint:
		move $t0, $zero				#reinicializo o �ndice do array com 0
		move $t1, $zero				#reinicializo o �ndice do lopp com 0
		
	orderNumbers:
		bge $t0, $t2, stopOrderNumbers		#se o contador for maior ou igual ao tamanho do array pula para stopOrderNumbers
		lw $t3, Array($t0)			#aux = array[i]
		
		move $t4, $zero				#j = 0
		
		j forInside
		
	forInside: 
		beq  $t4, $t8, incrementFor		#se j for igual ao tamanho do array pula para incrementFor
		
		lw $t9, Array($t4)			#t9 = array[j]
		
		addi $t6, $t4, 4			#armazena j+1 em t6
		lw $t7, Array($t6)			#t7 = array[j+1]
		
		ble $t9, $t7, incrementForInside	#se array[j] for menor ou igual que array[j1] pula para incrementForInside
				
		#aux = array[j]								
		lw $t5, Array($t4)			#t5(aux) = array[j]
		
		#array[j] = array[j+1]
		sw $t7, Array($t4)			#array[j] = array[j+1]		
		
		#array[j + 1] = aux
		sw $t5, Array($t6)
		j incrementForInside
		
		
	incrementForInside:
		addi $t4, $t4, 4			#j += 1
		j forInside
		
	incrementFor:
		addi $t0, $t0, 4			#incrementa em 4 o indice do array
		addi $t1, $t1, 1			#incrementa em 1 o indice do loop
		j orderNumbers				#pula para o inicio da fun��o	

		
	stopOrderNumbers:		
		move $t0, $zero				#reinicializo o �ndice do array com 0
		li $v0, 4				#carrega a instru��o de printar bytes
		la $a0, msg2				#carrega a instru��o de printar oa mensagem de array ordenado
		syscall						
		
		j printOrderedArray
		
	printOrderedArray:
		bge $t0, $t2, stopPrintOrderedArray	#se o contador for igual ao tamanho do array pula para stopPrintOrderedArray
		li $v0, 1				#carrega a instru��o de printar inteiros
		lw $a0, Array($t0)			#carrega o valor a ser printado 
		syscall
	
		li $v0, 4				#carrega a instru��o de printar bytes
		la $a0, space				#carrega a instru��o de printar o espa�o em branco
		syscall					
		
		addi $t0, $t0, 4			#incrementa em 4 o indice do array
		j printOrderedArray			#pula para o inicio da fun��o
		
	stopPrintOrderedArray:
		move $t0, $zero				#reinicializo o �ndice do array com 0
		move $t1, $zero				#reinicializo o �ndice do lopp com 0	 
