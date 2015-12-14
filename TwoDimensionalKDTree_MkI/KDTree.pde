/*

float minValue = min(float a, float b);
float minValue = min(float a, float b, float c);
float minValue = min(float[] floatArray);

*/

class KDTree{
  
  int level;
  Bounds edges;
  
  Node median;
  int medianIndex;
  
  Node parent;
  
  NodeList left;
  NodeList right;
  
  KDTree[] children = new KDTree[2];
  
  KDTree(NodeList nodes_, int level_, Node parent_, Bounds parentEdges_){
    
    parent = parent_;
    level = level_;
    
    
    //X: 0, 2, 4, 6 ...
    //Y: 1, 3, 5, 7 ...
    
    if(level % 2 == 0){
    Collections.sort(nodes_, compose(new sortByX(), new sortByY()));
    } else {
    Collections.sort(nodes_, compose(new sortByY(), new sortByX()));
    }
    
    if(nodes_.size() % 2 != 0) { median = (Node)nodes_.get(floor(nodes_.size() / 2) + 1); medianIndex = floor(nodes_.size() / 2) + 1;}
    else
    { median = getMinFromTwo((Node)nodes_.get(floor(nodes_.size() / 2)), (Node)nodes_.get(floor(nodes_.size() / 2 - 1))); 
      medianIndex = getMinIndexFromTwo((Node)nodes_.get(floor(nodes_.size() / 2)), floor(nodes_.size() / 2), (Node)nodes_.get(floor(nodes_.size() / 2 - 1)), floor(nodes_.size() / 2 - 1)) ;}
    
    if(level == 0) { edges = new Bounds(0, width, 0, height); } 
    else {
    edges = getEdges(level, median, parent, parentEdges_);
    }
    
    //display(int color_, int gap_, int margins_, int weight_, int dim_, Node parent_)
    median.display(255, 1, 10, 2, level, parent, edges);
    
    //graph mode display
    //median.displayGraph(255, 1, 10, 8, level, parent);
    
    left = splitNodeList(nodes_, 0, medianIndex);
    right = splitNodeList(nodes_, medianIndex + 1, nodes_.size());

    if(level < 14){
      
      //consider other options, 1 or even one of tree could ends earlier
      if(left.size() > 2 || right.size() > 2) {
      //KDTree(NodeList nodes_, int level, Node parent_)
      children[0] = new KDTree(left, level + 1, (Node)median, edges);
      children[1] = new KDTree(right, level + 1, (Node)median, edges);
      }
    }

  }
  
  NodeList neighboursByK(int k_){
    
    NodeList output = new NodeList();
    
    
    return output;
    
  }
  
  NodeList neighboursByRadius( float radius_){
    
    NodeList output = new NodeList();
    
    return output;
    
  }
  
  Node getMinFromTwo(Node n1_, Node n2_){
    
    Node output;
    
    if( min(n1_.x, n2_.x) == n1_.x) output = n1_; else output = n2_;
    
    return output;
    
  }
  
  Bounds getEdges(int level_, Node median_, Node parent_, Bounds parentEdges_){
    
    Bounds output = new Bounds(parentEdges_.minX, parentEdges_.maxX, parentEdges_.minY, parentEdges_.maxY);
    
    if(level_ % 2 == 1){
    //X
    if(min(median.x, parent.x) == median.x) output.maxX = parent_.x; else output.minX = parent_.x;
    } else
    {
    //Y
    if(min(median.y, parent.y) == median.y) output.maxY = parent_.y; else output.minY = parent_.y;
    }
    
    return output;
    
  }
  
  int getMinIndexFromTwo(Node n1_, int n1Index_, Node n2_, int n2Index_){
    
    int output;
    
    if( min(n1_.x, n2_.x) == n1_.x) output = n1Index_; else output = n2Index_;
    
    return output;
    
  }
  
 NodeList splitNodeList(NodeList src_, int start_, int end_){
   
   NodeList output = new NodeList();
   
   for(int n = start_; n < end_; n++){
     
     output.add((Node)src_.get(n));
     
   }
   
   return output;
   
 }
  
}

class Bounds{ //boundaries
  
  float maxX, minX, minY, maxY;
  
  Bounds(float x1_, float x2_, float y1_, float y2_){
    
    if( min(x1_, x2_) == x1_) { minX = x1_; maxX = x2_; } else { minX = x2_; maxX = x1_; }
    if( min(y1_, y2_) == y1_) { minY = y1_; maxY = y2_; } else { minY = y2_; maxY = y1_; }
    
  }
  
}
