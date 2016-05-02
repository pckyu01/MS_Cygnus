class Cygnus
{
  PImage sprites[];
  PVector pos;
  PVector vec;
  int hp;
  
  Cstate state;
  Cdir dir;
  
  Cygnus()
  {
    pos = new PVector(width/2, 0, 0);
    vec = new PVector(0,0,0);
    hp = width;
    
    state = Cstate._STAND;
    dir = Cdir._LEFT;
    
    sprites = new PImage[14];
    sprites[0] = loadImage("stand_left.png");
    sprites[1] = loadImage("stand_right.png");
    sprites[2] = loadImage("move_left.png");
    sprites[3] = loadImage("move_right.png");
    sprites[4] = loadImage("alert_left.png");
    sprites[5] = loadImage("alert_right.png");
    sprites[6] = loadImage("warning1_left.png");
    sprites[7] = loadImage("warning1_right.png");
    sprites[8] = loadImage("attack1_left.png");
    sprites[9] = loadImage("attack1_right.png");
    sprites[10] = loadImage("warning2_left.png");
    sprites[11] = loadImage("warning2_right.png");
    sprites[12] = loadImage("attack2_left.png");
    sprites[13] = loadImage("attack2_right.png");
  }
  
  void display()
  {
    pushMatrix();
    rectMode(CENTER);
    if(state == Cstate._STAND)
    {
      if(dir == Cdir._LEFT)
      {
        image(sprites[0], pos.x, pos.y);
      }
      if(dir == Cdir._RIGHT)
      {
        image(sprites[1], pos.x, pos.y);
      }
    }
    if(state == Cstate._MOVE)
    {
      if(dir == Cdir._LEFT)
      {
        image(sprites[2], pos.x, pos.y);
      }
      if(dir == Cdir._RIGHT)
      {
        image(sprites[3], pos.x, pos.y);
      }
    }
    if(state == Cstate._ALERT)
    {
      if(dir == Cdir._LEFT)
      {
        image(sprites[4], pos.x, pos.y);
      }
      if(dir == Cdir._RIGHT)
      {
        image(sprites[5], pos.x, pos.y);
      }
    }
    if(state == Cstate._WARN1)
    {
      if(dir == Cdir._LEFT)
      {
        image(sprites[6], pos.x, pos.y);
      }
      if(dir == Cdir._RIGHT)
      {
        image(sprites[7], pos.x, pos.y);
      }
    }
    if(state == Cstate._ATTACK1)
    {
      if(dir == Cdir._LEFT)
      {
        image(sprites[8], pos.x, pos.y); 
      }
      if(dir == Cdir._RIGHT)
      {
        image(sprites[9], pos.x, pos.y);
      }
    }
    if(state == Cstate._WARN2)
    {
      if(dir == Cdir._LEFT)
      {
        image(sprites[10], pos.x, pos.y);
      }
      if(dir == Cdir._RIGHT)
      {
        image(sprites[11], pos.x, pos.y);
      }
    }
    if(state == Cstate._ATTACK2)
    {
      if(dir == Cdir._LEFT)
      {
        image(sprites[12], pos.x, pos.y);
      }
      if(dir == Cdir._RIGHT)
      {
        image(sprites[13], pos.x, pos.y);
      }
    }
    
    popMatrix();
  }
  
  void update()
  {
    
  }
  
  void status()
  {
    rectMode(CORNER);
    //hp bar
    fill(255, 0, 0);
    rect(0,0, hp, 30);
  }
  
  void damage()
  {
    hp -= 10;
  }
  
  void phase1()
  {
    
  }
  
  void phase2()
  {
    
  }
  
  void setBoss(int x, int y)
  {
    pos.x = x;
    pos.y = y;
  }
}

enum Cstate
{
  _STAND,
  _MOVE,
  _ALERT,
  _ATTACK1,
  _ATTACK2,
  _WARN1,
  _WARN2
};

enum Cdir
{
  _LEFT,
  _RIGHT
};