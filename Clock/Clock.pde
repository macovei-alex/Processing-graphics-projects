void setup()
{
  size(800, 800);
  noFill();
  strokeWeight(2);
  frameRate(60);
  textSize(24);
}

float secAngle = 3 * PI / 2, minAngle = 3 * PI / 2, hourAngle = 3 * PI / 2;
float secRadius = 100, minRadius = 150, hourRadius = 200, clockRadius = 205;

void draw()
{
  background(0);
  stroke(255);
  drawClock();
  
  stroke(255, 0, 0);
  arc(width / 2, height / 2, 2 * secRadius, 2 * secRadius, 3 * PI / 2, secAngle);
  line(width / 2, height / 2, width / 2 + secRadius * cos(secAngle), height / 2 + secRadius * sin(secAngle));
  
  stroke(255, 255, 0);
  arc(width / 2, height / 2, 2 * minRadius, 2 * minRadius, 3 * PI / 2, minAngle);
  line(width / 2, height / 2, width / 2 + minRadius * cos(minAngle), height / 2 + minRadius * sin(minAngle));
  
  stroke(0, 0, 255);
  arc(width / 2, height / 2, 2 * hourRadius, 2 * hourRadius, 3 * PI / 2, hourAngle);
  line(width / 2, height / 2, width / 2 + hourRadius * cos(hourAngle), height / 2 + hourRadius * sin(hourAngle));
  
  secAngle += PI / 30;
  minAngle += PI / 1800;
  hourAngle += PI / 21600;
  if(secAngle > 7 * PI / 2)
    secAngle = 3 * PI / 2;
  if(minAngle > 7 * PI / 2)
    minAngle = 3 * PI / 2;
  if(hourAngle > 7 * PI / 2)
    hourAngle = 3 * PI / 2;
}

void drawClock()
{
  float angle = 3 * PI / 2;
  ellipse(width / 2, height / 2, 2 * clockRadius, 2 * clockRadius);
  for(int i = 1; i <= 12; i++)
  {
    line(width / 2 + clockRadius * cos(angle), height / 2 + clockRadius * sin(angle), width / 2 + (clockRadius + 5) * cos(angle), height / 2 + (clockRadius + 5) * sin(angle));
    text(int(str(i)) - 1, width / 2 + (clockRadius + 20) * cos(angle), height / 2 + (clockRadius + 20) * sin(angle));
    angle += PI / 6;
  }
}
