/*

SORTING PVECTORS BY DIFFERENT PARAMETERS
[based on JAVA java.util.Collection]

Syntax: Collections.sort(ListName, compose(new sortByX(), new sortByY()));

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

Could be extended to third parameter easily,
just add another children to 'compose' superclass

*/

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

NodeList nodes = new NodeList();

void setup(){
  
  size(64, 64);
  
  for(int n = 0; n < 128; n++){
    
    nodes.add(new Node(n, (int)random(0, 64), (int)random(0, 64)));
    
  }
  
  println("unsorted:");
  nodes.print();
  
  Collections.sort(nodes, compose(new sortByY(), new sortByZ()));
  println("sorted by XY:");
  nodes.print();
  
}
