/*

ARCSEGMENT CLASS
ideal for Circular Relationship Diagrams [Radial Convergence]

LOTS OF VISUAL REFERENCES:
https://www.google.ru/search?q=circular+relationship+diagram&newwindow=1&espv=2&biw=1078&bih=670&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjYl5amrt7JAhXFLHIKHad7DsgQ_AUIBigB

INTERESTING FACT TO HACK:

int: either CORNER, CORNERS, CENTER, or RADIUS where:

            CORNER:   0
            CORNERS:  1
            CENTER:   3
            RADIUS:   2
            
            TOP:      101
            BOTTOM:   102
            LEFT:     37
            RIGHT:    39
            
            BASELINE: 0?
            
            CLOSE:            2
            POINTS:           3
            LINES:            5
            TRIANGLES:        9
            TRIANGLE_STRIP:   10
            TRIANGLE_FAN:     11
            QUADS:            17
            QUAD_STRIP:       18
            
            Pardon! What is between 0-1, 4, 6-8, 12-16?
            
  @author Vladimir V. KUCHINOV
  @email  helloworld@vkuchinov.co.uk
            
*/

ArcSegmentList arcs = new ArcSegmentList();

void setup(){
  
  size(800, 800, "processing.core.PGraphicsRetina2D"); 
  
  String[] captions = loadStrings("captions.txt");
  randomCircularDistribution(arcs, captions, 12, 8.0, 128.0, 2.0);
  
}

void draw(){
  
 background(64);
 translate(width/2, height/2);
 
 for(int r = 0; r < 15; r++){
  
 int rand1 = (int)random(0, arcs.size());
 int rand2 = (int)random(0, arcs.size());
 
 ArcSegment current = (ArcSegment)arcs.get(rand1);
 ArcSegment partner = (ArcSegment)arcs.get(rand2);
 if(rand1 != rand2) current.drawRelationshipWith(partner);
 
 }
 
 arcs.render(1024);
 
 noLoop();
 
}

void randomCircularDistribution(ArcSegmentList arcs_, String[] captions_, int segments_, float min_, float max_, float gap_){
  

  //lengths array
  ArrayList<Float> lengths = new ArrayList();
  
  float totalLength = 0.0;
  
  for(int l = 0; l < segments_; l++){
    
    float randLength = random(min_, max_);
    lengths.add(randLength);
    
    totalLength += randLength;
    
  }
  
  float limits = 360.0 - gap_ * segments_;
  float ratio = limits / totalLength;
  
  //normalize lengths
  for(int l = 0; l < lengths.size(); l++){
    
    lengths.set(l, lengths.get(l) * ratio);
    
  }
  
    float position = 0.0;
    
    for(int s = 0; s < segments_; s++){

    // ArcShape(float radius_, float position_, float length_, float width_, String caption_, int mode1_, int mode2_)
    ArcSegment segment = new ArcSegment(300.0, position + lengths.get(s)/2, lengths.get(s), 16.0, captions_[(int)random(0, captions_.length)], CENTER, CENTER);
    arcs_.add(segment);
    
    position += lengths.get(s) + gap_;
    
    }

}
