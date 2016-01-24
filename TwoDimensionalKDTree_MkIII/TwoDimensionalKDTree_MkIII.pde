/*

TWO DIMENSIONAL KD TREE
[based on Wikipedia article]

Balancing KD Tree is an alternative algorithm that builds a balanced k-d tree by presorting
the data in each of k dimensions prior to building the tree. 

KD Tree is more efficient from 'brute-force' going through all elements due building a graph tree and
comparing best distance (x2-x1)² + (y2-y1)² [without calculationg square root from it) to (nextNode.x - x1)² or
(nextNode.y - y1)², depending on the evaluatinng axis.


  initial array
  [n1][n2][n3][n4][.....][n9]

  'sorted' array through building KD Tree

  L, U pointers [indexers] 
         L                          U
  [n1][n4][n8][n9][.....][n2][n3][n7][n6]

  median = (L + U - 1) / 2
  
  Throughout the searching for # of neighbpurs, you have to compare
  the worst distance out of n-bests, while searching by radius —
  radius itself (r2).
 

KD Tree could have n-dimensions, however it is more effective in low-dimensions.

/http://jcgt.org/published/0004/01/03/paper.pdf/

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk
@year    2015

@license MIT License <http://www.opensource.org/licenses/mit-license.php>

REFERENCES & FURTHER READINGS:
https://en.wikipedia.org/wiki/K-d_tree
http://andrewd.ces.clemson.edu/courses/cpsc805/references/nearest_search.pdf
http://rosettacode.org/wiki/K-d_tree#Faster_Alternative_Version [nice set of algorithms]
http://christopherstoll.org/2011/09/k-d-tree-nearest-neighbor-search.html [Great visual explanation of distance search]

Orchard’s Algorithm (1991)
Principal Component Partitioning (PCP) (1999)

*/

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.SortedMap;
import java.util.TreeMap;

NodeList nodes = new NodeList();

/*

reference tree:   [11][185][224][57][261][366][324.13][265][257]
                  [27][59][213][296][314][324.01][360][367]
                  [377][378][413][444][581][491][435][529][431]
                  [423][530][565][542][576]
                  
*/

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

PVector velocity;
Node[] neighbours = new Node[3];

void setup(){
  
  size(600, 600, "processing.core.PGraphicsRetina2D");
  frameRate(30);

  velocity = new PVector(random(-4, 4), random(-4, 4));
  
  for(int n = 0; n < 32; n++){  
    nodes.add(new Node(n, references[n][0],  references[n][1], new PVector(0, 0)));
    //nodes.add(new Node(n, (int)random(0, 800), (int)random(0, 800), new PVector(random(0, 0), random(0, 0))));
  }
  
  snitch = new Node(-1, 212.2, 333.95, new PVector(0, 0));

}

void draw(){
  
  background(49);
  
  nodes.update();
  nodes.display(255, 1, 0);
 
  //KDTree(NodeList nodes_, int level, Node parent_)
  KDTree tree = new KDTree(nodes, 0);
  //tree.displayTree();
  
  sentinels = tree.neighboursByK(snitch, 3);
  
  stroke(128, 0, 128);
  strokeWeight(10);
  point(snitch.x, snitch.y);
  
  for(int s = 0; s < sentinels.size(); s++){
    
    Node tmp = (Node)sentinels.get(s);
    strokeWeight(1);
    stroke(255);
    line(snitch.x, snitch.y, tmp.x, tmp.y);
    
  }
 
 if(snitch.x < 0 || snitch.x > width) velocity.x *= -1;
 if(snitch.y < 0 || snitch.y > height) velocity.y *= -1;
 
 snitch.x += velocity.x; snitch.y += velocity.y;
 Node nn = new Node(0, 0.0, 0.0, new PVector(0, 0));
  
      // HashMap<Float, Integer> unsortedNeighbours = new HashMap<Float, Integer>();
      // 
      // float minDist = Float.MAX_VALUE;
      // 
      // for(int n = 0; n < nodes.size(); n++){
      //    Node tmp = (Node)nodes.get(n);
      //    unsortedNeighbours.put(dist(snitch.x, snitch.y, tmp.x, tmp.y), n);   
      //  }
      //  
      //  //println("unsorted:", unsortedNeighbours);
      //  SortedMap<Float, Integer> sortedNeighbours = new TreeMap<Float, Integer>();
      //  SortedMap<Float, Integer> radialNeighbours = new TreeMap<Float, Integer>();
      //  
      //  sortedNeighbours.putAll(unsortedNeighbours);
      //  //println("sorted:", sortedNeighbours);
      //  
      //  /*
      //  
      //  java.util.SortedMap:
      //
      //  subMap(K fromKey, K toKey): Returns a view of the portion of this Map whose keys 
      //                              range from fromKey, inclusive, to toKey, exclusive.
      //  headMap(K toKey): Returns a view of the portion of this Map whose keys are strictly 
      //                    less than toKey.
      //
      //  tailMap(K fromKey): Returns a view of the portion of this Map whose keys are greater 
      //                      than or equal to fromKey.
      //  
      //  */
      //  
      //  //by radius
      //  
      //   float RAD = 75.0;
      //   radialNeighbours = sortedNeighbours.headMap(RAD);
      //   Integer[] R = radialNeighbours.values().toArray(new Integer[radialNeighbours.size()]);
      //   
      //   for(int r = 0; r < radialNeighbours.size(); r++){
      //      Node tmp = (Node)nodes.get(R[r]);
      //      noFill();
      //      strokeWeight(1.0);
      //      stroke(255, 255, 0);
      //      ellipseMode(CENTER);
      //      ellipse(snitch.x, snitch.y, RAD * 2, RAD * 2);
      //      strokeWeight(2.0);
      //      line(snitch.x, snitch.y, tmp.x, tmp.y);
      //  }
      //  
      //  
      //  //by K (# of neighbours)
      //  int N = 5;
      //  Integer[] K = sortedNeighbours.values().toArray(new Integer[N]);
      //  
      //  for(int k = 0; k < N; k++){
      //      Node tmp = (Node)nodes.get(K[k]);
      //      stroke(255, 0, 255);
      //      strokeWeight(2.0);
      //      line(snitch.x, snitch.y, tmp.x, tmp.y);
      //  }
  
  fill(255, 0, 255);
  text("K: by # of neighbours", 20, 20);
  fill(255, 255, 0);
  text("radius: by radius", 150, 20);
  
  //noLoop();
  
}



