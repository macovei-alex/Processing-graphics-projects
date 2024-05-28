void setup()
{
  size(1000, 800);
  stroke(255);
  noFill();
  frameRate(60);
}

float angle = 0, speed = PI / 100;
float[] vertex = new float[400];

void draw()
{
  background(0);
  float radius = 150;
  float posx = width / 4, posy = height / 2;
  for (int i = 0; i < 5; i++)
  {
    ellipse(posx, posy, 2 * radius, 2 * radius);
    line(posx, posy, posx += radius * cos(pow(2, i) * angle), posy += radius * sin(pow(2, i) * angle));
    radius /= 2;
  }
  angle -= speed;
  for(int i = 0; i < 20; i++)
    line(600 + 10 * 2 * i, height / 2, 600 + 10 * (2 * i + 1), height / 2);
  line(posx, posy, 600, posy);
  shift(posy);
  drawLines();
}

void shift(float posy)
{
  for(int i = 399; i > 0; i--)
    vertex[i] = vertex[i - 1];
   vertex[0] = posy;
}

void drawLines()
{
  for(int i = 0; i < 399; i++)
    if(vertex[i + 1] != 0)
      line(600 + i, vertex[i], 601 + i, vertex[i + 1]);
}
