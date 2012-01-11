class Graph {
  int V;
  int E;
  List<List<int>> adj;
  
  _buildGraph() {
    adj = new List<List<int>>(V);
    for (int _v = 0; _v < V; _v++) {
      adj[_v] = new List<int>();
    }
  }
  
  /**
   * Create an empty graph with V vertices
   */
  Graph(this.V) {
    if (this.V < 0) {
      throw new Exception("Number of verticies must be nonnegative");
    }
    
    this.E = 0;
    _buildGraph();
  }
  
  /**
   * Create a random graph with V vertices and E edges.
   * Expected running time is proportional to V + E.
   */
  Graph.WithEdges(this.V, this.E) {
    _buildGraph();
    if (E < 0) {
      throw new Exception("Number of edges must be nonnegative");
    }
    
    int e = E;
    for (int i=0; i<e; i++) {
      int v = (Math.random() * V).toInt();
      int w = (Math.random() * V).toInt();
      addEdge(v,w);
    }
  }
  
  /**
   * Create a digraph from list of ints. ints[0] = V, ints[1] = E.
   * Rest of ints in the list are edges i = 2; ints[i] = V, ints[i+1] = E
   */ 
  Graph.WithInts(List<int> ints) {
    this.V = ints[0];
    this.E = ints[1];
    _buildGraph();
   
    int _i = 0;
    int e = E;
    for (int i=0; i<e; i++) {
      int v = ints[2 + _i];
      int w = ints[2 + _i + 1];
      _i+=2;
      addEdge(v,w);
    }
  }
  
  Graph.Copy(Graph G) {
    this.V = G.V;
    this.E = G.E;
    
    for (int v = 0; v < G.V; v++) {
      List<int> reverse = new List<int>();
      
      for (int w in G.adj[v]) {
        reverse.addLast(w);
      }
      
      for (int i = 0; i < reverse.length; i++) {
        adj[v].add(reverse.removeLast());
      }
    }
  }
  
  /**
   * Add the edge v-w to graph.
   */
  void addEdge(int v, int w) {
    E++;
    
    //adj[v].add(w);
    //adj[w].add(v);
    
    // Bad design, create a stack object. 
    // Creating lists shouldnt be considered this cheap. 
    List<int> _w = new List<int>();
    _w.add(w);
    _w.addAll(adj[v]);
    adj[v] = _w;
    
    //adj[v].add(w);
    List<int> _v = new List<int>();
    _v.add(v);
    _v.addAll(adj[w]);
    adj[w] = _v;
    //adj[w].add(v);
  }
  
  /**
   * Return a string representation of the graph. 
   */
  String toString() {
    StringBuffer s = new StringBuffer();
    s.add("${V} certices, ${E} edges \n");
    for (int v = 0; v < V; v++) {
      s.add("${v}: ");
      for (int w in adj[v]) {
        s.add("${w} ");
      }
      s.add("\n");
    }
    
    return s.toString();
  }
}
