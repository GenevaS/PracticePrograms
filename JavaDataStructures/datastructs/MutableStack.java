package datastructs;

import java.util.ArrayList;
import java.util.NoSuchElementException;

public class MutableStack<E> {
	private ArrayList<E> stack;
	private Integer size;
	
	// Constructor
	public MutableStack()
	{
		stack = new ArrayList<E>();
		size = 0;
		
		return;
	}
	
	/*
	 * Class Function: push
	 * -----------------------------------
	 * Adds an element to the top (end) of
	 * the stack ArrayList.
	 */
	public void push(E e)
	{
		if(e == null) throw new IllegalArgumentException("Trying to push a null element");
		
		stack.add(e);
		size++;
		
		return;
	}
	
	/*
	 * Class Function: pop
	 * -----------------------------------
	 * Removes and returns an element from
	 * the top (end) of the stack
	 * ArrayList.
	 */
	public E pop()
	{
		if(size == 0) throw new NoSuchElementException("Popping from an emty stack");
		
		size--;
		return stack.remove((int)size);
	}
	
	/*
	 * Class Function: peek
	 * -----------------------------------
	 * Returns the object on the top of
	 * the stack without removing it.
	 */
	public E peek()
	{
		if(size == 0) throw new NoSuchElementException("Trying to look at an empty stack");	
		
		return stack.get(size - 1);
	}
	
	/*
	 * Class Function: size
	 * ------------------------------------
	 * Returns the number of elements 
	 * currently in the stack.
	 */
	public int size()
	{
		return size;
	}
	
	/*
	 * Class Function: printStack
	 * ----------------------------------
	 * Prints the contents of the stack
	 * from top to bottom.
	 */
	public void printStack()
	{
		if(size == 0) throw new NoSuchElementException("Printing an empty stack");
			
		for (int i = size - 1; i >=0; i--) System.out.print(stack.get(i) + " ");
		
		return;
	}
}