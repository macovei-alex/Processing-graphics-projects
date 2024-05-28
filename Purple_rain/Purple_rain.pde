void setup()
{
  size(800, 800);
  stroke(255, 0, 255);
  strokeWeight(2);
  frameRate(60);
  initialize();
}

droplet[] v = new droplet[100];

void draw()
{
  background(255, 255, 0);
  for (int i = 0; i < 100; i++)
  {
    v[i].display();
    v[i].move();
    if (v[i].checkEnd() == 1)
      v[i] = new droplet(random(width), random(25, 50), 0);
  }
}

void initialize()
{
  for (int i = 0; i < 100; i++)
    v[i] = new droplet(random(width), random(25, 50), (int)random(30, 60));
}
