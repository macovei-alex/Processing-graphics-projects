class body
{
  float x, y, vx = 0, vy = 0, ax = 0, ay = 0, m, diameter;
  
  body(float tx, float ty, float tm, float td, float vel, float angle)
  {
    x = tx;
    y = ty;
    m = tm;
    diameter = td;
    vx = vel * cos(angle);
    vy = vel * sin(angle);
  }
  
  void computeAtraction(body b)
  {
    float G, Gx, Gy;
    float d = dist(x, y, b.x, b.y) / 250;
    G = m * b.m / pow(d, 2) / 1000;
    float dx = (b.x - x) / 250;
    float dy = (b.y - y) / 250;
    Gx = G * dx / d;
    Gy = G * dy / d;
    ax = Gx / m;
    ay = Gy / m;
  }
  
  void move()
  {
    vx += ax / frameRate;
    vy += ay / frameRate;
    x += vx / frameRate;
    y += vy / frameRate;
  }
  
  void display()
  {
    ellipse(x, y, diameter, diameter);
  }
}
