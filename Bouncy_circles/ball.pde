class ball
{
  float x, y, radius, speed, angle;
  float gravity = 0.25, xspeed, yspeed;

  ball(float tempx, float tempy, float tempr, float temps, float tempa)
  {
    x = tempx;
    y = tempy;
    radius = tempr;
    speed = temps;
    angle = tempa;
    xspeed = speed * cos(angle);
    yspeed = speed * sin(angle);
  }

  void move()
  {
    y += yspeed;
    yspeed += gravity; 
    x += xspeed;
  }

  void checkCollision()
  {
    if (x  - radius < 0 || x + radius > width)
      xspeed *= -1;
    if (y  - radius < 0 || y + radius > height)
      yspeed *= -1;
  }

  void display()
  {
    ellipse(x, y, 2 * radius, 2 * radius);
  }
}
