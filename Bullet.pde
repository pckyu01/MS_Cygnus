class Bullet
{
  PImage sprites[];
  PVector pos;
  int speed;
  
  Player p;
  
  Bullet()
  {
    p = new Player();
    
    sprites = new PImage[2];
    sprites[0] = loadImage("bullet_left.png");
    sprites[1] = loadImage("bullet_right.png");
    
    pos = new PVector(p.pos.x, p.pos.y, p.pos.z);
    speed = 3;
  }
  
  void shoot()
  {
    if(p.dir == Pdir._LEFT)
    {
      image(sprites[0], pos.x, pos.y);
    }
    if(p.dir == Pdir._RIGHT)
    {
      image(sprites[1], pos.x, pos.y);
    }
  }
  
}