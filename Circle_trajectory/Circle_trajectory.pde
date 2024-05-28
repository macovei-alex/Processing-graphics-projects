void setup()
{
  size(1200, 800);
  noFill();
  background(0);
  stroke(255);
  frameRate(120);
}

float angle = 0.25;
float v = 100, vx = v * cos(PI * angle), vy = v * sin(PI * angle), g = 20;
float y = 750, x = 50;
float time = 0.05;

void draw()
{
  if (x <= 1150 && y <= 750)
  {
    background(0);
    circle(x, y, 100);
    x += vx * time;
    y -= vy * time;
    vy -= g * time;
  }
}
