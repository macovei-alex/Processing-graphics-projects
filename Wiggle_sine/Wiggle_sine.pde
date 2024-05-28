void setup()
{
  size(800, 800);
  frameRate(60);
  stroke(255);
  strokeWeight(2);
}

float x = 0;
float[] v = new float[61];

void draw()
{
  float lastx = 0, lasty = 0;
  background(0);
  line(100, 100, 100, 700);
  line(100, 400, 700, 400);
  line(700, 100, 700, 700);
  translate(100, 400);
  pushfront(100 * sin(x));
  for (int i = 0; i < 61; i++)
  {
    line(10 * i, v[i], lastx, lasty);
    lastx = 10 * i;
    lasty = v[i];
  }
  x += PI / 20;
}

void pushfront(float val)
{
  for (int i = 60; i > 0; i--)
    v[i] = v[i - 1];
  v[0] = val;
}
