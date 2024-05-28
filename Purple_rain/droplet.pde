class droplet
{
  float x, y = 0, speed;
  int time;
  float lenght = 20;

  droplet(float tempx, float temps, int tempt)
  {
    x = tempx;
    speed = temps;
    time = tempt;
  }

  void display()
  {
    if (time <= 0)
      line(x, y, x, y - lenght);
  }

  void move()
  {
    if (time <= 0)
      y += speed;
    else
      time--;
  }

  int checkEnd()
  {
    if (y > height)
      return 1;
    return 0;
  }
}
