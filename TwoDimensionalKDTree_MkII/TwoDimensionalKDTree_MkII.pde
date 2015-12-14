/*

TWO DIMENSIONAL KD TREE
[based on Wikipedia article]


Balancing KD Tree is an alternative algorithm that builds a balanced k-d tree by presorting
the data in each of k dimensions prior to building the tree. 

/http://jcgt.org/published/0004/01/03/paper.pdf/

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

float[][] references = { {257.9526, 380.8662}, 
  {565.4977, 157.5320},  
  {542.7793, 193.3902},
  {314.0684, 400.0766}, 
  {261.9826, 376.1036}, 
  {530.4284, 174.6587}, 
  {378.3098, 88.1655}, 
  {324.1388, 147.6710}, 
  {296.4321, 463.4872}, 
  {529.0425, 473.1980}, 
  {366.7882, 112.7689}, 
  {462.9328, 9.2664}, 
  {377.7776, 68.6286}, 
  {265.5078, 236.7077}, 
  {581.9706, 78.0470}, 
  {213.2108, 561.8515}, 
  {413.7150, 118.7549}, 
  {431.3435, 520.8666},
  {57.2137, 263.1099}, 
  {185.3347, 175.8975}, 
  {367.7584, 128.3530}, 
  {11.6270, 108.6101}, 
  {423.6242, 564.4209},
  {491.0883, 122.4879}, 
  {435.9529, 151.8938},
  {224.2711, 186.2244}, 
  {576.9618, 371.0994}, 
  {324.0146, 479.5997}, 
  {59.0902, 491.0174}, 
  {27.9754, 422.6564}, 
  {444.8548, 47.1749},
  {360.8674, 595.5452}};
  
Node snitch;
NodeList sentinels = new NodeList();

void setup(){
  
  size(800, 800);
  frameRate(30);
  
  for(int n = 0; n < 32; n++){
    
    nodes.add(new Node(n, references[n][0],  references[n][1], new PVector(0, 0)));
    //nodes.add(new Node(n, (int)random(0, 800), (int)random(0, 800), new PVector(random(-1.5, 1.5), random(-1.5, 1.5))));
  }

  snitch = new Node(-1, 212.2, 333.95, new PVector(0, 0));

}

void draw(){
  
  background(49);
  
  nodes.update();
  nodes.display(255, 1, 0);
 
  //KDTree(NodeList nodes_, int level, Node parent_)
  KDTree tree = new KDTree(nodes, 0, null, null);
  sentinels = tree.neighboursByK(snitch, 3);
  
  for(int s = 0; s < sentinels.size(); s++){
    
    Node tmp = (Node)sentinels.get(s);
    strokeWeight(1);
    stroke(255);
    line(snitch.x, snitch.y, tmp.x, tmp.y);
    
  }
  
}



