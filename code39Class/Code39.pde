class Code39{
   
     PVector position;
     int w, h, ratio;
     String caption;
     
     ArrayList<Integer> data = new ArrayList();
     
     //dictioary
     String map = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%";
     HashMap<Character,Integer> dictionary = new HashMap<Character,Integer>();
     
     String[] codes = {
     "000110100","100100001","001100001","101100000","000110001","100110000","001110000","000100101",
     "100100100","001100100","100001001","001001001","101001000","000011001","100011000","001011000",
     "000001101","100001100","001001100","000011100","100000011","001000011","101000010","000010011",
     "100010010","001010010","000000111","100000110","001000110","000010110","110000001","011000001",
     "111000000","010010001","110010000","011010000","010000101","110000100","011000100","010010100",
     "010101000","010100010","010001010","000101010"};
     
     Code39(int x_, int y_, int w_, int h_, String caption_, int ratio_){
       
           position = new PVector(x_, y_);
           w = w_; h = h_; ratio = ratio_;
           caption = caption_;
           
           //filling dictionary
           for(int d = 0; d < map.length(); d++){
                dictionary.put(map.charAt(d), d);
           }
           
           //parsing data
           for(int c = 0; c < caption.length(); c++){
             
             String charCode = codes[dictionary.get(caption.charAt(c))];
             for(int cc = 0; cc < 9; cc++) { data.add(49 - (int)(charCode.charAt(cc))); }
           }
      
           println(data);
     } 
     
     void draw(){
       
         noStroke();
         fill(0);
         
         for(int d = 0; d < data.size(); d++){
          
              if(data.get(d) == 1){
               
                fill(0);
                rect(50 + d*3, 50, 3, 100);
                 
              } 

         }
       
     }
  
}
