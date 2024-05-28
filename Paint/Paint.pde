boolean[][] a = new boolean[40][40];
int boxNr = 0;

void setup()
{
  size(800, 900);
  frameRate(120);
  stroke(255);
  textSize(32);
  textAlign(CENTER, CENTER);
}

void draw()
{
  background(0);
  for (int i = 0; i < 40; i++)
    for (int j = 0; j < 40; j++)
    {
      if (a[i][j] == true)
        fill(255);
      else
        fill(0);
      stroke(255);
      rect(j * 20, i * 20, 20, 20);
    }
  fill(255);
  text(boxNr, 400, 850);
}

void mouseClicked()
{
  if (0 <= mouseY && mouseY <= height - 100 && 0 <= mouseX && mouseX <= width)
  {
    a[(int)mouseY / 20][(int)mouseX / 20] = !a[(int)mouseY / 20][(int)mouseX / 20];
    if (a[(int)mouseY / 20][(int)mouseX / 20] == true)
      boxNr++;
    else boxNr--;
  } else if (height - 100 < mouseY && mouseY <= height)
  {
    for (int i = 0; i < 40; i++)
      for (int j = 0; j < 40; j++)
        a[i][j] = false;
    boxNr = 0;
  }
}
