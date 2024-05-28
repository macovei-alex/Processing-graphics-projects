class ball
{
  float x, y, speed, rad, ang;
  
  ball(float trad, float tang, float perioada)
  {
    ang = tang;
    rad = trad;
    x = rad * cos(ang);
    y = rad * sin(ang);
    speed = 1 / perioada;
  }
  
  void move()
  {
    ang += speed;
    x = rad * cos(PI / 2 - ang);
    y = rad * sin(PI / 2 - ang);
  }
  
  void checkCollision(float angle)
  {
    if(!(-angle < ang && ang < angle))
      speed *= -1;
  }
  
  void display()
  {
    ellipse(x, height - y, 20, 20);
  }
}
