/*

COLOR HARMONY CHECKER [HSB]

Experimental swatches for 2-colors project

*/

int steps = 8;

void setup(){
  
  size(360, 400);
  
  for(int s = 0; s < steps; s++){
    
    colorMode(HSB);
    
    float A = map(s, 0, steps, 0, 128);
    color colorA = color(A, 240, 240);
    noStroke(); fill(colorA);
    rect(0, height/steps*s, 120, height/steps);
    
    float B = map(s, 0, steps, 128, 255);
    color colorB = color(B, 240, 240);
    noStroke(); fill(colorB);
    rect(120, height/steps*s, 120, height/steps);
    
    //A + B / φ : using golden ratio to amplify harmony 
    //in a result
 
    color colorC = color((A + B)/1.6180, 240, 240);
    noStroke(); fill(colorC);
    rect(240, height/steps*s, 120, height/steps);
    
    
  }
  
}
