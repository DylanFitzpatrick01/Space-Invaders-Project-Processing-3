Aliens theAlien[];
final static ArrayList<Bullet> bulletList = new ArrayList();
Bomb theBomb;
PImage spaceInvader; 
PImage explosion;
Player thePlayer;
int killCount=0;

void settings()
{
  size(SCREENX, SCREENY);
}

void setup()
{
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
  theAlien = new Aliens[10];
  theBomb = null;
  spaceInvader = loadImage("Space_invaders_alien.png");
  explosion = loadImage("explosion.png");
  init_aliens(theAlien);
}

void draw()
{
  background(0);
  move_aliens(theAlien);
  draw_aliens(theAlien);
  thePlayer.move(mouseX);
  thePlayer.draw();
  for (Bullet theBullet : bulletList)
  {
    theBullet.draw();
    theBullet.move();
    theBullet.collide();
  }
}

void init_aliens(Aliens theAlien[])
{
  for (int i=0; i<theAlien.length; i++)
    theAlien[i] = new Aliens((IMAGEWIDTH+20)*i, 0);
}

void draw_aliens(Aliens theAlien[])
{
  for (int i=0; i<theAlien.length; i++)
    theAlien[i].draw();
}

void move_aliens(Aliens theAlien[])
{
  for (int i=0; i<theAlien.length; i++)
  {
    theAlien[i].move();
    theBomb = theAlien[i].getBomb();
    if (theBomb != null)
    {
      theBomb.draw();
      theBomb.offScreen();
      theBomb.move();  
      theBomb.collide();
    }
  }
}

void mousePressed()
{
  bulletList.add(new Bullet());
}
