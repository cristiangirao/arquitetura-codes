public class BubbleSortInDetails {
	
	private int[] receivedNumbers;
	private int[] orderedNumbers;
	
	int i, j, aux;
	
	public BubbleSortInDetails() {
		
	}
	
	public BubbleSortInDetails(int[] receivedNumbers) {
		this.receivedNumbers = receivedNumbers;
	}
	
	public void orderNumbers() {
		int[] numbers = this.receivedNumbers;
		
		for(i = 0; i < numbers.length; i++) {
			for(j = 0; j < numbers.length -1 ; j++) {
				if(numbers[j] > numbers[j + 1]) {
					System.out.println("-----------------");
		        	System.out.println();
		        	
		        	aux = numbers[j];
		        	System.out.println("Variável auxiliar recebeu: " + aux);
		        	System.out.println();
		        	
					
					numbers[j] = numbers[j + 1];
					System.out.println("Array na posição " + aux + " recebeu:" + numbers[j + 1]);
		        	System.out.println();
					numbers[j + 1] = aux;
					System.out.println("Array na posição " + numbers[j + 1] + " recebeu:" + aux);
				}
			}
		}
		this.orderedNumbers = numbers;
	}
	
	public void printReceivedNumbers(){
        System.out.println("");
        System.out.println("Array recebido:");
        
        int[] numbers = this.receivedNumbers;
        for(int element: numbers){
        	if(element != numbers[numbers.length - 1]) {
        		System.out.print(element + " -> ");
        	}else {
        		System.out.print(element);
        		System.out.println();
        	}
        }
    }
	
	public void printOrderedNumbers(){
        System.out.println("");
        System.out.println("Array ordenado:");
        
        int[] numbers = this.orderedNumbers;
        for(int element: numbers){
        	if(element != numbers[numbers.length - 1]) {
        		System.out.print(element + " -> ");
        	}else {
        		System.out.print(element);
        		System.out.println();
        	}
        }
    }
}
