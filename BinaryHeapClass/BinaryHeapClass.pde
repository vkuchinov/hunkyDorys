/*

Binary Heap class [двои́чная ку́ча]
[min-heap, could be easily transformed to max-heap]

-----------------------------------
works both — with Array and ArrayList
-----------------------------------

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

Node[] array = new Node[32];
ArrayList<Node> arrayList = new ArrayList();

BinaryHeap heapA; //for array testing
BinaryHeap heapB; //for arrayList testing

void setup(){
  
  size(100, 100);
  
  for(int n = 0; n < 32; n++){
    
   array[n] = new Node(n, random(0.01, 49.49));
   arrayList.add(new Node(n, random(0.01, 49.49)));
    
  }
  
  heapA = new BinaryHeap(array);
  heapA.printToConsole();
  heapA.remove(array[7]);
  heapA.printToConsole();
  
  heapB = new BinaryHeap(arrayList);
  heapB.printToConsole();
  heapB.remove(arrayList.get(5));
  heapB.printToConsole();
  
}


