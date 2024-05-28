class bula
{
  float x, y, wobble, speed, time;
  float aux, direction = (int)random(1, 2) % 2;
  bula(float tempx, float tempy, float tempt, float temps, float tempw)
  {
    x = tempx;
    y = tempy;
    wobble = tempw;
    speed = temps;
    time = tempt;
    aux = x;
  }

  void move()
  {
    if (time <= 0)
    {
      y -= speed; 
      x += wobble * direction / 4;
      if(abs(x - aux) > wobble)
        direction *= -1;
    }
    else
      time--;
  }

  int checkPop()
  {
    if (y - speed < 250)
      return 1;
    return 0;
  }

  void display()
  {
    ellipse(x, y, 10, 10);
  }
}
