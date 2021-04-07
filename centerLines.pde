class Particles
{
     PVector = loc;
     PVector = vel;
     PVector = acc;
      
     
     PVector[] = hist; 
     int counter = 0;
     

   void Particles(PVector someLoc)
   {
     float randMin = -HALF_PI;
     float randMax = 0;
     
     float r = random(0,TWO_PI);
     
     float x = cos(r);
     float y = sin(r);
     
     acc = PVector(x,y);
     
     float q = random(-1,1);
     r = random(randMix, randMax);
     x = cos(r) * q; 
     y = sin(r) * q;
     
     vel = PVector(x,y);
     
     loc = someLoc.get();
     hist = new PVector[1000];
   }
   
   void update()
   {
     
     vel.add(acc);
     loc.add(acc);
     
     if(frameRate % 10 = 0 && counter < hist.length)
     {
       hist[counter] = loc.get();
       counter++;
     }
   }
   
   void drawShift()
   {
    stroke(255)
    noFill();
    beginShape()
    for(int i = 0; i < 
     
    
     
     
      
