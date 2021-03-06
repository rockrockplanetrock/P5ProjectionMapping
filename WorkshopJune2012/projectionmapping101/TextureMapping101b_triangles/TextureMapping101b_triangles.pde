import processing.opengl.*;


PImage myImage;
// these will represent the boundary of our rectangular
// image on screen
int startX, endX, startY, endY;

void setup()
{
  // set size and renderer
  size(320,240, OPENGL);
  
  // load my image
  myImage = loadImage("7sac9xt9.bmp");
  
  startX  = 0;
  endX    = myImage.width;
  startY  = 0;
  endY    = myImage.height;
  
}

void draw()
{
  // white background
  background(255);
 
  if (keyPressed)
  {
    // key was pressed - see if SHIFT was held
    if (key==CODED && keyCode==SHIFT)
    {
      endX = constrain(mouseX, 5,myImage.width);
      endY = constrain(mouseY, 5, myImage.height);
      fill(255);
      text("SHIFT", mouseX,mouseY);
    }
    else
    {
      startX = constrain(mouseX, 0,endX-5);
      startY = constrain(mouseY, 0,endY-5);;
    }
  }
  
  image(myImage, 0,0);
  
  // highlight area of image we are going to draw
  fill(255,40);
  rectMode(CORNERS);
  rect(startX,startY, endX,endY); 
  
  //  1 *---* 2
  //    |   |
  //  4 *---* 3 
  
  // this makes it zoom in and out:
  // translate(0,0, 50*cos(0.1*frameCount) );
  
  fill(0);
  beginShape(TRIANGLES);
  texture( myImage );
  vertex(mouseX, mouseY+20*sin(0.1*frameCount), startX,startY);
  vertex(mouseX+40, mouseY,    endX,startY);
  vertex(mouseX+40, mouseY+40+20*sin(0.1*frameCount), endX,endY);
  
  vertex(mouseX+40, 10+mouseY+40+20*sin(0.1*frameCount), endX,endY);
  vertex(mouseX, 10+mouseY+40,    startX,endY);
  vertex(mouseX, 10+mouseY+20*sin(0.1*frameCount), startX,startY);
  endShape(CLOSE);
}
