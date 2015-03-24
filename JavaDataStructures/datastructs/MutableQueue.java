/*
 * Geneva Smith
 * -------------------------------------------------
 * This class implements a mutable queue data
 * structure that can be used with any data type.
 * Internally stores the elements of the queue in
 * an ArrayList data structure.
 */

package datastructs;

import java.util.ArrayList;
import java.util.NoSuchElementException;

public class MutableQueue<E> {
	private ArrayList<E> queue;
	
	// Constructor - creates an empty queue
	public MutableQueue(){
		queue = new ArrayList<E>();
		return;
	}
	
	/*
	 * Class Function: enqueue
	 * --------------------------------------------------
	 * Adds a new element e to the end of this class's
	 * queue ArrayList.
	 */
	public void enqueue(E e) {
		if (e == null) {
			throw new IllegalArgumentException("Null element queued");
		}
		queue.add(e);
	}
	
	/*
	 * Class Function: dequeue
	 * --------------------------------------------------
	 * Removes the first element from the queue ArrayList.
	 */
	public void dequeue() {
		if (queue.size() == 0) {
			throw new NoSuchElementException("Empty queue");
		}
		queue.remove(0);
	}

	/*
	 * Class Function: peek
	 * --------------------------------------------------
	 * Returns the first element in the queue ArrayList.
	 */
	public E peek() {
		if (queue.size() == 0){
			throw new NoSuchElementException("Empty queue");
		}
		return queue.get(0);
	}
	
	/*
	 * Class Function: size
	 * --------------------------------------------------
	 * Returns a count of the number of elements in the
	 * queue.
	 */
	public int size() {
		return queue.size();
	}
	
	/*
	 * Class Function: printQueue
	 * --------------------------------------------------
	 * Prints out the elements of the queue on a single 
	 * line. Useful for debugging.
	 */
	public void printQueue()
	{
		if (queue.size() == 0) {
			throw new NoSuchElementException("Empty queue");
		}
		
		for (int i = 0; i < queue.size(); i++) System.out.print(queue.get(i) + " ");
	}
}
