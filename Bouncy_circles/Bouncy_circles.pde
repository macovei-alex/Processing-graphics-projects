void setup()
{
  size(800, 800);
  frameRate(60);
  stroke(255);
  fill(80);
}

ball[] B = new ball[200];
int n = 0;

void draw()
{
  background(0);
  if (mousePressed && n < 200)
    B[n++] = new ball(mouseX, mouseY, 10, random(2, 5), random(2 * PI));
  else if (keyPressed)
    n = 0;
  for (int i = 0; i < n; i++)
  {
    B[i].display();
    B[i].move();
    B[i].checkCollision();
  }
}
