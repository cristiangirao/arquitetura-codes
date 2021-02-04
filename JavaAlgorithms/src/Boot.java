
public class Boot {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int[] numbers = {5,4,3,2,1};
		  
		
		System.out.println("------------------------------------------");
		System.out.println("Utilizando o algoritmo Insertion Sort: ");
		
		InsertionSort insertionSort = new InsertionSort(numbers);		
		insertionSort.printReceivedNumbers();
		insertionSort.orderNumbers();
		insertionSort.printOrderedNumbers();
		System.out.println("------------------------------------------");
		
		System.out.println("------------------------------------------");
		System.out.println("Utilizando o algoritmo Bublle Sort: ");
		
		BubbleSort bubbleSort = new BubbleSort(numbers);
		bubbleSort.printReceivedNumbers();
		bubbleSort.orderNumbers();
		bubbleSort.printOrderedNumbers();
	}

}
