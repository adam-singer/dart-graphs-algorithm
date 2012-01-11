#source('DepthFirstSearch.dart');
#source('../GraphExample/Graph.dart');
void main() {
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
  
  //int s = 0;
  int s = 9;
  DepthFirstSearch search = new DepthFirstSearch(gg, s);
  
  StringBuffer sb = new StringBuffer();
  for (int v = 0; v < gg.V; v++) {
    if (search.marked[v]) {
      sb.add("${v} ");
    }
  }
  
  sb.add("\n");
  print(sb.toString());
  
}
