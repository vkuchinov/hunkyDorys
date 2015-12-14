/*

 float minValue = min(float a, float b);
 float minValue = min(float a, float b, float c);
 float minValue = min(float[] floatArray);
 
 this.obj = obj;
 this.left = null;
 this.right = null;
 this.parent = parent;
 this.dimension = dimension;
 
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

  KDTree(NodeList nodes_, int level_, Node parent_, Bounds parentEdges_) {

    parent = parent_;
    level = level_;

    //X: 0, 2, 4, 6 ...
    //Y: 1, 3, 5, 7 ...

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

      if (level == 0) { 
        edges = new Bounds(0, width, 0, height);
      } else {
        edges = getEdges(level, median, parent, parentEdges_);
      }

      //display(int color_, int gap_, int margins_, int weight_, int dim_, Node parent_)
      //median.display(255, 1, 0, 2, level, parent, edges);

      //graph mode display
      median.displayGraph(255, 1, 0, 8, level, parent);

      left = splitNodeList(nodes_, 0, medianIndex);
      right = splitNodeList(nodes_, medianIndex + 1, nodes_.size());

      //KDTree(NodeList nodes_, int level, Node parent_)
      if (left.size() != 0 || left != null) children[0] = new KDTree(left, level + 1, (Node)median, edges);
      if (right.size() != 0 || right != null) children[1] = new KDTree(right, level + 1, (Node)median, edges);
    }
  }

  //look for given number of closest neighbours
  NodeList neighboursByK(Node point_, int k_) {

    NodeList output = new NodeList();

    return output;
    
  }

  //look for all neighbours in given radius
  NodeList neighboursByRadius(Node point_, float radius_) {

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
