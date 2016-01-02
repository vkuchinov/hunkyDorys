/*

Binary Heap class [двои́чная ку́ча]
[min-heap and max-heap, by last parameter]

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

[-] do min/max searches

*/

Node[] array = new Node[8];
ArrayList<Node> arrayList = new ArrayList();

BinaryHeap heapA; //for array testing
BinaryHeap heapB; //for arrayList testing

void setup(){
  
  size(100, 100);
  
  
  for(int n = 0; n < 8; n++){
    
   array[n] = new Node(n, random(0.01, 49.49));
   arrayList.add(new Node(n, random(0.01, 49.49)));
    
  }
  
  println("\noriginal array:");
  for(int a = 0; a < array.length; a++){
    print(array[a].value + " "); 
  }
  
  heapA = new BinaryHeap(array, "min");
  heapA.printToConsole();
  heapA.remove(array[7]);
  heapA.printToConsole();
  
  println("\noriginal arrayList:");
  for(int al = 0; al < arrayList.size(); al++){
    print(arrayList.get(al).value + " "); 
  }
  
  heapB = new BinaryHeap(arrayList, "min");
  heapB.printToConsole();
  heapB.remove(arrayList.get(5));
  heapB.printToConsole();
  
}


