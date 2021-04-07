float dVariable,nVariable,kVariable;
float xPosition,yPosition;
float radius;

//waveIdea
int pixelColor;


void setup()
{
   size(displayWidth,displayHeight);
   
   dVariable = 23;
   nVariable = 7;
   
   //waveIdea
   pixelColor = color(0,0,0);
   
}

void draw()
{
  //translate(width/2,height/2);
  background(255);
  
  stroke(0);
  //beginShape();
  loadPixels();
  
  for(int i = 0; i < 700; i++)
  {
    kVariable = i * dVariable;
    radius = 400 * sin(nVariable*kVariable);
    xPosition = radius * cos(kVariable);
    yPosition = radius * sin(kVariable);
    
    
    
    //waveIdea
    if(xPosition>0 && yPosition > 0)
    {
      //pixels[(((int)xPosition)+((int)yPosition))*width] = pixelColor;
      //pixels[((int)xPosition)*((int)yPosition)*width/100] = pixelColor;  
  }
  }
  
  updatePixels();
  //endShape();
  dVariable+=.001;
}
