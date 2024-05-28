class BALL
{
  float x, y, xVel, yVel;
  
  BALL(float tVel, float angle)
  {
    x = (circleDiameter - BALL_DIAMETER) / 2 * cos(angle) + circleX;
    y = (circleDiameter - BALL_DIAMETER) / 2 * sin(angle) + circleY;
    xVel = -tVel * cos(angle);
    yVel = -tVel * sin(angle);
  }
  
  void display()
  {
    circle(x, y, BALL_DIAMETER);
  }
  
  void move()
  {
    x += xVel;
    y += yVel;
  }
  
  void changeDirection()
  {
    xVel *= -1;
    yVel *= -1;
  }
  
  boolean checkCollision()
  {
    if(dist(circleX, circleY, x, y) >= circleDiameter / 2 - BALL_DIAMETER / 2)
      return true;
    return false;
  }
}
