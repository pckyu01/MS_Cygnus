import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer bgm;

Player p;
Cygnus c;

ArrayList<Bullet> Lb; //bullet towards left
ArrayList<Bullet> Rb; //bullet towards right

Spell s;

PImage background;


void setup()
{
  minim = new Minim(this);
  bgm = minim.loadFile("Cygnus+Garden.mp3");
  bgm.play();
  
  fullScreen(); //1366*768
  background = loadImage("background.jpg");
  background.resize(width, height);
  
  p = new Player();
  p.setUser(100, height - 106); //y : the ground of background picture

  c = new Cygnus();
  c.setBoss(width/2, height - (c.sprites[0].height + 40));

  Lb = new ArrayList<Bullet>();
  Rb = new ArrayList<Bullet>();
  
  s = new Spell();
}

void draw()
{
  background(background);
  
  //player
  p.display();
  p.update();
  p.status();
  
  //Boss
  c.display();
  c.update();
  c.status();
  if(c.phase0)
  {
    c.move();
  }
  if(c.phase1)
  {
    c.phase1();
    s.display1(15);
  }
  if(c.phase2)
  {
    c.phase2();
    s.display2(10);
  }
  
  //bullet
  for(int i = 0; i < Lb.size(); i++)
  {
    Lb.get(i).shootL();
  }
  for(int i = 0; i < Rb.size(); i++)
  {
    Rb.get(i).shootR();
  }
  die(); //bullet disppears
  hit(); //damage the boss
}

void keyTyped()
{
  if (key == 'z')
    {
      if(p.mp >= 50)
      {
        p.attack();
        if(p.dir == Pdir._LEFT && Lb.size() < 5)
        {
          Lb.add(new Bullet(p.pos.x+30, p.pos.y+35, p.pos.z, 5));
        }
        if(p.dir == Pdir._RIGHT && Rb.size() < 5)
        {
          Rb.add(new Bullet(p.pos.x+30, p.pos.y+35, p.pos.z, 5));
        }
      }
    }
    if (key == 'x')
    {
      p.jump();
    }
    if (key == 'c')
    {
      if(p.cooldown <= 0)
      {
        p.flash();
      }
    }
}

void die()
{
  for(int i = 0; i < Lb.size(); i++)
  {
    float disL = dist(p.pos.x, p.pos.y, Lb.get(i).pos.x, Lb.get(i).pos.y); 

    if(disL >= 500)
    {
      Lb.remove(i);
    }
  }
  for(int i = 0; i < Rb.size(); i++)
  {
    float disR = dist(p.pos.x, p.pos.y, Rb.get(i).pos.x, Rb.get(i).pos.y);
    
    if(disR >= 500)
    {
      Rb.remove(i);
    }
  }
}

void hit()
{
  float c_w = c.sprites[0].width;
  float c_h = c.sprites[0].height;
  for(int i = 0; i < Lb.size(); i++)
  {
    if(Lb.get(i).pos.x < (c.pos.x + c_w/3) && 
       Lb.get(i).pos.x > (c.pos.x - c_w/3))
    {
      c.damage();
      Lb.remove(i);
    }
  }
  for(int i = 0; i < Rb.size(); i++)
  {
    if(Rb.get(i).pos.x < (c.pos.x + c_w/3) && 
       Rb.get(i).pos.x > (c.pos.x - c_w/3))
    {
      c.damage();
      Rb.remove(i);
    }
  }
  
  //collision with meteor
  for(int i = 0; i < s.m; i++)
  {
    if(
    p.pos.x < s.MX[i] + s.meteor.width/2 &&
    p.pos.x > s.MX[i] - s.meteor.width/2 &&
    p.pos.y < s.MY[i] + s.meteor.height/2 &&
    p.pos.y > s.MY[i] - s.meteor.height/2)
    {
      if(p.time == 100)
      {
        p.damage(10);
      }
    }
  }
  
  //collision with windL
  if(
  p.pos.x < s.posL.x + s.windL.width/2 &&
  p.pos.x > s.posL.x - s.windL.width/2)
  {
    if(p.time == 100)
    {
      p.damage(30);
    }
  }
  //collision with windR
  if(
  p.pos.x < s.posR.x + s.windR.width/2 &&
  p.pos.x > s.posR.x - s.windR.width/2)
  {
    if(p.time == 100)
    {
      p.damage(30);
    }
  }
}