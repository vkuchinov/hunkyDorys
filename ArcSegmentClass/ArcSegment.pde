class ArcSegmentList extends ArrayList{
  
  void render(int res_){
    
    for(int s = 0; s < this.size(); s++){
      
       ArcSegment current = (ArcSegment)this.get(s);
       current.setResolution(res_);
       current.draw();
      
    }
    
  }
  
}

class ArcSegment{
 
 float position;
 int tint = (int)random(0, 255);
 
 String caption;
 float resolution = 360.0;
 
 int[] mode = new int[2];
 
 float radius, innerRadius, outerRadius;
 float len, startAngle, endAngle;
 
 //position&length: degrees, width: pixels
 ArcSegment(float radius_, float position_, float length_, float width_, String caption_, int mode1_, int mode2_){
 
 radius = radius_;
 innerRadius = radius_ - width_ / 2;
 outerRadius = radius_ + width_ / 2;
 caption = caption_;
 
 //0: along radius [LEFT, CENTER, RIGHT], 1: along edge [TOP, CENTER, BOTTOM]
 mode[0] = mode1_; mode[1] = mode2_;
 
 len = length_;
 position = position_;
 startAngle = position_ - length_ / 2;
 endAngle = position_ + length_ / 2;
 
 //translatePosition();
 
 } 
  
 void draw(){

 colorMode(HSB);
 noStroke();
 fill(tint, 240, 240, 192);
 
 beginShape();
   
    for(float p = startAngle; p < endAngle; p += 360.0 / resolution){
   
    vertex(sin(radians(p)) * outerRadius, cos(radians(p)) * outerRadius);
   
    }
    
    for(float p = endAngle; p > startAngle; p -= 360.0 / resolution){
   
    vertex(sin(radians(p)) * innerRadius, cos(radians(p)) * innerRadius);
   
    }
 
 endShape(CLOSE);
   
 drawPositionPoint();
 
 }
 
 void drawPositionPoint(){
   
 stroke(255);
 strokeWeight(8);
 point(sin(radians(position)) * radius, cos(radians(position)) * radius);
 
 pushMatrix();
 translate(sin(radians(position)) * radius, cos(radians(position)) * radius);
 fill(255);
 PVector pos = new PVector(sin(radians(position)) * radius, cos(radians(position)) * radius);
 if(position < 180) rotate(pos.heading());  else  rotate(PI + pos.heading()); 
 textSize(10);
  if(position < 180) { textAlign(LEFT, CENTER); text(caption, 20, 0); } else { textAlign(RIGHT, CENTER); text(caption, -20, 0); }
 popMatrix();
 
 }
 
 void setResolution(float res_){
   
  resolution = res_;
   
 }
 
 void drawRelationshipWith(ArcSegment partner_){
 
 colorMode(HSB);
 noStroke();
 fill(tint, 240, 240, 192);
 
 beginShape();
 
 for(float p = startAngle; p < endAngle; p += 360.0 / resolution){
   
    vertex(sin(radians(p)) * innerRadius * 0.98, cos(radians(p)) * innerRadius * 0.98);
   
 }
 
 addVertices(this.endAngle, this.innerRadius * 0.98, partner_.startAngle, partner_.innerRadius * 0.98, 128);
 
 for(float p = partner_.startAngle; p < partner_.endAngle; p += 360.0 / resolution){
   
    vertex(sin(radians(p)) * innerRadius * 0.98, cos(radians(p)) * innerRadius * 0.98);
   
 }

 addVertices(partner_.endAngle, partner_.innerRadius * 0.98, this.startAngle, this.innerRadius * 0.98, 128);
 
 endShape(CLOSE);
   
 }
 
 void addVertices(float a1_, float radius1_, float a2_, float radius2_, int steps_){
   
   for(int s = 0; s < steps_; s++){
     
     float x1 = sin(radians(a1_)) * radius1_; 
     float y1 = cos(radians(a1_)) * radius1_;
     float x2 = sin(radians(a2_)) * radius2_; 
     float y2 = cos(radians(a2_)) * radius2_;
     
     float pos_ = map(s, 0, steps_, 1.0, 0.0);
     
     float x = x1 * pow(pos_, 2) + 0.0 * 2 * pos_ * (1 - pos_) + x2 * pow(1 - pos_, 2);
     float y = y1 * pow(pos_, 2) + 0.0 * 2 * pos_ * (1 - pos_) + y2 * pow(1 - pos_, 2);
     
     vertex(x, y);
     
   }
   
 }
 
 void translatePosition(int[] mode){
   
    //IN TODO LIST
    
    //    var var1 = "something";
    //    var var2 = "something_else";
    //    switch(var1 + "|" + var2) {
    //        case "something|something_else":
    //            ...
    //            break;
    //        case "something|...":
    //            break;
    //        case "...|...":
    //            break;
    //    }

   
 }
  
}



