float[] x = new float[3];
float[] y = new float[3];
float px = 400, py = 400;

void setup()
{
  size(800, 800);
  frameRate(600);
  noStroke();
  x[0] = 400; y[0] = 100;
  x[1] = 100; y[1] = 700;
  x[2] = 700; y[2] = 700;
  background(0);
}

void draw()
{
  int i = (int)random(0, 3);
  px = (px + x[i]) / 2;
  py = (py + y[i]) / 2;
  fill(255 * dist(px, py, x[0], y[0]) / dist(x[0], y[0], x[1], y[1]),
       255 * dist(px, py, x[1], y[1]) / dist(x[1], y[1], x[2], y[2]),
       255 * dist(px, py, x[2], y[2]) / dist(x[2], y[2], x[0], y[0]));
  circle(px, py, 1);
}
