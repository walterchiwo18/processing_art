import toxi.math.noise.SimplexNoise;
import processing.sound.*;


FFT fft;
SoundFile getTunes;

SimplexNoise simplex;

int bands = 1024;
int c = 90;
int size = 400;
int specCount = 0 ;



float a; 
double x,y,ns,ts;

float xLoc,yLoc;
float[] spectrum = new float[bands];


PVector[] verts = new PVector[c];

void setup()
{
  size(displayWidth,displayHeight);
  simplex = new SimplexNoise();
  
  fft = new FFT(this,bands);
  getTunes = new SoundFile(this,"sameShackles.wav");
  
 
 fft.input(getTunes);
 getTunes.play();
  
  ns = .03;
  ts = .005;
 
}

void draw()
{
  background(255);
  translate(width/2,height/2);
  noFill();
  
  
  
  stroke(0);
  strokeWeight(2);
  
  beginShape();
  fft.analyze(spectrum);
  {
    for(int i = 0; i < spectrum.length; i++)
    {
      a = i/c * TWO_PI;
      x = simplex.noise(cos(a)*ns,sin(a)*ns,1.5+frameRate*ts,i*.01)*size;
      y = simplex.noise(cos(a)*ns,sin(a)*ns,2.5+frameRate*ts,i*.01)*size;
      xLoc = (float)x;
      yLoc = (float)y;
      
      vertex(-xLoc,yLoc);
      //verts[i] = new PVector(xLoc,yLoc);
      ns += spectrum[i]*.0009;
    }
  endShape();
  }
    beginShape();
  {
    for(int i = 0; i < spectrum.length; i++)
    {
      a = i/c * TWO_PI;
      x = simplex.noise(cos(a)*ns,sin(a)*ns,1.5+frameRate*ts,i*.01)*size;
      y = simplex.noise(cos(a)*ns,sin(a)*ns,2.5+frameRate*ts,i*.01)*size;
      xLoc = (float)x;
      yLoc = (float)y;
      
      vertex(xLoc,yLoc);
      //verts[i] = new PVector(xLoc,yLoc);
      
    }
  endShape();
  
  }
  
  
  
  
  
  
  specCount++;
  //stroke(255);
  //noFill();
  //beginShape();
  //for(int i = 0; i < verts.length; i++)
  //{
  //  vertex(-verts[i].x,verts[i].y);
  //}
  //endShape();
  //beginShape();
  //for(int i = 0; i < verts.length; i++)
  //{
  //  vertex(verts[i].x,verts[i].y);
  //}
  //endShape();
  
  
  

}
