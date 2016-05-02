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
    speed = 0;
  }
  
  Bullet(float x, float y, float z, int s)
  {
    p = new Player();
    
    sprites = new PImage[2];
    sprites[0] = loadImage("bullet_left.png");
    sprites[1] = loadImage("bullet_right.png");
    
    pos = new PVector(x, y, z);
    speed = s;
  }
  
  void shootL()
  {
    pushMatrix();
    image(sprites[0], pos.x, pos.y);
    pos.x -= speed;
    popMatrix();
  }
  void shootR()
  {
    pushMatrix();
    image(sprites[1], pos.x, pos.y);
    pos.x += speed;
    popMatrix();
  }
  
  
}