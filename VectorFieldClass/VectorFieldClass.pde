/*

VECTOR FIELD CLASS
[based on Perlin noise]

There are several options of applying vector field to object.
Could be single vector force (squared, circular), grouped with calculating average force
and etc.

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

VectorField field;
Agent agent;

void setup(){
  
   size(900, 700, "processing.core.PGraphicsRetina2D"); 
  
   agent = new Agent(width/2, height/2);
   field = new VectorField(width, height, 90, 70);

}
  
void draw(){
  
    background(240);
    field.draw();
    field.applyForceTo(agent, 1.0); // (obj, force multiplier)
    agent.draw();
  
}

