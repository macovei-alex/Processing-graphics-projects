void setup()
{
  size(800, 800);
  stroke(255);
  noFill();
  frameRate(60);
}

int i = 150, j = 150, ok = 1;

void draw()
{
  background(0);
  rect(250, 250, 300, 300);
  rect(i, j, 100, 100);
  if (ok == 1)
  {
    i += 5;
    if (i == 550)
      ok = 2;
  } 
  else if (ok == 2)
  {
    j += 5;
    if (j == 550)
      ok = 3;
  } 
  else if (ok == 3)
  {
    i -= 5;
    if (i == 150)
      ok = 4;
  } 
  else if (ok == 4)
  {
    j -= 5;
    if (j == 150)
      ok = 1;
  }
}
