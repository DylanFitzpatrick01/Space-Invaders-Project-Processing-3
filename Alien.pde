class Aliens
{
  int x;
  int y;
  int count;
  int iMove = 1;
  int countY=0;
  int countY2=IMAGEHEIGHT;
  boolean exploded = false;
  boolean canShoot = true;
  Bomb theBomb;

  Aliens(int xpos, int ypos)
  {
    x=xpos;
    y=ypos;
  }

  void draw()
  {
    if (exploded == true)
    {
      image(explosion, x, y, IMAGEWIDTH, IMAGEHEIGHT);
      y+=0;
      x+=0;
    } else
      image(spaceInvader, x, y, IMAGEWIDTH, IMAGEHEIGHT);
  }

  Bomb getBomb()
  {
    if (random(0, 100)<=1 && theBomb == null && exploded==false)
    {
      theBomb = new Bomb(x+IMAGEWIDTH/2, y+IMAGEHEIGHT);
    }
    if (theBomb!=null && theBomb.onScreen == false)
        theBomb = null;
    return theBomb;
  }

  void move()
  {
    if (countY>=IMAGEHEIGHT && exploded == false)
    {
      x-=iMove;
    }
    if (countY2>=IMAGEHEIGHT && exploded == false)
    {
      x+=iMove;
    }
    if (x+IMAGEWIDTH>=SCREENX && exploded == false)
    {
      y+=iMove;
      x=SCREENX-IMAGEWIDTH;
      countY++;
      countY2=0;
    }
    if (x<=0 && exploded == false)
    {
      y+=iMove;
      x=0;
      countY2++;
      countY=0;
    }
  }
}
