/*
  Walter Chiwo
  03/19/2020
  Marionette - Seth Witcher
*/


// sphere Variables
PVector[][] globePoints;
PVector coors;
PVector coorsTwo;

float lat,lon;
float x,y,z;


int numOfParticles;
int sphereRadius;

// sphereRotation Variables
float rotateRate;

// superShape Variables
float radiusOne,radiusTwo;
float termOne,termTwo,termSum;
float superRadius;
float count;
float modSides;

// music Variables
import processing.sound.*;
FFT freqAnal;
SoundFile getTunes;

float[] spectrum;
int bands;
int musiCount;


void setup()
{
  size(displayWidth,displayHeight,P3D);
  
  // sphere Variables
  sphereRadius = 320; 
  numOfParticles = 50;
  
  globePoints = new PVector[numOfParticles+1][numOfParticles+1];
  
  
  
  //musicVariables
  bands = 512;
  freqAnal = new FFT(this,bands);
  spectrum = new float[bands];
  getTunes = new SoundFile(this,"sethPuppetDos.wav");
  
  getTunes.play();
  freqAnal.input(getTunes);
  
  
  
  
}

void draw()
{
  background(255);
  text(count,200,200);
  text(rotateRate,200,220);
  translate(width/2,height/2);
  
  freqAnal.analyze(spectrum);
  
  rotateCircle();
  makeCircle();
  //drawCircle();
  
}



void makeCircle()
{
  // analayze music
  musiCount++;
  
  modSides = random(0,10);
  
  
  //
  count += spectrum[musiCount%spectrum.length]*.7;
    
  for(int i = 0; i < numOfParticles+1; i++)
  {
    lat = map(i,0,numOfParticles,-HALF_PI,HALF_PI);
    radiusTwo = superShape(lat,sin(i)+count,.7,.7,.7);
    
    for(int j = 0; j < numOfParticles+1; j++)
    {
      
      lon = map(j,0,numOfParticles,-TWO_PI,TWO_PI);
      radiusOne = superShape(lon,5,.8+count,.8+count,.8+count);
      
      x = sphereRadius * cos(lat) * sin(lon) * radiusOne * radiusTwo;
      y = sphereRadius * cos(lat) * cos(lon) * radiusOne * radiusTwo;
      z = sphereRadius * sin(lat) * radiusTwo;
      
      globePoints[i][j] = new PVector(x,y,z);
      

    }
  }
  
  for(int i = 0; i < numOfParticles; i++)
  {
    
    noFill();
    
    beginShape(TRIANGLE_STRIP);
    for(int j = 0; j < numOfParticles +1 ; j++)
    {
      stroke(0);
      strokeWeight(1);
      coors = globePoints[i][j];
      vertex(coors.x,coors.y,coors.z);
      
      
      coorsTwo = globePoints[i+1][j];
      vertex(coorsTwo.x,coorsTwo.y,coorsTwo.z);
    }
    endShape();
  }
}

void rotateCircle()
{
   //rotate(musicMod+=.1);
   
  if (rotateRate > PI && rotateRate < (PI*3))
  {
    rotateX(rotateRate+=.001);//+=.004+count*.0001);
    rotateZ(rotateRate);
  }
  
  else if(rotateRate > (PI*3))
  {
    rotateZ(rotateRate+=count*.0001);//.001+count*.0001);
  }
  else
  {
    rotateRate+=.007;
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
