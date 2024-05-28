class ball
{
  float x, y, radius, xSpeed, ySpeed;
  int time;
  float acc = 0.15;

  ball(float tempX, float tempY, float tempR, float xspeed, float yspeed, int tempT)
  {
    x = tempX;
    y = tempY;
    radius = tempR;
    xSpeed = xspeed;
    ySpeed = yspeed;
    time = tempT;
  }

  void show()
  {
    if (time == 0)
      ellipse(x, y, 2 * radius, 2 * radius);
    else if(time > 0)
      time--;
  }

  void move()
  {
    if (time == 0)
    {
      x += xSpeed;
      y += ySpeed;
      ySpeed += acc;
    }
    else if(time > 0)
      time--;
  }

  int collision()
  {
    if (time == 0)
    {
      if (x - radius < 0 || x + radius > width || y - radius < 0 || y + radius > height)
        return 1;
    }
    else if(time > 0)
      time--;
    return 0;
  }
}
