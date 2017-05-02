# Mouse 2D-Transformations
Processing library used to transform a mouse matrix along with the animation matrix. Useful in GUI's and applications where knowledge of the mouse position in the animation matrix is necessary.
# Installation
Follow Processing's Contributed Library installation guide https://forum.processing.org/one/topic/how-to-install-a-contributed-library.html

# Example
Mouse2DTransformations/examples/mouseX_vs_library/mouseX_vs_library.pde
```Processing
//This is a clear and simple example which illustrates the use of this library
//
//Move the mouse over both squares and see what happens to the shape

import mouse.transformed2D.*;

//Initialise library by creating an instance of MouseTransformed class
// (one instance necessary for each sketch window)
MouseTransformed mouse = new MouseTransformed(this);

Shape test;

void setup(){
  size(500,500);
  
  test = new Shape(0,0,100,100);
}

void draw(){
  background(255);
  
  //where the Shape test would be if the matrix was not transformed before drawing the Shape
  rectMode(CORNER);
  stroke(180);
  noFill();
  rect(0,0,100,100);
  
  //translate both animation & mouse matrix by specified offsets
  mouse.translate(width/2, height/2);
  
  test.display();
  fill(0);
  text("Shape test", 20, -10);
}

class Shape{
  int x, y, sizeX, sizeY;
 
  Shape(int x, int y, int sizeX, int sizeY){
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
  }
 
  void display(){
    //use of transformed mouse coordinates to check if mouse is over the shape (if yes, make it white)
    if (mouse.mouseX() > x && mouse.mouseX() < x+sizeX && mouse.mouseY() > y && mouse.mouseY() < y+sizeY){
      fill(255);
    }
    //use of mouseX & mouseY reserved keywords to check if mouse is over the shape (if yes, make it blue)
    else if (mouseX > x && mouseX < x+sizeX && mouseY > y && mouseY < y+sizeY){
      fill(0,0,255);
    }
    else {
      fill(0);
    }
    stroke(255,0,0);
    rectMode(CORNER);
    rect(x, y, sizeX, sizeY);
  }
}
```
