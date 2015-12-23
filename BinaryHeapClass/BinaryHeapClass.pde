/*

Binary Heap class [двои́чная ку́ча]
[min-heap, could be easily transformed to max-heap]

based on
http://eloquentjavascript.net/1st_edition/appendix2.html
http://algorithms.tutorialhorizon.com/binary-min-max-heap/

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

REFERENCES:
https://en.wikipedia.org/wiki/Binary_heap

FURTHER READINGS:
http://visualgo.net/

*/

Node[] original = new Node[32];
BinaryHeap heap;

void setup(){
  
  size(100, 100);
  
  for(int n = 0; n < 32; n++){
    
   original[n] = new Node(n, random(0.01, 49.49));
    
  }
  
  heap = new BinaryHeap(original);
  heap.display();
  heap.remove(original[7]);
  heap.display();
  
}


