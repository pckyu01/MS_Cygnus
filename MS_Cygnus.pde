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
  background = loadImage("background.png");
  background(background);
  
  p = new Player();
  p.setUser(100, height - 106); //y : the ground of background picture
}
void draw()
{
  background(background);
  p.display();
}