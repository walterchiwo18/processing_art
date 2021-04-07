import processing.sound.*;

FFT freqAnal;
SoundFile getJams;

float x,y,modAngle,nAngle,dAngle,radius;
int bands = 512; 

float[] spectrum = new float[bands];

void setup()
{
  size(displayWidth,displayHeight);
  
  getJams = new SoundFile(this,"letibang3.wav");
  freqAnal = new FFT(this,bands);
  
  getJams.play();
  freqAnal.input(getJams);
  
  dAngle = 36;
  nAngle = 3;
  //frameRate(60);
  
}

void draw()
{
  background(255);
  stroke(0);
  strokeWeight(5);
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
    dAngle += spectrum[i] * .0001;
  }
  
  endShape();
  
}
    
    
   
