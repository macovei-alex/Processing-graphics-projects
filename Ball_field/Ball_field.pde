void setup()
{
  size(800, 800);
  noStroke();
  frameRate(60);
  initialize();
}

ball[][] b = new ball[40][40];

void draw()
{
  background(0);
  for (int i = 0; i < width / 20; i++)
    for (int j = 0; j < height / 20; j++)
    {
      b[i][j].display();
      if (b[i][j].reset() == 1)
        b[i][j] = new ball(i * 20 + 10, j * 20 + 10, 10, (int)random(30, 240));
    }
}

void initialize()
{
  for (int i = 0; i < width / 20; i++)
    for (int j = 0; j < height / 20; j++)
      b[i][j] = new ball(i * 20 + 10, j * 20 + 10, 10, (int)random(120, 240));
}
