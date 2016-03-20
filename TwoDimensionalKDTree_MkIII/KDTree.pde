/*

 float minValue = min(float a, float b);
 float minValue = min(float a, float b, float c);
 float minValue = min(float[] floatArray);
 
 this.obj = obj;
 this.left = null;
 this.right = null;
 this.parent = parent;
 this.dimension = dimension;
 
 [-] shoud I create a new instance of KDTree each time?
     JavaScript example by Ubilabs does.
     
     And my script does. 
     
 UPDATED: DECEMBER, 2015
 
 Implement QuadTree 'goes-up & goes-down' recursive methods to search KD-Tree with only
 difference of checking distances by X or Y value with 'given distance'
 
 Search by K would have the another logic, different from QuadTree's feed K and determine
 worst radius. In this case, I will try dynamic radius search. I think it would be slower
 but in the same time it's a good time to comare.
 
 */

class KDTree {

  int level;
  Bounds edges;

  Node median;
  int medianIndex;

  Node parent;

  NodeList left;
  NodeList right;

  KDTree[] children = new KDTree[2];
  
  int[] treemap;    //stores sorted data

  KDTree(NodeList nodes_, int level_) {
    
    parent = null;
    level = level_;

    treemap = new int[nodes_.size()];

    if (level % 2 == 0) {
      Collections.sort(nodes_, compose(new sortByX(), new sortByY()));
    } else {
      Collections.sort(nodes_, compose(new sortByY(), new sortByX()));
    }

    if (nodes_.size() != 0) {
      if (nodes_.size() % 2 != 0) { 
        median = (Node)nodes_.get(floor(nodes_.size() / 2)); 
        medianIndex = floor(nodes_.size() / 2);
      } else
      { 
        median = getMaxFromTwo(level, (Node)nodes_.get(floor(nodes_.size() / 2)), (Node)nodes_.get(floor(nodes_.size() / 2 - 1))); 
        medianIndex = getMaxIndexFromTwo(level, (Node)nodes_.get(floor(nodes_.size() / 2)), floor(nodes_.size() / 2), (Node)nodes_.get(floor(nodes_.size() / 2 - 1)), floor(nodes_.size() / 2 - 1)) ;
      }

      treemap[round(nodes_.size() / 2.0)] = median.index;

   
      left = splitNodeList(nodes_, 0, medianIndex);
      right = splitNodeList(nodes_, medianIndex + 1, nodes_.size());

      //KDTree(NodeList nodes_, int level, Node parent_)
      if (left.size() != 0 || left != null) { children[0] = new KDTree(left, level + 1, (Node)median, treemap, round(nodes_.size() / 2), 0); } else { children[0] = null; }
      if (right.size() != 0 || right != null) { children[1] = new KDTree(right, level + 1, (Node)median, treemap, round(nodes_.size() / 2), 1); } else { children[1] = null; }
    }
  }

  KDTree(NodeList nodes_, int level_, Node parent_, int[] treemap_, int treepos_, int lr_) {
    
    parent = parent_;
    level = level_;

    if (level % 2 == 0) {
      Collections.sort(nodes_, compose(new sortByX(), new sortByY()));
    } else {
      Collections.sort(nodes_, compose(new sortByY(), new sortByX()));
    }

    if (nodes_.size() != 0) {
      if (nodes_.size() % 2 != 0) { 
        median = (Node)nodes_.get(floor(nodes_.size() / 2)); 
        medianIndex = floor(nodes_.size() / 2);
      } else
      { 
        median = getMaxFromTwo(level, (Node)nodes_.get(floor(nodes_.size() / 2)), (Node)nodes_.get(floor(nodes_.size() / 2 - 1))); 
        medianIndex = getMaxIndexFromTwo(level, (Node)nodes_.get(floor(nodes_.size() / 2)), floor(nodes_.size() / 2), (Node)nodes_.get(floor(nodes_.size() / 2 - 1)), floor(nodes_.size() / 2 - 1)) ;
      }
      
      //treemap
      int currentpos;
      
      if(lr_ == 0) { treemap_[treepos_ - round(nodes_.size()/2.0)] = median.index; currentpos = treepos_ - round(nodes_.size()/2.0);}   //left
      else { treemap_[treepos_ + round(nodes_.size()/2.0)] = median.index; currentpos = treepos_ + round(nodes_.size()/2.0);}           //right

      left = splitNodeList(nodes_, 0, medianIndex);
      right = splitNodeList(nodes_, medianIndex + 1, nodes_.size());

      //KDTree(NodeList nodes_, int level, Node parent_)
      if (left.size() != 0 || left != null) { children[0] = new KDTree(left, level + 1, (Node)median, treemap_, currentpos, 0); } else { children[0] = null; }
      if (right.size() != 0 || right != null) { children[1] = new KDTree(right, level + 1, (Node)median, treemap_, currentpos, 1); } else { children[1] = null; }
    }
    
  }

