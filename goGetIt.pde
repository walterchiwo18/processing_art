
import processing.sound.*;

SoundFile getMusic;
FFT freqAnal;

int bands = 512; 
float[] spectrum = new float[bands]; 


int SINCOS_LEN;
float SINCOS_PRES;

float SINLUT[];
float COSLUT[];

int num;
int index;

float[] pt;
int[] style;

void setup()
{
  size(displayWidth,displayHeight,P3D);
  
  getMusic = new SoundFile(this,"angelsDemons2.wav");
  freqAnal = new FFT(this,bands);
  
  freqAnal.input(getMusic);
  getMusic.play();
  
  SINCOS_PRES = 1.0;
  SINCOS_LEN = 360/int(SINCOS_PRES);
  
  COSLUT = new float[SINCOS_LEN];
  SINLUT = new float[SINCOS_LEN];
  for(int i = 0; i < SINCOS_LEN; i++)
  {
    SINLUT[i] =  70*radians(sin(i)*SINCOS_PRES);
    COSLUT[i] =  70*radians(cos(i)*SINCOS_PRES);
  }
 
  num = 150;
  pt = new float[num*6];
  style = new int[num*2];
  
  index = 0;
  
  for(int i = 0; i < num; i++)
  {
    pt[index++] = random(PI*2);//x
    pt[index++] = random(PI*2);//y
    
    pt[index++] = random(60,80);//deg
    
    pt[index++] = int(random(2,50)*5);//rad
    
    pt[index++] = random(4,32);//w
    
    pt[index++] = radians(random(5,30))/5;
    
    style[i*2+1] =  (int)random(0,3);
  }
  
  
  
  
}

void draw()
{
  background(0);
  translate(width/2,height/2);
  
  freqAnal.analyze(spectrum);
  
  rotateX(PI/6);
  rotateY(PI/6);
    
  index = 0;
  
 for(int i = 0; i < num; i++) 
 {
   
   pushMatrix();
  
   rotateX(pt[index++]);
   rotateY(pt[index++]);
   
   if(style[i*2+1] == 0)
    {
      stroke(0);
      noFill();
      arcLine(0,0,pt[index++],pt[index++],pt[index++]);
     
    }
    
    else if(style[i*2+1] == 1 )
    {
      noStroke();
      fill(random(50,100));
      arcSquare(0,0,pt[index++],pt[index++],pt[index++]);
    }
    
    else 
    {
      
      fill(random(150,250));
      //strokeWeight(5);
      noStroke();//Fill();
      arci(0,0,pt[index++],pt[index++],pt[index++]);
    }
  
  pt[index-5]+=pt[index]/15 * round(spectrum[i] * 1000);
  pt[index-4]+=pt[index++]/25 * round(spectrum[i] * 1000);
   popMatrix(); 
 }
  
  //pt[index-5]+=pt[index]/10;
  //pt[index-4]+=pt[index++]/20;
  
  
  //for 
  
}

public void arcLine(float x,float y, float deg,float rad, float w)
{
  int a = int(min(deg/SINCOS_PRES,SINCOS_LEN-1));
  int numOfLines = int(w/2);
  
  for(int j = 0; j < numOfLines; j++)
  {
    beginShape();
    for(int i = 0; i < a; i++)
    {
      vertex(COSLUT[i]*rad+x,SINLUT[i]*rad+y);
    }
    
  } 
   endShape();
   rad+=2;
}
public void arcSquare(float x,float y, float deg,float rad, float w)
{
  int a = int(min(deg/SINCOS_PRES,SINCOS_LEN-1));
  a = (int)a/4;
  //int numOfLines = int(w/2);
  
  //for(int j = 0; j < numOfLines; j++)
  //{
  beginShape(QUADS);
  for(int i = 0; i < a; i+=4)
  {
    vertex(COSLUT[i]*rad+x,SINLUT[i]*rad+y);
    vertex(COSLUT[i]*(rad+w)+x,SINLUT[i]*rad+y);
    vertex(COSLUT[i+2]*(rad+w)+x,SINLUT[i+2]*(rad+w)+y);
    vertex(COSLUT[i+2]*rad+x,SINLUT[i+2]*rad+y);
    
  }
  endShape();
  //}  
}
public void arci(float x,float y, float deg,float rad, float w)
{
  int a = int(min(deg/SINCOS_PRES,SINCOS_LEN-1));
  //a = (int)a/4;
  //int numOfLines = int(w/2);
  
  //for(int j = 0; j < numOfLines; j++)
  //{
  beginShape(QUAD_STRIP);
  for(int i = 0; i < a; i++)
  {
    vertex(COSLUT[i]*rad+x,SINLUT[i]*rad+y);
    vertex(COSLUT[i]*(rad+w)+x,SINLUT[i]*rad+y);
  }
  endShape();
  //}  
}
   
