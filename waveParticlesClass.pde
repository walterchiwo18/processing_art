public class WOCWaveParticles
{
  float waveXInput, waveYInput;
  float noiseTheta;
  int waveColor;
  
  WOCWaveParticles(float waveXInput, 
                   float waveYInput,
                   int waveColor)
  {
    this.waveXInput = waveXInput;
    this.waveYInput = waveYInput;
    this.waveColor = waveColor;
  }
  
  void waveParticlesBuild()
  {
    waveParticlePositions();
    waveInputWall();//keepValuesInMethod - I Don't think we need this method
    wavePlotPixels();//color
  }
  
  void waveParticlePositions()
  {
    float noiseIncrement = 1;
    float WAVEXMOD = 0 ,WAVEYMOD = 0;
    
    noiseIncrement += sin(noiseIncrement);
    
    WAVEXMOD = .003;
    WAVEYMOD = .007;
    
    noiseTheta = noise(waveXInput*WAVEXMOD,waveYInput*WAVEYMOD,noiseIncrement) * TWO_PI;
    
    waveXInput -= 1 * cos(noiseTheta);
    waveYInput -= 1 * sin(noiseTheta);
    
  }
  
  void waveInputWall()
  {
    if(waveXInput > width){waveXInput = random(width);}
    if(waveYInput > height){waveYInput = random(height);}
    if(waveXInput < 0){waveXInput = random(width);}
    if(waveYInput < 0){waveYInput = random(height);}
  }
  
  void wavePlotPixels()
  {
    if(waveXInput < width &&//this mak a no sence
       waveXInput > 0 &&
       waveYInput < height &&
       waveYInput > 0)
       

       {
           pixels[(int)waveXInput + (int)waveYInput * width] = waveColor;
           
       }
    
   
  }
    
}