  void displayTree(){
    println("");
    for(int n = 0; n < this.treemap.length - 1; n++){
       print(n + ": " + treemap[n] + ", ");
    }
    print(this.treemap.length - 1 + ": " + treemap[this.treemap.length - 1]);
  }
  
  //look for given number of closest neighbours
  NodeList neighboursByK(Node point_, int k_) {

    /*
    
    SUB-TASKS
    
    [-] e.g: for 6,3 and 9,6 distance is not 4.31, but 18.
        sqrt(18) is 4.31.
        
        The question is why we need pow(n, 2) compare to x and y
        
    
    [D] distance instead of x, y values
    [-] first iteration: set the best neighbour in it
    [-] should be recursive... [level in parameters] 

    [D] dead end
    
    'sorted' array through building KD Tree

    L, U pointers [indexers] 
           L                          U
    [n1][n4][n8][n9][.....][n2][n3][n7][n6]
  
    median = (L + U - 1) / 2
    
    Throughout the searching for # of neighbpurs, you have to compare
    the worst distance out of n-bests, while searching by radius —
    radius itself (r2).
  
    should be recursive as well
    */
    
    ArrayList<Integer> path = new ArrayList<Integer>();  //path
    NodeList output = new NodeList();                    //results
    
    int median;  //current median
                 //median = round((L + U) / 2.0)
                 
    int L, U; //lower and upper indexers
              //this.treemap: sorted array

    //size: k (k_)              
    SortedMap<Float, Node> neighboursByK = new TreeMap<Float, Node>();
    
    L = 0;
    U = this.treemap.length - 1;
    median = round((U + L) / 2.0);

    if(path.size() != 0 || path.size() % 2 == 0){ // X
        path.add(median);
        Node n = (Node)nodes.get(treemap[median]);
        if(point_.x < n.x){ //go left
        println("less");
        }
        else //go right
        {
        println("more");
        }
    }
    else // Y
    {
        path.add(median);
    }
    //    //level: 0: x, 1: y comparing
    //    if < goes left, otherwise right
    //    //have to check only left
    //    //there is no children in array...!!!
    //    //have to solve it with L, U (shoul be same...)
    //    //while(L == U)
    //    recursive, recursive.... with callback
    //    while(....children != null...){
    //    
    //      
    //    }

    return output;
    
  }

  //look for all neighbours in given radius
  NodeList neighboursByRadius(Node point_, float radius_) {
    
    /*
    
    Throughout the searching for # of neighbpurs, you have to compare
    the worst distance out of n-bests, while searching by radius —
    radius itself (r2).
     
    */

    NodeList output = new NodeList();

    return output;
    
  }

  Bounds getEdges(int level_, Node median_, Node parent_, Bounds parentEdges_) {

    Bounds output = new Bounds(parentEdges_.minX, parentEdges_.maxX, parentEdges_.minY, parentEdges_.maxY);

    if (level_ % 2 == 1) {
      //X
      if (min(median.x, parent.x) == median.x) output.maxX = parent_.x; 
      else output.minX = parent_.x;
    } else
    {
      //Y
      if (min(median.y, parent.y) == median.y) output.maxY = parent_.y; 
      else output.minY = parent_.y;
    }

    return output;
  }

  Node getMaxFromTwo(int level_, Node n1_, Node n2_) {

    Node output = n1_;

    switch( level_ % 2 ) {

    case 0:
      if ( max(n1_.x, n2_.x) == n1_.x) output = n1_; 
      else output = n2_;
      break;
    case 1:
      if ( max(n1_.y, n2_.y) == n1_.y) output = n1_; 
      else output = n2_;
      break;
    }

    return output;
  }


  float[] setToMax(int k_){
   
     float[] output = new float[k_];
    
     for(int f = 0; f < output.length; f++){
      
       output[f] = Float.MAX_VALUE;
      
     }
    
     return output; 
    
  }

  int getMaxIndexFromTwo(int level_, Node n1_, int n1Index_, Node n2_, int n2Index_) {

    int output = n1Index_;

    switch( level_ % 2 ) {

    case 0: 
      if ( max(n1_.x, n2_.x) == n1_.x) output = n1Index_; 
      else output = n2Index_;
      break;
    case 1: 
      if ( max(n1_.y, n2_.y) == n1_.y) output = n1Index_; 
      else output = n2Index_;
      break;
    }

    return output;
  }

  NodeList splitNodeList(NodeList src_, int start_, int end_) {

    NodeList output = new NodeList();

    for (int n = start_; n < end_; n++) {

      output.add((Node)src_.get(n));
    }

    return output;
  }
}

class Bounds { //boundaries

    float maxX, minX, minY, maxY;

  Bounds(float x1_, float x2_, float y1_, float y2_) {

    if ( min(x1_, x2_) == x1_) { 
      minX = x1_; 
      maxX = x2_;
    } else { 
      minX = x2_; 
      maxX = x1_;
    }
    if ( min(y1_, y2_) == y1_) { 
      minY = y1_; 
      maxY = y2_;
    } else { 
      minY = y2_; 
      maxY = y1_;
    }
  }
}

