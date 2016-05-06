class Spell
{
  PImage meteor;
  int m = 10;
  int MX[];
  int MY[];
  int speed;
  
  PImage windL;
  PVector posL;
  PImage windR;
  PVector posR;
  
  Spell()
  {
    meteor = loadImage("meteor.png");
    MX = new int[m];
    MY = new int[m];
    
    for(int i = 0; i < m; i++)
    {
      MX[i] = (int)random(0, width);
      MY[i] = 0;
    }
    windL = loadImage("wind_left.png");
    posL = new PVector(0, 0, 0);
    windR = loadImage("wind_left.png");
    posL = new PVector(0, 0, 0);
  }
  
  void display1(int x)
  {
    pushMatrix();
    rectMode(CENTER);
    m = x;
    for(int i = 0; i < m; i++)
    {
      speed = (int)random(1, 3);
      MY[i] += speed;
      image(meteor, MX[i], MY[i]);
      if(MY[i] > height)
      {
        MX[i] = (int)random(0, width);
        MY[i] = 0;
      }
    }
    popMatrix();
  }
  
  void display2(int x)
  {
    pushMatrix();
    rectMode(CENTER);
    m = x;
    for(int i = 0; i < m; i++)
    {
      speed = (int)random(1, 3);
      MY[i] += speed;
      image(meteor, MX[i], MY[i]);
      if(MY[i] > height)
      {
        MX[i] = (int)random(0, width);
        MY[i] = 0;
      }
    }
    
    
    popMatrix();
  }
}