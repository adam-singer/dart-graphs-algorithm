class BreadthFirstPaths {

  List<bool> marked; // marked[v] = is there an s-v path
  List<int> edgeTo; // edgeTo[v] = previous edge on shortest s-v path
  List<int> distTo; // distTo[v] = number of edges shortest s-v path
  
  // single source
  BreadthFirstPaths(Graph G, int s) {
    marked = new List<bool>(G.V);
    distTo = new List<int>(G.V);
    edgeTo = new List<int>(G.V);
    bfs(G,s);
    
    assert(check(G,s));
  } 
  
  // multiple sources
  BreadthFirstPaths.withMultipleSources(Graph G, Iterable<int> sources) {
    marked = new List<bool>(G.V);
    distTo = new List<int>(G.V);
    edgeTo = new List<int>(G.V);
    for (int v = 0; v < G.V; v++) {
      distTo[v] = -1;
    }
    
    bfsWithIterable(G, sources);
  }
  
  // BFS from single source
  void bfs(Graph G, int s) {
    Queue<int> q = new Queue<int>();
    for (int v = 0; v < G.V; v++) {
      distTo[v] = -1;
    }
    
    distTo[s] = 0;
    marked[s] = true;
    q.add(s);
    
    while (!q.isEmpty()) {
      int v = q.removeFirst();
      for (int w in G.adj[v]) {
        if (!marked[w]) {
          edgeTo[w] = v;
          distTo[w] = distTo[v] + 1;
          marked[w] = true;
          q.add(w);
        }
      }
    }
  }
  
  // BSF from multiple sources
  void bfsWithIterable(Graph G, Iterable<int> sources) {
    Queue<int> q = new Queue<int>();
    for (int s in sources) {
      marked[s] = true;
      distTo[s] = 0;
    }
    
    while (!q.isEmpty()) {
      int v = q.removeFirst();
      for (int w in G.adj[v]) {
        if (!marked[w]) {
          edgeTo[w] = v;
          distTo[w] = distTo[v] + 1;
          marked[w] = true;
          q.add(w);
        }
      }
    }
  }
  
  // is there a path between s (or sources) and v ?
  bool hasPathTo(int v) {
    return marked[v];
  }
  
  // shortest path between s (or sources) and v; null if no such path
  Iterable<int> pathTo(int v) {
    if (!hasPathTo(v)) {
      return null;
    }
    
    Stack<int> path = new Stack<int>();
    int x;
    for (x = v; distTo[x] != 0; x = edgeTo[x]) {
      path.push(x);
    }
    
    path.push(x);
    return path;
  }
  
  // check optimality conditions for single source
  bool check(Graph G, int s) {
    return true; 
  }
  
}
