class NodeList extends ArrayList{
  
  void print(){
    
    if(this.size() != 0){
      
        for(int n = 0; n < this.size(); n++){
          
          println(this.get(n));
          
        }
    }
  }
}

class Node extends PVector{
  
   int index;
  
   Node(int i_, float x_, float y_){
     
     index = i_;
     x = x_; y = y_;
     
   }
     
   Node(int i_, float x_, float y_, float z_){
    
     index = i_;
     x = x_; y = y_; z = z_;
    
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



