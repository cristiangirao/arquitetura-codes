
public class InsertionSort{
    private int[] receivedNumbers;
    private int[] orderedNumbers;
    
    public InsertionSort(){
        
    }
    
    public InsertionSort(int[] numbers){
        this.receivedNumbers = numbers;
    }
    
    public void orderNumbers() {        
        int[] numbers = this.receivedNumbers;
        
        for (int i = 1; i < numbers.length; i++) {

            int aux = numbers[i];
            int j = i;

            while ((j > 0) && (numbers[j - 1] > aux)) {
            	numbers[j] = numbers[j - 1];
                j -= 1;
            }
            numbers[j] = aux;
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
