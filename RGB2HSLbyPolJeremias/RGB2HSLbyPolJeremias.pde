/*

RGB TO HSL CONVERSION ALGORITHM by Pol Jeremias
http://www.poljeremias.com/branchless-rgb-to-hsl/
reverse-engenired for Processing/JAVA

REFERENCES: 
http://www.shaderific.com/glsl-functions/

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

void setup(){
 
     size(1200, 300); 
     
     PImage input = loadImage("input.jpg");
  
     image(input, 0, 0);
     
     PImage hue = createImage(300, 300, RGB);
     PImage saturation = createImage(300, 300, RGB);
     PImage light = createImage(300, 300, RGB);
     
     for(int y = 0; y < input.height; y++){
       for(int x = 0; x < input.width; x++){
      
              color p = input.get(x, y);
              PVector HSL = RGB2HSL(p);
              
              //hue.set(x, y, color(HSL.x, HSL.x, HSL.x));
              //saturation.set(x, y, color(HSL.y, HSL.y, HSL.y));
              //light.set(x, y, color(HSL.z, HSL.z, HSL.z));
              
              hue.set(x, y, color(hue(p),hue(p), hue(p)));
              saturation.set(x, y, color(saturation(p),  saturation(p), saturation(p)));
              light.set(x, y, color(brightness(p),brightness(p), brightness(p)));
              
              
       }
     }
     
     image(hue, 300, 0);
     image(saturation, 600, 0);
     image(light, 900, 0);
     
}


PVector RGB2HSL( color c_ )
{
    final float EPSILON = Math.ulp(1.0);
    
    float cmin = min( red(c_), min( green(c_), blue(c_)));
    float cmax = max( red(c_), max( green(c_), blue(c_)));
    
    float cd   = cmax - cmin;
    
    //x: H, y: S, z: L
    PVector hsl = new PVector(0.0, 0.0, 0.0);
    
    //shader mix() is a lineary interpolation between two values
    //shader step() generates a step function by comparing two values
    
    hsl.z = (cmax + cmin) / 2.0;
    hsl.y = mix(cd / (cmax + cmin + EPSILON), cd / (EPSILON + 2.0 - (cmax + cmin)), step(0.5, hsl.z));

    //PVector a = new PVector(1.0 - step(epsilon, Math.abs(cmax - c)));
    //a = mix(vec3(a.x, 0.0, a.z), a, step(0.5, 2.0 - a.x - a.y));
    //a = mix(vec3(a.x, a.y, 0.0), a, step(0.5, 2.0 - a.x - a.z));
    //a = mix(vec3(a.x, a.y, 0.0), a, step(0.5, 2.0 - a.y - a.z));
    
    //hsl.x = dot( new PVector(0.0, 2.0, 4.0) + ((c.gbr - c.brg) / (EPSILON + cd)), a );
    //hsl.x = (hsl.x + (1.0 - step(0.0, hsl.x) ) * 6.0 ) / 6.0;
    
    return hsl;
}
