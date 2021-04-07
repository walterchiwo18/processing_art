/* 
  Walter Chiwo
  04/26/2020
  ForLoopStar
*/
import processing.sound.*;

float rectPosX,rectPosY;
float rectSize;
float rectRotate;

FFT frequencyAnalizer;
int bandSensitivity;
float[] soundSpectrum;

SoundFile musicFile;

void setup()
{
  size(displayWidth,displayHeight);
  smooth();
  
//  rectPosX = 23;
//  rectPosY = 42;
  rectSize = 10;
  rectRotate = 23;
  
//  musicFile = new SoundFile(this,"someMusic.wav");
//  frequencyAnalizer = new FFT(this,bandSensitivity);
//  soundSpectrum = new float[bandSensitivity];

// musicFile.play(); //is this the method?
// frequencyAnalizer.input(musicFile);
  
}

void draw()
{
   translate(width/2,height/2);
   background(255);
   //frequencyAnalizer.analyze;
   starRect();
}

void starRect()
{
   for(int x = 0; x < 40; x++)
   {
     for(int y = 0; y < 20; y++)
     {
        fill(0);
        rectPosX = x + rectSize;
        rectPosY = y*x + rectSize;
        rect(rectPosX,rectPosY,y,y);
     }
     
     rotate(rectRotate+=.00001);
   }
}
