/*

COMPLEX GRAPH CLASS
based on my short complex numbers research @ Goldsmiths University

syntax: 

EXAMPLE TASK:
http://mathworld.wolfram.com/SquareRoot.html [Square Root]

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
The plot I want to test haz Z value as color (depth)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

MATHWORLD:
showComplexPlots(name,ReMin,ReMax,ImMin,ImMax): ComplexExp

REFERENCES:
http://lodev.org/jmat/jmat_demo.html
https://github.com/brandonpelfrey/complex-function-plot/wiki/Complex-Function-Plotter
http://jsfiddle.net/mUdDN/

@author Vladimir V. KKUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import processing.pdf.*;

ComplexGraph graph;

void setup(){
  
  size(800, 800, "processing.core.PGraphicsRetina2D");
  background(240);

  beginRecord(PDF, "output.pdf");
  background(0);
  graph = new ComplexGraph(0, 300.0, 0, 300.0, 2.0);

  graph.showTheGrid();
  //graph.buildData();
  
  //Re(z), Im(z), |z|, arg(z)      
  graph.renderColorPlot("Re(z)");      
  
  endRecord();
}

Complex multi(Complex a, Complex b){
 
        double re_ = a.re * b.re - a.im * b.im;
        double im_ = a.re * b.im + a.im * b.re;
        return new Complex(re_, im_);
  
}

Complex adding(Complex a, Complex b) {
               
        double real = a.re + b.re;
        double imag = a.im + b.im;
        return new Complex(real, imag);
    }
