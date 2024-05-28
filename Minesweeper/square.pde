class square
{
  boolean clicked = false, marked = false;
  int bombNumber, bomb;
  PImage flag = loadImage("flag.png");

  square(int tBomb)
  {
    bomb = tBomb;
  }

  void drawSquare(float x, float y)
  {
    if (clicked == false)
    {
      fill(120);
      rect(x, y, SQUARE_SIZE, SQUARE_SIZE);
      if (marked == true)
        image(flag, x, y);
    } 
    else
    {
      fill(220);
      rect(x, y, SQUARE_SIZE, SQUARE_SIZE);
      if (bombNumber != 0 && bomb == 0)
      {
        fill(colors[bombNumber - 1]);
        text(bombNumber, x + 15, y + 10);
      }
      else if (bomb == 1)
        ellipse(x + 15, y + 15, 20, 20);
    }
  }
}
