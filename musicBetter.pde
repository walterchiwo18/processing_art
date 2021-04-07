import processing.sound.*;

float freq; 
SoundFile musicPlay; 
FFT freqAnal; 
int bands = 256;
float[] spectrum = new float[bands];


void setup()
{
  size(800,800);
  background(0);
  freq = .00001;
  
  musicPlay = new SoundFile(this,"Scarface - The World Is Yours Scene.mp3");
  freqAnal = new FFT(this, bands);
  
  freqAnal.input(musicPlay);
  musicPlay.play();
  
}

void draw()
{
  freqAnal.analyze(spectrum);
  background(0);
  
  stroke(255);
  noFill();
  //strokeWeight(1);
  scale(2);
  
  translate(width/4,height/4);
  //beginShape();
  for(int i = 0; i < 500; i++)
  {
    float circle = 100+50*sin(freq*millis()*i);
    float r = map(circle,0,100,1,100);
    //rect(circle*sin(spectrum[i]),circle*cos(spectrum[i]),r,r);
    rect(cos(i)*circle,sin(i)*circle,r,r);
  }
  //endShape();
  
}
