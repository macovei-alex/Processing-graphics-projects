final float ANGLE_ACC = random(PI / 8000, PI / 12000);
final int OPTIONS_NUMBER = 10;
float angle = 0, angleDiff = -PI / 20;

void setup()
{
  size(800, 800);
  frameRate(60);
  stroke(255);
  noFill();
}

void draw()
{
  background(0);
  translate(width / 2, height / 2);
  ellipse(0, 0, 400, 400);
  for(int i = 0; i < OPTIONS_NUMBER; i++)
    line(0, 0, 200 * cos(angle + i * TWO_PI / OPTIONS_NUMBER), 200 * sin(angle + i * TWO_PI / OPTIONS_NUMBER));
  if(angleDiff + ANGLE_ACC <= 0)
    angleDiff += ANGLE_ACC;
  else
    angleDiff = 0;
  angle += angleDiff;
  drawArrow();
}

void drawArrow()
{
  line(-20, -250, 0, -210);
  line(0, -210, 20, -250);
  line(20, -250, -20, -250);
}
