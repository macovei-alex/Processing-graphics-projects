FloatList x = new FloatList();
FloatList y = new FloatList();
float px = 400, py = 400, n = 3;

void setup()
{
  size(800, 800);
  frameRate(600);
  for(int i = 0; i < n; i++)
  {
    x.push(400 + 300 * cos(i * (TWO_PI / n) - PI / 2));
    y.push(400 + 300 * sin(i * (TWO_PI / n) - PI / 2));
  }
  background(0);
  stroke(255);
  noFill();
  beginShape();
  for(int i = 0; i < n; i++)
    vertex(x.get(i), y.get(i));
  vertex(x.get(0), y.get(0));
  endShape();
  noStroke();
  fill(255);
}

void draw()
{
  int i = (int)random(0, n);
  px = (px + x.get(i)) / 2;
  py = (py + y.get(i)) / 2;
  circle(px, py, 3);
}
