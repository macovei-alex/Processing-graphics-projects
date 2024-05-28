final float g = 1, k = 10, m = 1000;
float x, y, vx = 0, vy = 0;

void setup()
{
  size(800, 800);
  frameRate(60);
  stroke(255);
  noFill();
}

void draw()
{
  background(0);
  if(mousePressed == true)
  {
    x = mouseX;
    y = mouseY;
    vx = 0;
    vy = 0;
  }
  ellipse(x, y, 100, 100);
  line(x, y, width / 2, 0);
  move();
}

void move()
{
  float ax = -k * (x - width / 2) / m;
  float ay = (g * m - k * y) / m;
  vx += ax;
  vy += ay;
  x += vx;
  y += vy;
}
