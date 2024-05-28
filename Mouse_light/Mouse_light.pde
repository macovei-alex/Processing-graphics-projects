void setup()
{
  size(800, 800);
  frameRate(60);
  noStroke();
}

float lenghtMax = dist(0, 0, 800, 800);


void draw()
{
  background(0);
  int i, j;
  for (i = 0; i < width; i += 5)
    for (j = 0; j < height; j += 5)
    {
      fill(255 - dist(mouseX, mouseY, i, j) * 255 / (lenghtMax / 2));
      rect(i, j, 5, 5);
    }
}
