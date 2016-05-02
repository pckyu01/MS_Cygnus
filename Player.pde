import damkjer.ocd.*;

class Player
{
  PImage sprites[];
  PVector pos;
  PVector vec;
  PVector acc;
  int hp;
  int mp;
  int ad;
  int jumpCount;
  int cooldown;
  
  Pstate state;
  Pdir dir;
  
  Camera cam;
  
  Player()
  {
    pos = new PVector(0, 0, 0);
    vec = new PVector(3, 0, 0);
    acc = new PVector(0, -0.1, 0);
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
    
    hp = 300;
    mp = 300;
    cooldown = 0;
  }
  
  
  
  void display()
  {
    pushMatrix();
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
    if( state == Pstate._WALK)
    {
      if(dir == Pdir._LEFT)
      {
        image(sprites[6], pos.x, pos.y);
      }
      if(dir == Pdir._RIGHT)
      {
        image(sprites[7], pos.x, pos.y);
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
    popMatrix();
    
    //collision to the wall
    if(pos.x <= 0)
    {
      pos.x = 0;
    }
    if(pos.x+sprites[0].width >= width)
    {
      pos.x = width - sprites[0].width;
    }
    
    //jumping system
    if(vec.y != 0)
    {
      pos.y -= vec.y;
    }
    vec.y += acc.y;
    if(pos.y >= height -106)
    {
      state = Pstate._STAND;
      pos.y = height - 106;
      vec.y = 0;
      acc.y = 0;
      jumpCount = 2;
    }
    
    //cooldown system
    if(cooldown > 0)
    {
      cooldown--;
    }
    else if(cooldown == 0)
    {
      //do nothing
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
        state = Pstate._WALK;
        pos.x -= vec.x;
        dir = Pdir._LEFT;
      }
      if (keyCode == RIGHT)
      {
        state = Pstate._WALK;
        pos.x += vec.x;
        dir = Pdir._RIGHT;
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
    if(jumpCount > 0)
    {
      vec.y = 7;
      acc.y = -0.5;
      jumpCount -= 1;
      state = Pstate._JUMP;
    }
  }
  
  void attack()
  {
    state = Pstate._ATTACK;
    mp -= 20;
  }
  
  void status()
  {
    pushMatrix();
    rectMode(CORNER);
    
    //background
    fill(255);
    rect(0, height - 30, 470, 30);
    //hp
    fill(255,0,0);
    rect(0, height - 26, hp, 10);
    text("HP : " +hp + "/300", 310, height - 17);
    //mp
    fill(0,0,255);
    rect(0, height - 12, mp, 10);
    text("MP : " + mp + "/300", 310, height - 2);
    //cooltime
    fill(0);
    text("Cooldown :" + cooldown, 390, height-12);
    popMatrix();
    
    //regen
    if(hp < 300)
    {
      hp += 1;
    }
    if(mp < 300)
    {
      mp += 1;
    }
  }
  
  void flash()
  {
    if(mp >= 50)
    {
      if(dir == Pdir._LEFT)
      {
        pos.x -= 300;
      }
      else if(dir == Pdir._RIGHT)
      {
        pos.x += 300;
      }
      cooldown = 300;
      mp -= 50;
    }
  }
  
}

enum Pstate
{
  _WALK,
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