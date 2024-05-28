final int BALL_COUNT = 20;
float angle = PI / 3;
ball[] B = new ball[BALL_COUNT];

void setup()
{
  size(800, 800);
  frameRate(120);
  stroke(255);
  
  angle /= 2;
  for(int i = 0; i < BALL_COUNT; i++)
    B[i] = new ball(200 + i * 20, angle, 60 + 3 * i);
}

void draw()
{
  background(0);
  translate(width / 2, 0);
  line(0, height, height * cos(PI / 2 + angle), height - height * sin(PI / 2 + angle));
  line(0, height, height * cos(PI / 2 - angle), height - height * sin(PI / 2 - angle));
  for(int i = 0; i < BALL_COUNT; i++)
  {
    B[i].checkCollision(angle);
    B[i].move();
    B[i].display();
    if(0 < i)
      line(B[i - 1].x, height - B[i - 1].y, B[i].x, height - B[i].y);
  }
}
