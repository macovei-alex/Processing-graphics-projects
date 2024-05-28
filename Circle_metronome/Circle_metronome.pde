final float BALL_DIAMETER = 50;
final int BALL_COUNT = 100;
float circleX, circleY, circleDiameter;
BALL[] balls = new BALL[BALL_COUNT];

void setup()
{
  size(800, 800);
  stroke(255);
  frameRate(60);
  noFill();
  circleX = width / 2;
  circleY = height / 2;
  circleDiameter = min(width, height) - 5;
  for(int i = 0; i < BALL_COUNT; i++)
    balls[i] = new BALL(map(i, 0, BALL_COUNT, 1.33, 1.66), i * TWO_PI / BALL_COUNT);
}

void draw()
{
  background(0);
  circle(circleX, circleY, circleDiameter);
  for(int i = 0; i < BALL_COUNT; i++)
  {
    balls[i].move();
    if(balls[i].checkCollision() == true)
      balls[i].changeDirection();
    balls[i].display();
  }
}
