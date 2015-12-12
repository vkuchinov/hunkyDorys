class KDTree{
  
  KDTree(NodeList nodes_){
    
    Collections.sort(nodes_, compose(new sortByX(), new sortByY()));
    
  }
  
  NodeList neighboursByK(int k_){
    
    NodeList output = new NodeList();
    
    
    return output;
    
  }
  
  NodeList neighboursByRadius( float radius_){
    
    NodeList output = new NodeList();
    
    
    return output;
    
  }
  
}
