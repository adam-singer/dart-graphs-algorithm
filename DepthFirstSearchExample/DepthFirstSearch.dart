class DepthFirstSearch {
  List<bool> marked; // marked[v] = is there an s-v path?
  int count; // number of vertices connected to s
  
  // single source 
  DepthFirstSearch(Graph G, int s) {
    count = 0;
    marked = new List<bool>(G.V);
    dfs(G, s);
  }
  
  // depth first search from v
  dfs(Graph G, int v) {
    marked[v] = true;
    for (int w in G.adj[v]) {
      if (!marked[w]) {
        dfs(G,w);
      }
    }
  }
  
}
