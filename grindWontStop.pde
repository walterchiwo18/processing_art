import processing.sound.*;



float radius,m,mChange;
int total;
PVector[][] globe;

FFT freqAnal; 
SoundFile getMusic;

int bands = 256; 
float[] spectrum = new float[bands];
int counter;


void setup()
{
  size(displayWidth,displayHeight,P3D);
  
  total = 75;
  globe = new PVector[total+1][total + 1];
  
  getMusic = new SoundFile(this,"gogetit.wav");
  freqAnal  = new FFT(this,bands);
  
  getMusic.play();
  freqAnal.input(getMusic);
  counter = 0;
  
  
  
}


float shapeChange(float theta, float m,float n1, float n2, float n3)
{
  float t1 = abs(cos(m * theta/4));
  t1 = pow(t1,n2);
  
  float t2 = abs(sin(m * theta/4));
  t2 = pow(t2,n3);
  
  float t3 = t1 + t2;
  
  float r = pow(t3, -1/n1);
  
  return r;
}

void draw()
{
  freqAnal.analyze(spectrum);
  
  background(0);
  translate(width/2,height/2);
  
  rotateX(45);
  rotateY(45);
  m = map(sin(mChange),-1,1,0,9);
  
  //fill(255);
  println(m);
  
  mChange += .1; //* spectrum[counter % spectrum.length];
  counter++;
  
  
  
  float r = 500; 
  
  
  for (int i = 0; i < total+1; i++)
  {
    float lat = map( i,0,total,-HALF_PI,HALF_PI);
    float r2 = shapeChange(lat,m,.2,1.7,1.7);
    
    for(int j = 0; j < total+1; j++)
    {
      float lon = map(j,0,total,-PI,PI);
      float r1 = shapeChange(lon,m,.2,1.7,1.7);
      
      float x,y,z;
      
      x = r * r1 * r2 * cos(lon) * cos(lat);
      y = r * r1 * r2 * cos(lat) * sin(lon);
      z = r * r2 * sin(lat);
      
      globe[i][j] = new PVector(x,y,z);
    }
  }
  
  for(int i = 0; i < total; i++)
  {
    stroke(255);
    beginShape();
    noFill();
    
    for(int j = 0; j < total+1; j++)
    {
      PVector v1 = globe[i][j];
      vertex(v1.x,v1.y,v1.z);
      
      
      PVector v2 = globe[i+1][j];
      vertex(v2.x,v2.y,v2.z);
    }
      endShape();
      
  }
}
     
  
  
  
  
