#################################################################################
# Exemplo de for que usa o decremento ao ivpes do incremento
# O exemplo armazena os valores 5 a 1 no array e depois imprime todas as posições do array
#################################################################################

.data 
	space:	.byte ' ' 	
	Array: 
		.align 2
		.space 20
		
.text
		move $t0, $zero			#inicializo o índice do array com 0
		li   $t1, 5			#contém o valor do iterador que vai percorrer o array
		li   $t2, 20			#o tamanho do array(20 bytes)
	
	Loop: 	
		beq $t0, $t2, stopLoop		#se o iterador for igual 0, pula para stopLoop
		sw  $t1, Array($t0)
		
		addi $t0, $t0, 4		#incrementa em 4 o indice do array
		sub  $t1, $t1, 1		#decrementa em 1 o iterador
		j Loop	
		
	stopLoop:
		move $t0, $zero			#reinicializo o índice do array com 0
		
	printArray:
		beq $t0, $t2, stopPrint		#se o contador for igual ao tamanho do array pula pata stopPrint
		li $v0, 1			#carrega a instrução de printar inteiros
		lw $a0, Array($t0)		#carrega o valor a ser printado 
		syscall
	
		li $v0, 4			#carrega a instruão de printar bytes
		la $a0, space			#carrega a instruão de printar o espaço em branco
		syscall				
		
		addi $t0, $t0, 4		#incrementa em 4 o indice do array
		j printArray			#pula para o inicio da função
		
	stopPrint:	
		
		
		
	
