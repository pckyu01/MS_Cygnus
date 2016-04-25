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
Bullet b;

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

  b = new Bullet();
}

void draw()
{
  background(background);
  p.display();
  p.update();
}

void keyTyped()
{
  if (key == 'z')
    {
      p.attack();
      b.shoot();
    }
    if (key == 'x')
    {
      p.jump();
    }
}