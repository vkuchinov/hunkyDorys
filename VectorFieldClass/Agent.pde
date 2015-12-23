class Agent extends PVector{
  
 PVector velocity = new PVector(0.0, 0.0);
 PVector accelerator = new PVector(0.0, 0.0);
 
 Agent(float x_, float y_){
  
  x = x_;
  y = y_;
  
 } 
 
  void update(){
   
   if(x < 0 || x > width) velocity.x *= -1;
   if(y < 0 || y > height) velocity.y *= -1;
   


 }
 
 void updateWithForce(PVector force_){
   
   accelerator.add(force_);

   velocity.add(accelerator);
   velocity.limit(3.0); // max speed
   
   accelerator = new PVector(0.0, 0.0);
   
   this.add(velocity);
   
   if(x < 0) x = width; if(x > width) x = 0;
   if(y < 0) y = height; if(y > height) y = 0;

 }
 
 void draw(){
   
   
   
   noStroke();
   fill(255, 0, 0);
   ellipseMode(CENTER);
   ellipse(x, y, 8, 8);
   
 }
 
 void drawArrow(float angle_, float x1_, float y1_){
  
  stroke(32, 128, 255);
  strokeWeight(1);
  float x2 = x1_ + sin(angle_) * 12.0;
  float y2 = y1_ + cos(angle_) * 12.0;
  line(x1_, y1_, x2, y2);

  }
  
}
