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
		
		System.out.println("Mutable Queue - Integers");
		MutableQueue<Integer> mInts = new MutableQueue<Integer>();
		
		mInts.enqueue(1);
		System.out.print("mInts.enqueue(1): ");
	    mInts.printQueue();
		System.out.print("\nmInts.enqueue(2): ");
	    mInts.enqueue(2);
	    mInts.printQueue();
		System.out.print("\nmInts.enqueue(3): ");
		mInts.enqueue(3);
	    mInts.printQueue();
		System.out.print("\nmInts.dequeue(): ");
		mInts.dequeue();
		mInts.printQueue();
		System.out.print("\nmInts: ");
		mInts.printQueue();
		System.out.print("\n");
		System.out.print("\n");
		
		System.out.println("Mutable Stack - Integers");
		MutableStack<Integer> stkInt = new MutableStack<Integer>();
		
		System.out.println("\nSize of stack is " + stkInt.size());
		System.out.println("Push 1");
		stkInt.push(1);
		stkInt.printStack();
		System.out.println("\nPop element and push 1, 2, and 3");
		stkInt.pop();
		stkInt.push(1);
		stkInt.push(2);
		stkInt.push(3);
		stkInt.printStack();
		System.out.println("\nSize of stack is " + stkInt.size());
		System.out.println("\nPop element");
		stkInt.pop();
		stkInt.printStack();
		System.out.println("\nSize of stack is " + stkInt.size());
	}
}
