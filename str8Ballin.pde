float circle;
float rot;
float freq;

void setup()
{
  size(displayWidth,displayHeight);
  freq = .000001;
  
}
void draw()
{ 
  background(0);
  translate(displayWidth/2,displayHeight/2);
  stroke(255);
  noFill();
  beginShape();
  for(int i = 0; i < 500; i++)
  {
  circle = 600*sin(millis()*freq*i);
  vertex(circle*cos(i), circle*sin(i));
  }
  endShape();
}  
