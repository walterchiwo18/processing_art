float circle,rot,freq = 0.0;
float dispW,dispH = 500;
void setup()
{
  size(500,500);
  freq = .000005;
  
  
}
void draw()
{
  background(0);
  translate(width/2,height/2);
  rotate(radians(rot));
  
  scale(2);
  //ellipseMode(RADIUS);
  for(int i = 0 ; i < 500; i++)
  {
    circle = 100 + 50*sin(millis()*freq*i);
 
    float r = map(circle,290,100,10,5);
    
    rect(cos(i)*circle,sin(i)*circle,r,r);
    
    rot += .0005;
  }
    
}
