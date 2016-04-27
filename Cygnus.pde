class Cygnus
{
  PImage sprites[];
  PVector pos;
  int hp;
  
  Cygnus()
  {
    
  }
  
}

enum Cstate
{
  _STANDL,
  _STANDR,
  _ATTACKL,
  _ATTACKR,
  _AlertL,
  _AlertR
};

enum Cdir
{
  _LEFT,
  _RIGHT
};