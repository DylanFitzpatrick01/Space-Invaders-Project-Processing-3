  class Player
  {
    int xpos;
    int ypos;
    
    Player(int screen_y)
    {
      xpos=SCREENX/2;
      ypos=screen_y;
    }
    
    void move(int x)
    {
      if(x>SCREENX-PADDLEWIDTH) 
        xpos = SCREENX-PADDLEWIDTH;
      else xpos=x;
    }
    
    void draw()
    {
      fill(255);
      rect(mouseX-25, SCREENY-PADDLEHEIGHT-MARGIN, PADDLEWIDTH, PADDLEHEIGHT);
    }
  }
