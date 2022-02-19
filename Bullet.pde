class Bullet
{
  int ypos;
  int xpos;
  PFont gameOverFont = loadFont("AgencyFB-Reg-48.vlw");
  
  Bullet()
  {
    xpos=thePlayer.xpos;
    ypos=SCREENY-PADDLEHEIGHT-MARGIN;
  }
  
  void move()
  {
    ypos-=BULLETSPEED;
  }
  
  void draw()
  {
     fill(255);
     circle(xpos, ypos, BULLETSIZE);
  }
  
  void collide()
  {
    for(int i=0; i<theAlien.length; i++)
    {
        if(theAlien[i].exploded == false && xpos+BULLETSIZE<=theAlien[i].x+IMAGEWIDTH && xpos >= theAlien[i].x-IMAGEWIDTH && (ypos + BULLETSIZE >= theAlien[i].y && ypos <= theAlien[i].y+IMAGEHEIGHT))
        {
          theAlien[i].exploded=true;
          killCount+=1;
          print(killCount);
          if(killCount>=10)
          {
            fill(0,255,0);
            text("YOU WIN", 175, SCREENY/2);
            noLoop();
          }
        }
    }
  }
}
