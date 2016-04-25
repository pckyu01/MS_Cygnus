import damkjer.ocd.*;


class Player
{
  PImage sprites[];
  PVector pos;
  PVector vec;
  PVector acc;
  int hp;
  int ad;
  
  Pstate state;
  Pdir dir;
  
  Camera cam;
  
  Player()
  {
    pos = new PVector(0, 0, 0);
    vec = new PVector(0, 0, 0);
    acc = new PVector(0, 0, 0);
    state = Pstate._STAND;
    dir = Pdir._RIGHT;
    sprites = new PImage[12];
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
    sprites[10] = loadImage("jump_left.png"); //jumping motion
    sprites[11] = loadImage("jump_right.png");
  }
  
  
  
  void display()
  {
    rectMode(CENTER);
    if( state == Pstate._ALERT)
    {
      if(dir == Pdir._LEFT)
      {
        image(sprites[0], pos.x, pos.y);
      }
      if(dir == Pdir._RIGHT)
      {
        image(sprites[1], pos.x, pos.y);
      }
    }
    if( state == Pstate._ATTACK)
    {
      if(dir == Pdir._LEFT)
      {
        image(sprites[2], pos.x, pos.y);
      }
      if(dir == Pdir._RIGHT)
      {
        image(sprites[3], pos.x, pos.y);
      }
    }
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
    if( state == Pstate._JUMP)
    {
      if(dir == Pdir._LEFT)
      {
        image(sprites[10], pos.x, pos.y);
      }
      if(dir == Pdir._RIGHT)
      {
        image(sprites[11], pos.x, pos.y);
      }
    }
  }
  
  void update()
  {
    KeyInput();
  }
  
  void KeyInput()
  {
    if (keyPressed)
    {
      if (keyCode == LEFT)
      {
        pos.x -= 3;
        dir = Pdir._LEFT;
      }
      if (keyCode == RIGHT)
      {
        pos.x += 3;
        dir = Pdir._RIGHT;
      }
      if (key == 'z')
      {
        attack();
      }
      if (key == 'x')
      {
        jump();
      }
    }
  }
  
  void setUser(int x, int y)
  {
    pos.x = x;
    pos.y = y;
  }
  
  void jump()
  {
    state = Pstate._JUMP;
    
    if(pos.y >= height -106)
    {
      state = Pstate._STAND;
    }
  }
  
  void attack()
  {
    state = Pstate._ATTACK;
  }
  
  
}

enum Pstate
{
  _WALK1,
  _WALK2,
  _STAND,
  _ATTACK,
  _ALERT,
  _JUMP
};

enum Pdir
{
  _LEFT,
  _RIGHT
};