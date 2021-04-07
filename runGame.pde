//music class
import processing.sound.*;


//makeFloor Variables
int moveFloor;
int tileSize;
int floorHeight;

//rain Variables
int rainAmount = 500;
rainFall[] rain = new rainFall[rainAmount];

//player Variables
playerSprite p1; 

//objects Variables
float moveObjects;
float sizeObjects;
float speedObjects;
boolean boxLeft;
boolean boxRight;

// music Varibles
int bands = 256;
float[] spectrum = new float[bands];

FFT freqAnal;
SoundFile getMusic;

//obstacle Variables
float obstacleX;
float obstacleY;
float obstacleSize;
float obstacleSpeed;

//Score Variables
int scoreCount;
boolean score;

void setup()
{
  size(displayWidth,displayHeight);
  frameRate(60);
  
  //makeFloor Variables
  moveFloor = 0;
  tileSize = 20;
  floorHeight = width/2;
  
  //rain Variables
  //rainAmount = 500;
  for(int i = 0; i < rain.length; i++)
  {
    rain[i] = new rainFall();
  }
  
  //player Variables
  p1 = new playerSprite();
  
  //object Variables
  moveObjects = width;
  speedObjects = random(2,5);
  sizeObjects = random(200,900);
  boxLeft = false;
  boxRight = false;
  
  //sound Variables
  freqAnal = new FFT(this,bands);
  getMusic = new SoundFile(this,"mount.wav");
  
  getMusic.loop();
  
  //obstacle Variables
  obstacleSize = 30;
  obstacleSpeed = random(2,40);;
  obstacleX = width;
  obstacleY = floorHeight-obstacleSize;
  
  // score Variables;
  scoreCount = 0;
  score = true;
  
  
}

void draw()
{
  background(100);
  keepScore();
  makeFloor();
  rainPoor();
  keyReleased();
  makeObjects();
  makeObstacles();
  crashCheck();
  
}

void makeFloor()
{
  if(moveFloor < -width)
  {
    moveFloor = 0;
  }
  else
  {
    moveFloor -= 8;
  }
  
  for(int x = moveFloor; x < width; x+= tileSize)
  {
    for(int y = floorHeight; y < height; y+= tileSize)
    {
      stroke(0);
      strokeWeight(2);
      noFill();
      
      rect(x,y,tileSize,tileSize);
    }
  }
}
void rainPoor()
{
  for(int i = 0; i < rain.length; i++)
  {
    rain[i].rainPosition();
    rain[i].rainMovement();
  } 
}
void keyPressed()
{
  p1.playerJump();
  p1.playerMove();
}
void keyReleased()
{
  p1.playerDecent();
  p1.showPlayer();
}

void makeObjects()
{
  if(moveObjects < 0 - sizeObjects && keyCode == RIGHT )
  {
    sizeObjects = random(200,800);
    moveObjects = width;
    speedObjects = random(2,10);
    
  }
  else if(keyCode == RIGHT || keyCode == UP)
  {
    moveObjects -= speedObjects;
    
  }  
  
  if(moveObjects > width && keyCode == LEFT)
  {
    sizeObjects = random(200,800);
    moveObjects = 0 - sizeObjects;
    speedObjects = random(2,5);
    
  }
  else if (keyCode == LEFT ) 
  {
    moveObjects += speedObjects;
    scoreCount++;
    //text("I am working",width/2,height/2);
  }
  
  
  stroke(255);
  strokeWeight(0);
  fill(255);
  rect(moveObjects,0,sizeObjects,height);
  
}
void makeObstacles()
{
  if(obstacleX < 0)
  {
    obstacleX = width;
    obstacleSpeed = random(2,40);
  }
  else
  {
    obstacleX -= obstacleSpeed;
  }
  
  
  strokeWeight(0);
  fill(0);
  rect(obstacleX,obstacleY,obstacleSize,obstacleSize);
}
void crashCheck()
{
  //text(dist(obstacleX,obstacleY,p1.playerPosX,p1.playerPosY),width/2,height/2);
  if(dist(obstacleX,obstacleY,p1.playerPosX,p1.playerPosY) < 40)
  {
    deathCam();
  }
}

void deathCam()
{
  image(p1.playerAnime[8],p1.playerPosX,p1.playerPosY,50,50);
  obstacleSpeed = 0;
  score = false;
  
  textSize(40);
  strokeWeight(20);
  text("You Hit Brick!",width/2,height/2);
  text("Press DOWN to start again!",width/2,height/2+40);
  if(keyCode == DOWN)
  {
    p1 = new playerSprite();
    obstacleX = width;
    obstacleSpeed = random(2,10);
    scoreCount = 0;
    score = true;
     
    
  }
  
}
void keepScore()
{
  textSize(20);
  strokeWeight(5);
  text("SCORE: "+ scoreCount,20,20);
  if(score == true)
  {
    scoreCount+=2;
  }
}


  
