class ComplexGraph{
  
  float offset = 50.0;              //margins
  
  float minX, maxX, minY, maxY;     //dimensions
  float xRange = 3;                 //means -3, 3
  float yRange = 3;                 //means -3, 3

  float resolution = 0.1;         //resolution
  
  ArrayList<ArrayList> dataset = new ArrayList<ArrayList>();
  float minValueX =  Float.MAX_VALUE;
  float maxValueX = -Float.MAX_VALUE;
  float minValueY =  Float.MAX_VALUE;
  float maxValueY = -Float.MAX_VALUE;
  
  
  ComplexGraph(int xRange_, int yRange_, float resolution_){
    
     xRange = xRange_; yRange = yRange_;
     resolution = resolution_;
    
  }
  
  ComplexGraph(float minX_, float maxX_, float minY_, float maxY_, float resolution_){
    
     xRange = maxX_ - minX_; minX = minX_; maxX = maxX_; 
     yRange = maxY_ - minY; minY = minY_; maxY = maxY_;
     resolution = resolution_;
    
  }
  
  Complex f(Complex z_){
    
    //f(z) = z*(z+5)
    //f(z) = add(mult(z, z), mult([5, 5], z))) ????
    //Complex w = z_.times(z_).plus(new Complex(5, 5).times(z_));
    //w.plus(right);
    
    //sqrt root formula
    //±r√(cos(θ/2)+isin(θ/2))
    float modulusW = sqrt((float)z_.modulus());
    float argW = (float)z_.argument() / 2;
    
    Complex w2 = new Complex(z_, modulusW, argW);
    
    return w2;
    
  }
  
  void buildData(){
    
    
//    if(minX != 0){
//      for(float y = - yRange; y < yRange; y += resolution){
//        for(float x = - xRange; x < xRange; x += resolution){
//        
//          Complex dot = new Complex(x, y);
//          point((float)dot.modulus()*100.0, (float)dot.argument()*100.0);
//          
//        }
//      }
//    }
//    else
//    {
  
      for(float y = minY; y < maxY; y += resolution){
        
        dataset.add(new ArrayList<Complex>());
        for(float x = minX; x < maxX; x += resolution){
        
          Complex z = new Complex(x, y);
          Complex w = f(z);
          
          float valueX = (float)w.re();
          float valueY = (float)w.im();
          
          if(valueX < minValueX) { minValueX = valueX; } 
          if(valueX > maxValueX) { maxValueX = valueX; }
          if(valueY < minValueY) { minValueY = valueY; } 
          if(valueY > maxValueY) { maxValueY = valueY; }
       
          dataset.get(dataset.size() - 1).add(w);
          
        }
      }

      println(minValueX, maxValueX, minValueY, maxValueY);
    
  }
  
  void renderPlot(){
    
    for(int a = 0; a < dataset.size(); a++){
       for(int aa = 0; aa < dataset.get(a).size(); aa++){ 
      
         PVector dot = (PVector)dataset.get(a).get(aa);
         point(map(dot.x, minValueX, maxValueX, 50, 750), map(dot.y, minValueY, maxValueY, 750, 50));
       }
    }
    
  }
  
  void renderColorPlot(String type_){
    
    float max = -99999;
    float min = 99999;
    
    colorMode(HSB);
    noStroke();
    float tint = 0.0;
    
    for(float y = minY; y < maxY; y += resolution){
  
        for(float x = minX; x < maxX; x += resolution){

         //in JavaScript example real(x), imag(y);
         
         //Why?????
         float xx = x / 15.0 - 10.0;
         float yy = -y / 15.0 + 10.0;

         Complex z = new Complex(xx, yy);
         
         Complex w = f(z);
         
          float theta = (float)w.re() % (2.0 * PI); 
          
         if(type_ == "Re(z)") {  theta = (float)w.re() % (2.0 * PI); }
         if(type_ =="Im(z)") {  theta = (float)w.im() % (2.0 * PI); }
         if(type_== "|z|") {  theta = (float)w.modulus() % (2.0 * PI); }
         if(type_ == "arg()") { theta = (float)w.modulus() % (2.0 * PI);}
         
         if(theta < min) { min = theta; }
         if(theta > max) { max = theta; }
         
         float hue = (theta / (2.0 * PI)) * 6.0;
         int X = Math.abs(Math.round((1.0 - Math.abs(hue % 2.0 - 1.0)) * 255.0));
         
         
         
         colorMode(HSB);
         stroke(map(theta, 0, 3.76, 0, 255), 240, 240);
         strokeWeight(1.5);
         point(100 + x * 2, 100 + y * 2);
        
         //PVector dotA = (PVector)dataset.get(a - 1).get(aa);
         //vertex(map(dotA.x, minValueX, maxValueX, 50, 750), map(dotA.y, minValueY, maxValueY, 750, 50));
         
         //PVector dotB = (PVector)dataset.get(a).get(aa);
         //vertex(map(dotB.x, minValueX, maxValueX, 50, 750), map(dotB.y, minValueY, maxValueY, 750, 50));

        }
        }
    
        println(max, min);
  }
  
  
  void renderVectorPlot(){
    
    colorMode(HSB);
    noStroke();
    float tint = 0.0;
    
    for(float y = minY; y < maxY; y += resolution){
  
        for(float x = minX; x < maxX; x += resolution){

         //in JavaScript example real(x), imag(y);
         
         //Why?????
         float xx = x / 15.0 - 10.0;
         float yy = -y / 15.0 + 10.0;

         Complex z = new Complex(xx, yy);
         
         Complex w = f(z);
         
         // % (2.0 * PI) just shorten angle (380%360 = 20) within range of (         float theta = (float)w.modulus2() % (2.0 * PI); 

         stroke(255);
         strokeWeight(1.2);
         //float x2 = (100 + x * 2) + sin(theta) * 4.0;
         //float y2 = (100 + y * 2) + cos(theta) * 4.0;
         
         //line(100 + x * 2, 100 + y * 2, x2, y2);
        
         //PVector dotA = (PVector)dataset.get(a - 1).get(aa);
         //vertex(map(dotA.x, minValueX, maxValueX, 50, 750), map(dotA.y, minValueY, maxValueY, 750, 50));
         
         //PVector dotB = (PVector)dataset.get(a).get(aa);
         //vertex(map(dotB.x, minValueX, maxValueX, 50, 750), map(dotB.y, minValueY, maxValueY, 750, 50));

        }
        }
    
    
  }
  
  void showTheGrid(){
    
//    stroke(0);
//    strokeWeight(1);
//    line(offset, height/2, width - offset, height/2);
//    line(width/2 , offset, width/2, height - offset);
//  
//      if(xRange == yRange){
//        for(int x = -xRange; x < xRange; x++){
//          float xx = lerp(offset, width - offset, (1.0/(xRange*2))*(xRange + x));
//          line(xx, height/2 - 4, xx, height/2 + 4);
//          line(width/2 - 4, xx, width/2 + 4, xx);
//        }
//      }
//      else{
//        for(int x = -xRange; x < xRange; x++){
//          float xx = lerp(offset, width - offset, (1.0/(xRange*2))*(xRange + x));
//          line(xx, height/2 - 4, xx, height/2 + 4);
//        }
//          for(int y = -yRange; y < yRange; y++){
//          float yy = lerp(offset, height - offset, (1.0/(yRange*2))*(yRange + y));
//          line(width/2 - 4, yy, width/2 + 4, yy);
//        }
//      }
    
  }
  
}
