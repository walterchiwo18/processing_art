// superShapeFormula Variables
float termOne,termTwo,termSum;
float radiusOne,radiusTwo,radius;
int a,b;

// circle variables
float circleRadius;
float lon,lat;
float rotateRate;
int numOfPoints;

PVector[][] coors;
PVector globe; 
PVector globeTwo;
float x,y,z;


void setup()
{
  size(displayWidth,displayHeight,P3D);
  // circle variables
  circleRadius = 700;
  numOfPoints = 50;
  
  coors = new PVector[numOfPoints+1][numOfPoints+1];
  circleSetup();
  //for(int i = 0; i < numOfPoints; i++)
  //{
  //  for(int j = 0; j < numOfPoints; j++)
  //  {
  //    coors[i][j] = new PVector();
  //  }
  //}
  
  // superShape Variables 
  //watch for these
  
  
  
}

void draw()
{
  background(0);
  
  translate(width/2,height/2);
  rotateY(rotateRate);
  rotateX(1.60 + rotateRate);
  
  drawCircle();
  rotateRate +=.0009;
  
  textSize(50);
  //println(rotateRate,-300,-300);
  
  
}
  
  
  


float superShapeForm(float latLon, float m, float num1,float num2, float num3)
{
  a = 1; 
  b = 1;
  
  termOne = abs((1/a)*cos(m*latLon/4));
  termOne = pow(termOne,num2);
  
  termTwo = abs((1/b)*sin(m*latLon/4));
  termTwo = pow(termTwo,num3);
  
  termSum = termOne + termTwo;
  radius = pow(termSum, -1/num1);
  
  return radius;  
}
  

void circleSetup()
{
  for(int i = 0; i < numOfPoints + 1; i++)
  {
    lat = map(i,0,numOfPoints,-HALF_PI,HALF_PI);
    radiusOne = superShapeForm(lat,1.67,.3,.3,.3);
    for(int j = 0; j < numOfPoints+1; j++)
    {
      radiusTwo = superShapeForm(lon,0,1,1,1);
      lon = map(j,0,numOfPoints,-PI,PI);
      x = circleRadius * cos(lat) * sin(lon)* radiusOne * radiusTwo;
      y = circleRadius * cos(lat) * cos(lon)* radiusOne * radiusTwo; 
      z = circleRadius * sin(lat) * radiusTwo;
      
      coors[i][j] = new PVector(x,y,z);
    }
  }
}

void drawCircle()
{
  for(int i = 0; i < numOfPoints; i++)
  {
    stroke(255);
    
    //noFill();
    strokeWeight(2);
    beginShape();
    noFill();
    for(int j = 0; j < numOfPoints+1; j++)
    {
      globe = coors[i][j];
      vertex(globe.x,globe.y,globe.z);
      
      globeTwo = coors[i+1][j];
      vertex(globeTwo.x,globeTwo.y,globeTwo.z);
    }
    endShape();
  }
  
}
  
  
