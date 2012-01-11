class DepthFirstPaths {
  List<bool> marked; // makred[v] = is there an s-v path?
  List<int> edgeTo; // edgeTo[v] = last edge on s-v path
  int s; // source vertext
  
  DepthFirstPaths(Graph G, int S) {
    this.s = S;
    edgeTo = new List<int>(G.V);
    marked = new List<bool>(G.V);
    dfs(G,s);
  }
  
  void dfs(Graph G, int v) {
    marked[v] = true;
    for (int w in G.adj[v]) {
      if (!marked[w]) {
        edgeTo[w] = v;
        dfs(G, w);
      }
    }
  }
  
  // is there a path between s and v ?
  bool hasPathTo(int v) {
    return marked[v];
  }
  
  // return a path between s to v; null if no such path
  Iterable<int> pathTo(int v) {
    if (!hasPathTo(v)) {
      return null;
    }
    
    Stack<int> path = new Stack<int>();
    for (int x = v; x!=s; x = edgeTo[x]) {
      path.push(x);
    }
    
    path.push(s);
    return path;
  }
}
