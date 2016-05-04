class Spell
{
  PImage meteor;
  int m = 30;
  int MX[];
  int MY[];
  
  PImage windL;
  PVector posL;
  PImage windR;
  PVector posR;
  
  Spell()
  {
    meteor = loadImage("meteor.png");
    MX = new int[m];
    MY = new int[m];
    
    windL = loadImage("wind_left.png");
    posL = new PVector(0, 0, 0);
    windR = loadImage("wind_left.png");
    posL = new PVector(0, 0, 0);
  }
  
  void display1()
  {
    for(int i = 0; i < m; i++)
    {
      image(meteor, MX[i], MY[i]);
    }
  }
  
  void display2()
  {
    
  }
}