body b1 = new body(400, 200, 1, 25, 250, 0);
body sun = new body(400, 400, 330000, 100, 0, 0);
body[] b = new body[10];

void setup()
{
  size(800, 800);
  frameRate(60);
  fill(80);
  stroke(255);
  for(int i = 0; i < 10; i++)
  {
    float x = random(0, 400);
    b[i] = new body(200 + x, 200 + sqrt(40000 - x * x), 1, 25, 250, random(0, TWO_PI));
  }
}

void draw()
{
  background(0);
  sun.display();
  for(int i = 0; i < 10; i++)
  {
    b[i].computeAtraction(sun);
    b[i].move();
    b[i].display();
  }
}

void mousePressed()
{
  sun.x = mouseX;
  sun.y = mouseY;
}
