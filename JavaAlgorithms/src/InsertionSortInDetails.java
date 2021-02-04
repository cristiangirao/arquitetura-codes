
public class InsertionSortInDetails {
    private int[] receivedNumbers;
    private int[] orderedNumbers;
    
    public InsertionSortInDetails(){
        
    }
    
    public InsertionSortInDetails(int[] numbers){
        this.receivedNumbers = numbers;
    }
    
    public void orderNumbers() {      
    	System.out.println("");
    	System.out.println();
        System.out.println("Iniciando ordenação do array:");
        System.out.println();
        
        int[] numbers = this.receivedNumbers;
        
        for (int i = 1; i < numbers.length; i++) {

        	System.out.println("-----------------");
        	System.out.println();
        	
        	int aux = numbers[i];
        	System.out.println("Variável auxiliar recebeu: " + aux);
        	System.out.println();
        	
            int j = i;

            System.out.println("Variável j recebeu: " + j);
        	System.out.println();
        	
            while ((j > 0) && (numbers[j - 1] > aux)) {
            	System.out.println("" +  numbers[j - 1] + " é maior que " + aux);
            	numbers[j] = numbers[j - 1];
                System.out.println();
                System.out.println("Array na posição " +  j + " recebeu " +  numbers[j - 1]);
            	System.out.println();
                j -= 1;
            }
            numbers[j] = aux;
            System.out.println("Array na posição " +  j + " recebeu " + aux);
            System.out.println();
        }
        this.orderedNumbers = numbers;
        System.out.println();
    }
    
    public void printReceivedNumbers(){        
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
