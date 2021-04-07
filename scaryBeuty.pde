float lon,lat;
float radius;
float x,y,z;

float rotateRate;


int total;
PVector[][] globePoints;
PVector coors;
PVector coorsTwo;

//superShape Variables
float termSum,termOne,termTwo;
float superRadius;

float radiusOne, radiusTwo;
int count;



// music Variables
import processing.sound.*;
FFT freqAnal;
SoundFile getTunes;
int bands;
float[] spectrum;

int musicMod;



void setup()
{
  size(displayWidth,displayHeight,P3D);
  total = 20;
  radius = 300;
  
  rotateRate = 2.9;
  
  globePoints = new PVector[total+1][total+1];
  
  count = 1;
  
  //music varibables
  bands = 512;
  freqAnal = new FFT(this,bands);
  spectrum = new float[bands];
  getTunes = new SoundFile(this,"scaryBeauty.wav");
  
  getTunes.loop();
  freqAnal.input(getTunes);
  
  
  
  
}

void makeCircle()
{
  
    
  for(int i = 0; i < total+1; i++)
  {
    lat = map(i,0,total,-HALF_PI,HALF_PI);
    radiusTwo = superShape(lat,cos(count)*100,10,20,10);
    //radiusOne = sin(count);
    for(int j = 0; j < total+1; j++)
    {
      
      lon = map(j,0,total,-TWO_PI,TWO_PI);
      radiusOne = superShape(lon,j,2,2,2);
      
      x = radius * cos(lat) * sin(lon) * radiusOne * radiusTwo;
      y = radius * cos(lat) * cos(lon) * radiusOne * radiusTwo;
      z = radius * sin(lat) * radiusTwo;
      
      globePoints[i][j] = new PVector(x,y,z);
      

    }
  }
}

void drawCircle()
{
  //rotate(musicMod+=.1);
  if (rotateRate < 3.14)
  {
    rotateX(rotateRate+=.001);
    rotateY(rotateRate);
  }
  
  else
  {
    rotate(rotateRate+=.001);
  }
  
  for(int i = 0; i < total; i++)
  {
    stroke(255);
    strokeWeight(2);
    noFill();
    beginShape(TRIANGLE_STRIP);
    for(int j = 0; j < total +1 ; j++)
    {
      coors = globePoints[i][j];
      vertex(coors.x,coors.y,coors.z);
      
      coorsTwo = globePoints[i+1][j];
      vertex(coorsTwo.x,coorsTwo.y,coorsTwo.z);
    }
    endShape();
  }
}
float superShape(float latLon, float m, float num1, float num2, float num3)
{
  termOne = abs(sin(latLon*m));
  termOne = pow(termOne,num2);
  
  termTwo = abs(cos(latLon*m));
  termTwo = pow(termTwo,num3);
  
  termSum = termOne + termTwo;
  termSum = pow(termSum,-1/num1);
  
  superRadius = termSum;
  
  return superRadius;
}




void draw()
{
  
  background(0);
  freqAnal.analyze(spectrum);
  
  count+= .01;
  musicMod += spectrum[count%spectrum.length] * 100;
  
  text(rotateRate,200,200);
  text(spectrum[count%spectrum.length]*100,200,220);
  text(float(count),200,240);
  
  translate(width/2,height/2);
  makeCircle();
  drawCircle();
  
  
  
  
}

      
