/*

  getHeximals() method
  
  return char array fill with 0-9, A-F
  could be modified to feed an array with all 
  letters and any characters you like.
  
  SHORT & SIMPLE
  
  @author Vladimir V. KUCHINOV
  @email  helloworld@vkuchinov.co.uk

*/

void setup() {
  
  char[] chars = getHeximals();
  println(chars);
  
}

char[] getHeximals(){
  
  char[] output = new char[16];
  
  //0-9
  for(char c = '0'; c <= '9'; c++){
    output[(int)c - 48] = c;
  }

  //A-F
  for(char c = 'A'; c <= 'F'; c++){
    output[(int)c - 55] = c;
  }
  
  return output;
  
}
