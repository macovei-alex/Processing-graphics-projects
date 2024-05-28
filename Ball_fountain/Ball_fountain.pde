void setup()
{
 size(800, 800);
 frameRate(60);
 stroke(255);
 fill(80);
 initialize();
}

ball[] B = new ball[200];

void draw()
{
  background(0);
  for(int i = 0; i < 200; i++)
  {
    if(B[i].collision() == 1)
      B[i] = new ball(width / 2, height / 3, 10, random(-2, 2), random(-4, 2), 0);
    B[i].show();
    B[i].move();
  }
}

void initialize()
{
  for(int i = 0; i < 200; i++)
    B[i] = new ball(width / 2, height / 3, 10, random(-2, 2), random(-1, 0), (int)random(0, 300));
}
