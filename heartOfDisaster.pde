Particles[] nParts = new Particles[50];
float dt = .5;
int thresh = 200;
color[] colArray = {#746d6d,#c2c1c1,#ffffff,#000000,#6c6a6a};


class Particles
{
  PVector loc;
  PVector vel;
  float theta;
  float rad;
  color col;
  
  Particles()
  {
    vel = new PVector(random(-1,1), random(-1,1));
    loc = new PVector(random(height), random(width));;
    theta = random(TWO_PI);
    rad = random(1,2);
    col = colArray[int(random(colArray.length))];
    //float dtval  = random(;
  }  
  void show()
  {
    stroke(col);
    strokeWeight(4);
    fill(col);
    
    ellipse(loc.x,loc.y,20,20);
  }
  void move()
  {
    loc.x += vel.x;
    loc.y += vel.y;
    
    vel.x = rad * cos(theta);
    vel.y = rad * sin(theta);
    
    theta += random(-1,1)*.2;
  }
  
  void period()
  {
    loc.x = (loc.x + width) % width;
    loc.y = (loc.y + height) % height;
  }
    

}
void connect()
{
 for(int i = 0; i < nParts.length; ++i)
  { 
    for(int j = 0; j < nParts.length; ++j)
    
    if(pow(nParts[i].loc.x - nParts[j].loc.x, 2) + pow(nParts[i].loc.y - nParts[j].loc.y, 2) < pow(thresh,2))
    {
      fill(nParts[i].col);
      stroke(nParts[i].col);
      
      line(nParts[i].loc.x,nParts[i].loc.y,nParts[j].loc.x,nParts[j].loc.y);
    }
  }
}


void setup()
{
  size(displayWidth, displayHeight);
  background(0);
  
  for(int i = 0; i < nParts.length; i++)
  {
    nParts[i] = new Particles();
    nParts[i].move();
  }
}

void draw()
{
  //background(0);
  //stroke(255);
  //strokeWeight(3);
  //fill(255);
  
  for(int i = 0; i < nParts.length; i++)
  {
    nParts[i].show();
    nParts[i].move();
    nParts[i].period();
  }
  connect();
  
}
  
  
   
    
  
      
     
   
    
    
    
    
    
