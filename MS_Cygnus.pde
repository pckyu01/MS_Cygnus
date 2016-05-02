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
  c.status();
  
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
    if()
    {
      
    }
  }
  for(int i = 0; i < Rb.size(); i++)
  {
    
  }
}