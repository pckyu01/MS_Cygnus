import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Player p;
Cygnus c;
Bullet b;

PImage background;

void setup()
{
  fullScreen(); //1366*768
  background = loadImage("background.png");
  background(background);
  
  p = new Player();
}
void draw()
{
  background(background);
  p.display();
}