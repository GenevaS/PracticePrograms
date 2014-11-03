package datastructs;

public class Main {

	public static void main(String[] args) {
		System.out.println("Integer Queue");
		ImmutableQueue<Integer> testInt = new ImmutableQueue<Integer>();
	    ImmutableQueue<Integer> add = testInt.enqueue(1);
		System.out.print("add.enqueue(1): ");
	    add.printQueue();
		System.out.print("\nadd.enqueue(2): ");
	    add = add.enqueue(2);
	    add.printQueue();
		System.out.print("\nadd.enqueue(3): ");
		add = add.enqueue(3);
	    add.printQueue();
		System.out.print("\nsub = add.dequeue(): ");
		ImmutableQueue<Integer> sub = add.dequeue();
		sub.printQueue();
		System.out.print("\nadd: ");
		add.printQueue();
		System.out.print("\n");
		System.out.print("\n");
			
		System.out.println("String Queue");
		System.out.print("testStr.enqueue('test'): ");
		ImmutableQueue<String> testStr = new ImmutableQueue<String>();
		testStr = testStr.enqueue("test");
		testStr.printQueue();
		System.out.print("\ntestStr.enqueue('test2'): ");
		testStr = testStr.enqueue("test2");
		testStr.printQueue();
		System.out.print("\n");
	}
}
