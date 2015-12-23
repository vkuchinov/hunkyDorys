class VectorField{
  
  float w, h;       //width, height
  int cols, rows;   //grid parameter
  
  ArrayList<PVector> vectors = new ArrayList();
  
  //Perlin noise parameters
  float noiseValue;
  float noiseScale = 0.1;
    
  VectorField(float width_, float height_, int cols_, int rows_){
    
    w = width_; h = height_;
    cols = cols_; rows = rows_;
    
    float clusterWidth = w / cols;
    float clusterHeight = h / rows;
   
    for(int r = 0; r < rows; r++){    //y
      for(int c = 0; c < cols; c++){  //x
        
        noiseValue = PI * noise((millis() + c) * noiseScale, (millis() + r) * noiseScale);
        vectors.add(PVector.fromAngle(noiseValue));
        
      }
    }
    
  }
  
  void draw(){
    
    int index = 0;
    float clusterWidth = w / cols;
    float clusterHeight = h / rows;
    
    for(int r = 0; r < rows; r++){    //y
      for(int c = 0; c < cols; c++){  //x
        
        drawArrow(vectors.get(index).heading(), c * clusterWidth, r * clusterHeight);
        index++;
      }
    }
    
  }
  
  void applyForceTo(Agent a_, float mult_){
    
    float dist = 9999;
    PVector force = new PVector();
    PVector source = new PVector(a_.x, a_.y);

    int index = 0;
    float clusterWidth = w / cols;
    float clusterHeight = h / rows;
    PVector tmp = new PVector();
    
    for(int r = 0; r < rows; r++){    //y
      for(int c = 0; c < cols; c++){  //x
        
        PVector dest = new PVector(c * clusterWidth, r * clusterHeight); 
        if( source.dist(dest) < dist && source.dist(dest) != 0) { dist = source.dist(dest);  force = new PVector(vectors.get(index).x, vectors.get(index).y);  tmp.x = c*clusterWidth; tmp.y = r*clusterWidth;}
        index++; 
  
      }
    }
    
    strokeWeight(5);
    stroke(255, 0, 255);
    point(tmp.x, tmp.y);
        
    force.mult(1.0);
    PVector guide = PVector.sub(force, a_.velocity);
    guide.limit(0.4); //limit
    a_.updateWithForce(guide); 
    
  }
  
  void drawArrow(float angle_, float x1_, float y1_){
  
  stroke(32, 128, 255);
  strokeWeight(1);
  float x2 = x1_ + sin(angle_) * 12.0;
  float y2 = y1_ + cos(angle_) * 12.0;
  line(x1_, y1_, x2, y2);
  float x3 = x2 + sin(angle_ + 2.70) * 4.0;
  float y3 = y2 + cos(angle_ + 2.70) * 4.0;
  line(x2, y2, x3, y3);
  float x4 = x2 + sin(angle_ - 2.70) * 4.0;
  float y4 = y2 + cos(angle_ - 2.70) * 4.0;
  line(x2, y2, x4, y4);
  
  stroke(0);
  strokeWeight(2);
  point(x1_, y1_); 
    
  }

}

