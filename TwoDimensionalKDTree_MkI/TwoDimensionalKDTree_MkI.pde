/*

TWO DIMENSIONAL KD TREE
[based on Wikipedia article]

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk
@year    2015

@license MIT License <http://www.opensource.org/licenses/mit-license.php>

REFERENCES & FURTHER READINGS:
https://en.wikipedia.org/wiki/K-d_tree
http://rosettacode.org/wiki/K-d_tree#Faster_Alternative_Version
http://andrewd.ces.clemson.edu/courses/cpsc805/references/nearest_search.pdf

Orchard’s Algorithm (1991)
Principal Component Partitioning (PCP) (1999)

*/

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;


NodeList nodes = new NodeList();

void setup(){
  
  size(800, 800);
  frameRate(60);
  
  for(int n = 0; n < 90240; n++){
    
    nodes.add(new Node(n, (int)random(0, 780), (int)random(0, 780), new PVector(random(-1.5, 1.5), random(-1.5, 1.5))));
    
  }


}

void draw(){
  
  background(49);
  
  nodes.update();
  //nodes.display(255, 1, 10);
  
  //KDTree(NodeList nodes_, int level, Node parent_)
  KDTree tree = new KDTree(nodes, 0, null, null);
  
  
}



