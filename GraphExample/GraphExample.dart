#source('Graph.dart');
#source('Stack.dart');

void main() {
  print("Hello World");
  
  Graph g = new Graph.WithEdges(1, 1);
  print(g.toString());
  //print("Goodbye World!");
  Graph gg = new Graph(13);
  
  gg.addEdge(0,5);
  gg.addEdge(4,3);
  gg.addEdge(0,1);
  gg.addEdge(9,12);
  gg.addEdge(6,4);
  gg.addEdge(5,4);
  gg.addEdge(0,2);
  gg.addEdge(11,12);
  gg.addEdge(9,10);
  gg.addEdge(0,6);
  gg.addEdge(7,8);
  gg.addEdge(9,11);
  gg.addEdge(5,3);

  print(gg.toString());
  
  
  Stack<int> s = new Stack<int>();
  s.push(1);
  s.push(2);
  s.push(3);
  s.push(4);
  print(s.toString());
  print(s.pop());
  print(s.toString());
  print(s.pop());
  print(s.toString());
  print(s.pop());
  print(s.toString());
  print(s.pop());
  print(s.toString());
  
  print("new stack");
  s = new Stack<int>();
  s.push(1);
  s.push(2);
  s.push(3);
  s.push(4);
  print(s.toString());
  print(s.peek());
  
  
}
