Pstate state;
Pdir dir;
class Player
{
  PImage sprites[];
  PVector pos;
  int hp;
  
  Player()
  {
    pos = new PVector(0, 0);
    state = Pstate._STAND;
    dir = Pdir._RIGHT;
    sprites = new PImage[10];
    sprites[0] = loadImage("alert_left.png"); //when hit
    sprites[1] = loadImage("alert_right.png");
    sprites[2] = loadImage("attack_left.png"); //attck motion
    sprites[3] = loadImage("attack_right.png");
    sprites[4] = loadImage("standing_left.png");//standing motion
    sprites[5] = loadImage("standing_right.png");
    sprites[6] = loadImage("walk1_left.png");//walking motion1
    sprites[7] = loadImage("walk1_right.png");
    sprites[8] = loadImage("walk2_left.png");//walking motion2
    sprites[9] = loadImage("walk2_right.png");
  }
  
  
  
  void display()
  {
    rectMode(CENTER);
    if( state == Pstate._STAND)
    {
      if(dir == Pdir._LEFT)
      {
        image(sprites[4], pos.x, pos.y);
      }
      if(dir == Pdir._RIGHT)
      {
        image(sprites[5], pos.x, pos.y);
      }
    }
  }
  
  void update()
  {
    
  }
  
  void KeyInput()
  {
    if (keyCode == LEFT)
    {
      pos.x -= 5;
    }
    if (keyCode == RIGHT)
    {
      pos.x += 5;
    }
  }
  
  void setUser(int x, int y)
  {
    pos.x = x;
    pos.y = y;
  }
  
  
}

enum Pstate
{
  _WALK1,
  _WALK2,
  _STAND,
  _ATTACK,
  _ALERT
};

enum Pdir
{
  _LEFT,
  _RIGHT
};