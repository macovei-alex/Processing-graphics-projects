final int TILE_LENGTH = 100, TILE_HEIGHT = 100;
float sqX = 400, sqY = 400, deltaX = 0, deltaY = 0;
boolean mouseAlreadyPressed = false;
ArrayList <TILE> tiles = new ArrayList <TILE> ();

void setup()
{
  size(800, 800);
  stroke(255);
  noFill();
  rectMode(CENTER);
  frameRate(60);
}

void draw()
{
  background(0);
  if(mousePressed == true)
    mousePressed();
  rect(sqX, sqY, TILE_LENGTH, TILE_HEIGHT);
}

boolean mouseOnSquare()
{
  if(mouseX < sqX - TILE_LENGTH / 2 || sqX + TILE_LENGTH / 2 < mouseX)
    return false;
  if(mouseY < sqY - TILE_HEIGHT / 2 || sqY + TILE_HEIGHT / 2 < mouseY)
    return false;
  return true;
}

void mousePressed()
{
  if(mouseOnSquare() == true && mouseAlreadyPressed == false)
  {
    deltaX = mouseX - sqX;
    deltaY = mouseY - sqY;
    mouseAlreadyPressed = true;
  }
  if(mouseAlreadyPressed == true)
  {
    mouseAlreadyPressed = true;
    sqX = mouseX - deltaX;
    sqY = mouseY - deltaY;
  }
}

void mouseReleased()
{
  mouseAlreadyPressed = false;
}
