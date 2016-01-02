/*

Pass Function() as Parameter Example

*/

import java.lang.reflect.Method;
import java.lang.reflect.*;


void setup(){
 
  MethodDemo demo = new MethodDemo();
  
}

class MethodDemo{
  
  MethodDemo(){
  
  MethodDemo cls = new MethodDemo();
  Class c = cls.getClass();

   try {                
        // parameter type is null
        Method m = c.getMethod("show", null);
        println("method = " + m.toString());        
     }
    
     catch(NoSuchMethodException e) {
        println("error");
        println(e.toString());
     }
        
     try {
        
       Class[] m = new Class[1];
       m[0] = Long.class;
       Method lm = c.getMethod("showLong", m);
       println("method = " + lm.toString());
       
     }
     catch(NoSuchMethodException e) {
       println("error"); 
       println(e.toString());
     }
     
  
  
  }
  
  public int show() {
        return 1;
  }
   
  public void showLong(Long l) {
      //this.l = l;
   }
   
}
