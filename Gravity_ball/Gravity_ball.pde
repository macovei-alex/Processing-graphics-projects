final int BALL_RAD = 30;
final float ACC_PER_FRAME = 0.5;
float x = 200, y = 150, xspeed  = 30, yspeed;

void setup()
{
  background(0);
  size(400, 300);
  frameRate(60);
  stroke(0);
  fill(0, 120, 255);
}

void draw()
{
  background(0);
  circle(x, y, 2 * BALL_RAD);
  move_andCollision();
}

void move_andCollision()
{
  if (x - BALL_RAD + xspeed < 0)
  {
    float f = dist(x - BALL_RAD, y, 0, y) / abs(xspeed);
    x -= f;
    x += (1 - f);
    xspeed *= -1;
  } else if (x + BALL_RAD + xspeed > width)
  {
    float f = dist(x + BALL_RAD, y, width, y) / xspeed;
    x += f;
    x -= (1 - f);
    xspeed *= -1;
  } else x += xspeed;

  if (y + BALL_RAD + yspeed > height)
  {
    float f = dist(x, y + BALL_RAD, x, height) / yspeed;
    y += f;
    y -= (1 - f);
    yspeed += (ACC_PER_FRAME * f);
    yspeed *= -0.9;
    yspeed += (ACC_PER_FRAME * (1 - f));
  } else
  {
    y += yspeed;
    yspeed += ACC_PER_FRAME;
  }
}
