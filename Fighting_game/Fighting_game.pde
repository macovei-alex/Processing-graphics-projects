final int JUMP_TIME_TOTAL = 90, JUMP_HEIGHT_FRAME = 5;

void setup()
{
  size(1000, 400);
  stroke(255);
  noFill();
  rectMode(CENTER);
  frameRate(120);
}

player p1 = new player(500, 400);

void draw()
{
  background(0);
  p1.chooseMove();
  p1.drawPlayer();
}


void keyPressed()
{
  switch (key)
  {
    case 'w':
      p1.up = true;
      break;
    case 'a':
      p1.left = true;
      break;
    case 'd':
     p1.right = true;
     break;
  }
}

void keyReleased()
{
  switch (key)
  {
    case 'w':
      p1.up = false;
      break;
    case 'a':
      p1.left = false;
      break;
    case 'd':
     p1.right = false;
     break;
  }
}
