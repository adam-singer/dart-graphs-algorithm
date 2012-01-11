// Poor implementation of a stack. This should be refactored to use  a node. 
class Stack<T> implements Iterable<T> {
  Queue<T> queue;
  Stack() {
    queue = new Queue<T>();
  }
  
  void push(T item) {
    queue.add(item);
  }
  
  bool isEmpty() {
    return size() == 0;
  }
  
  int size() {
    return queue.length;
  }
  
  T pop() {
    return queue.removeLast();
  }
  
  T peek() {
    if (isEmpty()) {
      throw new Exception("Stack underflow");
    }
    return queue.last();
  }
  
  Iterator<T> iterator() {
    List<T> l = new List<T>();
    Queue<T> q = new Queue<T>.from(queue);
    while(q.length != 0) {
      l.add(q.removeLast());
    }
    return l.iterator();
  }
  
  String toString() {
    StringBuffer s = new StringBuffer();
    //var t  = this.iterator();
    for (T item in this) {
      s.add("${item} ");
    }
    return s.toString();
  }
}
