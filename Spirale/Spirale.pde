int armNumber = 20, stage = 0, increment = 20;
float[][] pos = new float [200][2];
float[][] prevPos = new float [200][2];
float[] colors = new float[3];
float dividingAngle = 2 * PI / armNumber, radius = 0, angle = 0;
boolean turn = true;

void setup()
{
  size(800, 800);
  frameRate(60);
  stroke(255);
  noFill();
  background(0);
  strokeWeight(2);
  colors[0] = 255;
}

void draw()
{
  translate(width / 2, height / 2);
  if (turn == true && radius >= sqrt(2) * width / 2)
  {
    turn = false;
    stroke(0);
    strokeWeight(3);
  }
  else if (turn == false && radius == 0)
  {
    turn = true;
    strokeWeight(2);
  }
  if (turn == true)
  {
    changeGradient();
    for (int i = 0; i < armNumber; i++)
    {
      line(pos[i][0], pos[i][1], prevPos[i][0], prevPos[i][1]);
      prevPos[i][0] = pos[i][0];
      prevPos[i][1] = pos[i][1];
      pos[i][0] = radius * cos(angle + dividingAngle * i);
      pos[i][1] = radius * sin(angle + dividingAngle * i);
    }
    radius += 1;
    angle += PI / 100;
  } else
  {
    radius -= 1;
    angle -= PI / 100;
    for (int i = 0; i < armNumber; i++)
    {
      line(pos[i][0], pos[i][1], prevPos[i][0], prevPos[i][1]);
      prevPos[i][0] = pos[i][0];
      prevPos[i][1] = pos[i][1];
      pos[i][0] = radius * cos(angle + dividingAngle * i);
      pos[i][1] = radius * sin(angle + dividingAngle * i);
    }
  }
}

void changeGradient()
{
  if (stage == 0)
  {
    colors[0] -= increment;
    colors[1] += increment;
    if (colors[1] >= 255)
      stage = 1;
  } else if (stage == 1)
  {
    colors[1] -= increment;
    colors[2] += increment;
    if (colors[2] >= 255)
      stage = 2;
  } else if (stage == 2)
  {
    colors[2] -= increment;
    colors[0] += increment;
    if (colors[0] >= 255)
      stage = 0;
  }
  stroke(colors[0], colors[1], colors[2]);
}
