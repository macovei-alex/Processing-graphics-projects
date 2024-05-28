class ball
{
  float x, y, radius;
  int time;
  float auxtime;

  ball(float x, float y, float r, int t)
  {
    this.x = x;
    this.y = y;
    this.radius = r;
    this.time = t;
    this.auxtime = t;
  }

  void display()
  {
    fill(time * 255 / auxtime);
    ellipse(x, y, 2 * radius, 2 * radius);
    time--;
  }

  int reset()
  {
    if (time <= 0)
      return 1;
    return 0;
  }
}
