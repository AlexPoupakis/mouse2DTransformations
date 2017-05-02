import mouse.transformed2D.*;

//Initialise library by creating an instance of MouseTransformed class
// (one instance necessary for each sketch window)
MouseTransformed mouse = new MouseTransformed(this);

Shape test1, test2, test3, test4;

void setup(){
  size(700,700);
  
  test1 = new Shape(200,300,100,100);
  test2 = new Shape(350,150,80,80);
  test3 = new Shape(0,0, 150,150);
  test4 = new Shape(100,50,30,30);
}

void draw(){
  background(255);
  
  //translate both animation & mouse matrix by specified offsets
  mouse.translate(150, 150);
  
  test2.display();
  fill(0);
  text("Shape test2", 355, 140);
  
  //scale both animation & mouse matrix
  mouse.scale(1.5, 1);
  
  test1.display();
  fill(0);
  text("Shape test1", 220, 290);
  
  //reverse the previous scale
  mouse.scale(1/1.5, 1);
  
  //push current animation & mouse transformation matrix onto the stack
  //(in other words, save current transformation matrix)
  mouse.pushMatrix();
  
  for(int i=0; i<30007; i++){
    //rotate animation & mouse transformation matrix
    mouse.rotate(-PI/4);
  }
  
  test3.display();
  fill(0);
  text("Shape test3", 40, -10);
  
  //pop current animation & mouse transformation matrix off the stack
  mouse.popMatrix();
  
  mouse.translate(-150, -150);
  
  test4.display();
  fill(0);
  text("Shape test2", 80, 40);
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
    //instead of mouseX & mouseY reserved keywords, use .mouseX() & .mouseY() to get the transformed coordinates
    // (follow the same logic as with mouseX & mouseY)
    if (mouse.mouseX() > x && mouse.mouseX() < x+sizeX && mouse.mouseY() > y && mouse.mouseY() < y+sizeY){
      fill(255);
    }
    else {
      fill(0);
    }
    stroke(255,0,0);
    rectMode(CORNER);
    rect(x, y, sizeX, sizeY);
  }
}