/*
 * Geneva Smith
 * -------------------------------------------------
 * This class implements an immutable queue data
 * structure that can be used with any data type.
 * Internally stores the elements of the queue in
 * an ArrayList data structure.
 */

package datastructs;

import java.util.ArrayList;
import java.util.NoSuchElementException;

public class ImmutableQueue<E> {
	private ArrayList<E> queue;
	
	// Constructor - creates an empty queue
	public ImmutableQueue(){
		queue = new ArrayList<E>();
		return;
	}
	
	// Constructor - used by enqueue (private)
	private ImmutableQueue(ArrayList<E> oldqueue, E elem) {
		queue = new ArrayList<E>();
		
		for (int i = 0; i < oldqueue.size(); i++) queue.add(oldqueue.get(i));
		queue.add(elem);
		
		return;
	}
	// Constructor - used by dequeue (private)
	private ImmutableQueue(ArrayList<E> oldqueue){
		queue = new ArrayList<E>();
		for (int i = 1; i < oldqueue.size(); i++) queue.add(oldqueue.get(i));

		return;
	}
	
	/*
	 * Class Function: enqueue
	 * --------------------------------------------------
	 * Creates and returns a new ImmutableQueue object
	 * consisting of the ImmutableQueue that this
	 * function is called on and a new element e.
	 */
	public ImmutableQueue<E> enqueue(E e) {
		if (e == null) {
			throw new IllegalArgumentException("Null element queued");
		}
		ImmutableQueue<E> addElem = new ImmutableQueue<E>(this.queue, e);
		
		return addElem;
	}
	
	/*
	 * Class Function: dequeue
	 * --------------------------------------------------
	 * Creates and returns a new ImmutableQueue object
	 * consisting of the ImmutableQueue that this
	 * function is called on and omitting the first
	 * element.
	 */
	public ImmutableQueue<E> dequeue() {
		if (queue.size() == 0) {
			throw new NoSuchElementException("Empty queue");
		}
		ImmutableQueue<E> rmElem = new ImmutableQueue<E>(this.queue);
		
		return rmElem;
	}

	/*
	 * Class Function: peek
	 * --------------------------------------------------
	 * Returns the first element in the queue without 
	 * modifying the ImmutableQueue object that calls
	 * this function.
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
	 * queue without modifying the ImmutableQueue object
	 * that calls this function.
	 */
	public int size() {
		return queue.size();
	}
	
	/*
	 * Class Function: printQueue
	 * --------------------------------------------------
	 * Prints out the elements of the queue on a single 
	 * line without modifying the ImmutableQueue object 
	 * that calls this function.
	 */
	public void printQueue()
	{
		if (queue.size() == 0) {
			throw new NoSuchElementException("Empty queue");
		}
		
		for (int i = 0; i < queue.size(); i++) System.out.print(queue.get(i) + " ");
	}
}
