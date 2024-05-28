class ball
{
  float x, y = -BALL_RAD, xspeed, yspeed = 0, lifeTimer = frameRate * 10;

  ball(float tx, float txspeed)
  {
    x = tx;
    xspeed = txspeed;
  }

  void display()
  {
    fill(255, 25.5 * lifeTimer / frameRate);
    ellipse(x, y, 2 * BALL_RAD, 2 * BALL_RAD);
  }

  void move_handleCollision()
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
    
    if(y + BALL_RAD + yspeed > height)
    {
      float f = dist(x, y + BALL_RAD, x, height) / yspeed;
      y += f;
      y -= (1 - f);
      yspeed += (ACC_PER_FRAME * f);
      yspeed *= -0.9;
      yspeed += (ACC_PER_FRAME * (1 - f));
    }
    else
    {
      y += yspeed;
      yspeed += ACC_PER_FRAME;
    }
    lifeTimer -= 2;
  }
}
