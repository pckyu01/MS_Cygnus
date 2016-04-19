class Player
{
  PImage sprites[];
  PVector pos;
  
  Player()
  {
    
  }
  
  void display()
  {
    
  }
  
  void SetUser(int x, int y)
  {
    pos.x = x;
    pos.y = y;
  }
  
  
}

enum Pstate
{
  _LEFT,
  _RIGHT,
  _STANDS,
  _STANDR,
  _ATTACKL,
  _ATTACKR,
  _AlertL,
  _AlertR
};