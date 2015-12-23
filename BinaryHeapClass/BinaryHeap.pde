/*

binary heap size is always should be considered as size + 1 
because index 0 will be empty or -infinity.

*/

class BinaryHeap{
  
  //a function (scoreFunction) is first applied to them, so that it 
  //becomes possible to store objects that can not be 
  //directly compared.
  
  //bestNodes = new BinaryHeap( function (e) { return -e[1]; } );
  //scoreFunction;
  
  int size;
  Node[] content;
  int position = 0;
  
  BinaryHeap(Node[] nodes_){
  
  position = 0;
  
  size = nodes_.length + 1; 
  content = new Node[size];
  content[0] = new Node(0, Float.NEGATIVE_INFINITY);
   
  this.createHeapFromArray(nodes_);
    
  }
  
  BinaryHeap(ArrayList<Node> nodes_){
  
  position = 0;
  
  size = nodes_.size() + 1; 
  content = new Node[size];
  content[0] = new Node(0, Float.NEGATIVE_INFINITY);
   
  this.createHeapFromArrayList(nodes_);
    
  }
  
  void createHeapFromArray(Node[] nodes_) {
    if (nodes_.length > 0) {
      for (int n = 0; n < nodes_.length; n++) {
        insert(nodes_[n]);
      }
    }
  }
  
  void createHeapFromArrayList(ArrayList<Node> nodes_) {
    if (nodes_.size() > 0) {
      for (int n = 0; n < nodes_.size(); n++) {
        insert(nodes_.get(n));
      }
    }
  }

  void insert(Node n_) {
    if (position == 0) { 
      content[position + 1] = new Node(n_.id, n_.value); 
      position = 2;
    } else {
      content[position++] = new Node(n_.id, n_.value);
      bubbleUp(); 
    }
  }
  
  void bubbleUp() {
    int pos = position - 1; 
    while (pos > 0 && content[pos / 2].value > content[pos].value) { 
                         
      Node NodeToSwap = new Node(content[pos].id, content[pos].value); //swapping
      content[pos] = content[pos / 2];
      content[pos / 2] = NodeToSwap;
      pos = pos / 2; 
    }
  }
  
  void sinkDown(int k_) {
    
    float a = content[k_].value;
    int smallest = k_;
    
    if (2 * k_ < position && content[smallest].value > content[2 * k_].value) {
      smallest = 2 * k_;
    }
    if (2 * k_ + 1 < position && content[smallest].value > content[2 * k_ + 1].value) {
      smallest = 2 * k_ + 1;
    }
    if (smallest != k_) { 
      swap(k_, smallest);
      sinkDown(smallest); 
    }
  }
    
  void swap(int a_, int b_) {

    float temp = content[a_].value;
    content[a_].value = content[b_].value;
    content[b_].value = temp;
    
  }
  
  void remove(Node node_) {

    int index = 0;
    
    for (int n = 1; n < content.length; n++) {
      if (content[n].value == node_.value) {
        index = n;
        break;
      }
    }
    content[index].value = content[position - 1].value;
    content[position - 1].value = 0.0; 
    position--;
    sinkDown(index);
  }
  
  void printToConsole() {
    println("start of content");
    for (int n = 1; n < content.length; n++) {
      print(content[n].value + " ");
    }
    println("\nend of content");
  }
  
}

