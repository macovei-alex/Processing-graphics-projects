class star
{
  float headx, heady, time;

  star(float theadx, float theady, float ttime)
  {
    headx = theadx;
    heady = theady;
    time = ttime;
  }

  void move()
  {
    if (time <= 0)
    {
      headx /= speed;
      heady /= speed;
    } else
      time--;
  }

  void display()
  {
    line(headx, heady, headx * 1.2 * speed, heady * 1.2 * speed);
  }
}
