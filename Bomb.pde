class Bomb
{
  int x;
  int y;
  boolean onScreen = true;
  boolean collided = false;
  int radius=10;
  PFont gameOverFont = loadFont("AgencyFB-Reg-48.vlw");
  
  Bomb(int xpos, int ypos)
  {
    x=xpos;
    y=ypos;
  }
  
  void move()
  {
    if(collided==false)
      y+=2;
    else if(collided == true)
    {
      y+=0;
      fill(255,0,0);
      textFont(gameOverFont);
      text("GAME OVER", 170, SCREENY/2);
      noLoop();
    }
  }
  
  void draw()
  {
    fill (255,255,0);
    circle(x, y, radius);
  }
  
  void offScreen()
  {
    if(y>=SCREENY)
      onScreen=false;
  }
   
  boolean collide()
  {
    if(x>=thePlayer.xpos-25 && x<=thePlayer.xpos+25 && y-radius>=thePlayer.ypos-radius && y<=thePlayer.ypos+PADDLEHEIGHT)
    {
      collided = true;
    }
    return collided;
  }
}
