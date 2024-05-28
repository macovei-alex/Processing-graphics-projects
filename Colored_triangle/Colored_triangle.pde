int latura, r, g, b, increment = 1;
float x = 260;

void setup()
{
  size(800, 800);
  background(0);
  strokeWeight(6);
  stroke(255);
  frameRate(10);
  translate(width / 2, height / 2);
  rotate(-2 * TWO_PI / 3);
  for(latura = 0; latura < 3; latura++)
  {
    rotate(TWO_PI / 3);
    for(x = 260; x > -260; x--)
    {
      switch(latura)
      {
        case 0: stroke(255 * (260 + x) / 520, 255 * (260 - x) / 520, 0); break;
        case 1: stroke(0, 255 * (260 + x) / 520, 255 * (260 - x) / 520); break;
        case 2: stroke(255 * (260 - x) / 520, 0, 255 * (260 + x) / 520); break;
      }
      point(x, 150);
    }
  }
}
