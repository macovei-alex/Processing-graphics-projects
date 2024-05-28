void setup()
{
  size(600, 800);
  stroke(255);
  fill(120);
  frameRate(60);
  fill(80);
  initialize();
}

bula[] b = new bula[50];

void draw()
{
  background(0);
  drawGlass();
  for(int i = 0; i < 50; i++)
  {
    if(b[i].time <= 0)
      b[i].display();
    b[i].move();
    if(b[i].checkPop() == 1)
      b[i] = new bula(random(230, 370), 685, (int)random(15, 30), random(5, 10), random(8));
  }
}

void drawGlass()
{
 line(200, 700, 400, 700); // bottom
 line(150, 200, 450, 200); // top
 line(200, 700, 150, 200); // left
 line(400, 700, 450, 200); // right
 line(155, 250, 445, 250); // water
 fill(255);
 rect(225, 690, 150, 10); // pill
 fill(80);
}

void initialize()
{
  for(int i = 0; i < 50; i++)
    b[i] = new bula(random(230, 370), 685, (int)random(90), random(5, 10), random(8));
}
