final float acc = 0.02, dec = 0.02, angularChange = PI / 100, rectWidth = 50, rectHeight = 100;
FloatList X = new FloatList();
FloatList Y = new FloatList();

void setup()
{
  size(800, 800);
  frameRate(60);
  stroke(255);
  strokeWeight(4);
  fill(0);
  rectMode(CENTER);
}

int accelerate = 0, decelerate = 0, turnLeft = 0, turnRight = 0;
float x = 0, y = 0, angle = 0, speed = 0;

void draw()
{
  background(0);
  move();
  translate(400, 400);
  if(!((- width / 2 <= x && x <= width / 2) && (- height / 2 <= y && y <= height / 2)))
    println(x + " " + y);
  if(frameCount % 5 == 0)
  {
    X.append(x);
    Y.append(y);
  }
  drawTracks();
  drawRect(x, y, rectWidth, rectHeight, angle);
}

void move()
{
  speed = speed + accelerate * acc - decelerate * dec;
  angle = angle - turnLeft * angularChange + turnRight * angularChange;
  x += speed * cos(angle - PI / 2);
  if(- width / 2 + rectWidth / 2 > x || x > width / 2 - rectWidth / 2)
    x -= speed * cos(angle - PI / 2);
  y += speed * sin(angle - PI / 2);
  if(- height / 2 + rectHeight / 2 > y || y > height / 2 - rectHeight / 2)
    y -= speed * sin(angle - PI / 2);
}

void drawRect(float x, float y, float w, float h, float angle)
{
  float radius = sqrt(w * w + h * h) / 2;
  float deltaAng = atan(h / w);
  beginShape();
  vertex(x + radius * cos(angle + deltaAng), y + radius * sin(angle + deltaAng));
  vertex(x + radius * cos(angle - deltaAng), y + radius * sin(angle - deltaAng));
  vertex(x + radius * cos(angle + deltaAng + PI), y + radius * sin(angle + deltaAng + PI));
  vertex(x + radius * cos(angle - deltaAng + PI), y + radius * sin(angle - deltaAng + PI));
  vertex(x + radius * cos(angle + deltaAng), y + radius * sin(angle + deltaAng));
  endShape();
}

void drawTracks()
{
  for(int i = 0; i < X.size() - 1; i++)
  {
    float x1 = X.get(i), x2 = X.get(i + 1);
    float y1 = Y.get(i), y2 = Y.get(i + 1);
    line(x1, y1, x2, y2);
  }
}

void keyPressed()
{
  switch(key)
  {
  case 'w':
    accelerate = 1;
    break;
  case 's':
    decelerate = 1;
    break;
  case 'a':
    turnLeft = 1;
    break;
  case 'd':
    turnRight = 1;
    break;
  }
}

void keyReleased()
{
  switch(key)
  {
  case 'w':
    accelerate = 0;
    break;
  case 's':
    decelerate = 0;
    break;
  case 'a':
    turnLeft = 0;
    break;
  case 'd':
    turnRight = 0;
    break;
  }
}
