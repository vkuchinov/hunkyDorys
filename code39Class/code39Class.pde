Code39 barcode;

void setup(){
 
   size(500, 200); 
   barcode = new Code39(50, 50, 400, 100, "THIS IS CODE 39", 2);
  
   barcode.draw();
}
