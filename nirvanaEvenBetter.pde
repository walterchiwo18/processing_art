import processing.sound.*;

FFT freqAnal;
SoundFile getJams;

float x,y,modAngle,nAngle,dAngle,radius;
int bands = 128; 

float[] spectrum = new float[bands];

void setup()
{
  size(displayWidth,displayHeight);
  
  getJams = new SoundFile(this,"nirvanaNicest.wav");
  freqAnal = new FFT(this,bands);
  
  getJams.play();
  freqAnal.input(getJams);
  
  dAngle = 71;
  nAngle = 6;
  //frameRate(60);
  
}

void draw()
{
  background(0);
  stroke(255);
  strokeWeight(3);
  noFill();
  
  beginShape();
  translate(width/2,height/2);
  
  freqAnal.analyze(spectrum);
  
  for(int i = 0; i < spectrum.length; i++)
  {
    modAngle = i * dAngle; 
    radius = 400 * sin(modAngle * nAngle);
    
    x = cos(i)*radius;
    y = sin(i)*radius;
    vertex(x,y);
    dAngle += spectrum[i] * .0001;//2;
  }
  
  endShape();
  
}
    
    
   
