star[] v = new star[100];
float speed = 1.02;

void setup()
{
  size(800, 800);
  frameRate(60);
  stroke(255);
  strokeWeight(1);
  fill(255);
  for(int i = 0; i < 100; i++)
  {
    float rand = random(-width, width);
    v[i] = new star(rand, pow(-1, i) * sqrt(width * width - rand * rand), random(0, 240));
  }
}

void draw()
{
  background(0);
  translate(width / 2, height / 2);
  for(int i = 0; i < 100; i++)
  {
    v[i].display();
    v[i].move();
    if(abs(v[i].headx * v[i].heady) < 10)
    {
      float rand = random(-width, width);
      v[i] = new star(rand, pow(-1, i) * sqrt(width * width - rand * rand), 0);
    }
  }
}

void keyPressed()
{
  if(key == '=')
    speed += 0.01;
  else if(key == '-')
    speed -= 0.01;
}
