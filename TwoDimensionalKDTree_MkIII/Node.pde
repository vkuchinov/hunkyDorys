class NodeList extends ArrayList{
  
  void update(){
    
    if(this.size() != 0){
      
        
        for(int n = 0; n < this.size(); n++){
        
             Node currentNode = (Node)this.get(n);
             currentNode.update();
             
        }  
    }
    
  }
    
  void display(int color_,int gap_, int margins_){
    
    if(this.size() != 0){
      
        
        for(int n = 0; n < this.size(); n++){
        
             stroke(color_);
             strokeWeight(2);
             
             Node currentNode = (Node)this.get(n);
             
             point(margins_ + currentNode.x * gap_, margins_ + currentNode.y * gap_);
            
        }  
    }
  }
  
  void printToConsole(){
    
    if(this.size() != 0){
      
        for(int n = 0; n < this.size(); n++){
          
          Node nn = (Node)this.get(n);
          print(n + ": " + nn.x + ", ");
          
        }
    }
  }
}

class Node extends PVector{
  
   int index;
   PVector velocity;
  
   //2-dimensional
   Node(int i_, float x_, float y_){
     
     index = i_;
     x = x_; y = y_;
     
   }
     
   Node(int i_, float x_, float y_, PVector v_){
     
     index = i_;
     x = x_; y = y_;
     
     velocity = new PVector(v_.x, v_.y, 0);
     
   }
   
   //3-dimensional
   Node(int i_, float x_, float y_, float z_){
    
     index = i_;
     x = x_; y = y_; z = z_;
    
   } 
   
   void update(){
     
     if(this.x < 0 || this.x > width) velocity.x *= -1;
     if(this.y < 0 || this.y > width) velocity.y *= -1;
     
     if(velocity != null){
       this.x += velocity.x;
       this.y += velocity.y;
     }
  
   }
   
   void display(int color_, int gap_, int margins_, int weight_, int dim_, Node parent_, Bounds edges_){
    
     
     if(dim_ == 0) { stroke(255, 0, 0); strokeWeight(1); line(margins_ + this.x * gap_, 0, margins_ + this.x * gap_, height); }
     else
     { if(dim_ % 2 == 0 && parent_ != null) {            
         stroke(255, 0, 0); strokeWeight(1);
         if(min(this.y, parent_.y) == this.y) { line(margins_ + this.x * gap_, margins_ + edges_.minY * gap_, margins_ + this.x * gap_, margins_ + parent_.y * gap_); } 
         else { line(margins_ + this.x * gap_, margins_ + parent_.y * gap_, margins_ + this.x * gap_, margins_ + edges_.maxY * gap_); }
       }
       else{
    
       stroke(0, 255, 0); strokeWeight(1);
         if(min(this.x, parent_.x) == this.x) { line(margins_ + edges_.minX * gap_, margins_ + this.y * gap_, margins_ + parent_.x * gap_, margins_ + this.y * gap_); } 
         else { line(margins_ + parent_.x * gap_, margins_ + this.y * gap_, margins_ + edges_.maxX * gap_, margins_ + this.y * gap_); }
       }  
     }
     
     stroke(color_);
     strokeWeight(weight_);
    
     point(margins_ + this.x * gap_, margins_ + this.y * gap_);
    
   }
  
   void displayGraph(int color_, int gap_, int margins_, int weight_, int dim_, Node parent_){
 
     if(parent_ != null) {    
     colorMode(HSB);
     float col = map(dim_, 0, 10, 20, 240);
     stroke(col, 255, 255); strokeWeight(1);
     line(margins_ + this.x * gap_, margins_ + this.y * gap_, margins_ + parent_.x * gap_, margins_ + parent_.y * gap_); 
     
     }
     
     colorMode(RGB);
     stroke(color_);
     strokeWeight(map(dim_, 0, 14, weight_*1.5, 1));
    
     point(margins_ + this.x * gap_, margins_ + this.y * gap_);
    
     
     
   }
   
   void print(){
     
      println("index:", index, "x:", x, "y:", y, "z:", z);
     
   }
   
   int getIndex() { return this.index; }
   float getX()  { return this.x; }
   float getY()  { return this.y; }
   float getZ()  { return this.z; }
  
}

//COMPARATOR SET
//examples: Collections.sort(ListName, new sortByX());

class sortByIndex implements Comparator<Node> { 

        @Override
        public int compare(Node n1, Node n2) {
        return Integer.valueOf(n1.getIndex()).compareTo(n2.getIndex());
        
}}

class sortByX implements Comparator<Node> { 

        @Override
        public int compare(Node n1, Node n2) {
        return Float.compare(n1.getX(), n2.getX());
        
}}

class sortByY implements Comparator<Node> { 

        @Override
        public int compare(Node n1, Node n2) {
        return Float.compare(n1.getY(), n2.getY());
        
}}

class sortByZ implements Comparator<Node> { 

        @Override
        public int compare(Node n1, Node n2) {
        return Float.compare(n1.getZ(), n2.getZ());
        
}}

//SUPER CLASS FOR TWO PARAMETERS SORT
//examples Collections.sort(ListName, compose(new sortByX(), new sortByY())); 

public <T> Comparator<T> compose(
    final Comparator<? super T> primary,
    final Comparator<? super T> secondary
    
) {
    return new Comparator<T>() {
        public int compare(T a, T b) {
            int result = primary.compare(a, b);
            return result==0 ? secondary.compare(a, b) : result;
        }
    };
}

