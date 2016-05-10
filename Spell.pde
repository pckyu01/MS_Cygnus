class Spell
{
  PImage meteor;
  int m = 20;
  int MX[];
  int MY[];
  int speed;
  
  PImage windL;
  PVector posL;
  PImage windR;
  PVector posR;
  int speedW;
  
  Spell()
  {
    meteor = loadImage("meteor.png");
    MX = new int[m];
    MY = new int[m];
    
    for(int i = 0; i < m; i++)
    {
      MX[i] = (int)random(0, width);
      MY[i] = (int)random(0, 50);
    }
    windL = loadImage("wind_left.png");
    posL = new PVector(width - windL.width, height - windL.height, 0);
    windR = loadImage("wind_right.png");
    posR = new PVector(0, height - windR.height, 0);
    speedW = 2;
  }
  
  void display1(int x)
  {
    pushMatrix();
    rectMode(CENTER);
    m = x;
    for(int i = 0; i < m; i++)
    {
      speed = 3;
      MY[i] += speed;
      image(meteor, MX[i], MY[i]);
      if(MY[i] > height)
      {
        MX[i] = (int)random(0, width);
        MY[i] = (int)random(0, 50);
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
      speed = 5;
      MY[i] += speed;
      image(meteor, MX[i], MY[i]);
      if(MY[i] > height)
      {
        MX[i] = (int)random(0, width);
        MY[i] = (int)random(0, 50);
      }
    }
    
    rectMode(CENTER);
    image(windL, posL.x, posL.y);
    posL.x += speedW * -1;
    
    image(windR, posR.x, posR.y);
    posR.x += speedW;
    
    if(posL.x > width - windL.width/3 || posL.x < 0)
    {
      speedW *= -1;
    }
    popMatrix();
  }
}