void setup()
{
  size(800, 800);
  noFill();
  frameRate(30);
}

float radius = 250, accel = 0.002;
float angle = 0, speed = - PI / 100;
float[] vertex = new float[200];

void draw()
{
  background(0);
  stroke(255);
  ellipse(width / 2, height / 2, 2 * (radius - 50), 2 * (radius - 50));
  rect(0, height - 150, 150, height);
  rect(width - 150, height - 150, width, height);
  line(width / 2, height / 2, width / 2 + radius * cos(angle), height / 2 + radius * sin(angle));
  shiftDraw(angle);
  angle += speed;
  if(mousePressed)
  {
    if((0 < mouseX && mouseX < 150) && (height - 150 < mouseY && mouseY < height))
      speed += accel;
    else if((width - 150 < mouseX && mouseX < width) && (height - 150 < mouseY && mouseY < height))
      speed -= accel;
  }
}

void shiftDraw(float angle)
{
  int i;
  for(i = 199; i > 0; i--)
    vertex[i] = vertex[i - 1];
  vertex[0] = angle;
  translate(width / 2, height / 2);
  strokeWeight(2);
  for(i = 0; i < 199  && abs(vertex[i] - vertex[0]) < PI; i++)
  {
    stroke(255 - abs(vertex[i] - vertex[0]) * 255 / PI, 0, 0);
    line(radius * cos(vertex[i]), radius * sin(vertex[i]), radius * cos(vertex[i + 1]), radius * sin(vertex[i + 1]));
  }
  translate(- width / 2, - height / 2);
  strokeWeight(1);
}
