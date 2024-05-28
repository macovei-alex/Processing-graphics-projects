ArrayList <point> P = new ArrayList <point> ();
boolean arrayEnd = false;
point singlePoint, endPoint, p, p1;
int nrIntersectii;

void setup()
{
  size(800, 800);
  stroke(255, 0, 0);
  strokeWeight(2);
  noFill();
  frameRate(120);
}

void draw()
{
  background(0);
  beginShape();
  stroke(255);
  for (int i = 0; i < P.size(); i++)
  {
    p = P.get(i);
    vertex(p.x, p.y);
    fill(255);
    ellipse(p.x, p.y, 5, 5);
    noFill();
  }
  if (P.size() > 0)
  {
    p = P.get(0);
    vertex(p.x, p.y);
  }
  endShape();
  if (singlePoint != null)
  {
    stroke(255, 0, 0);
    ellipse(singlePoint.x, singlePoint.y, 5, 5);
    line(singlePoint.x, singlePoint.y, width, singlePoint.y);
  }
}

void mousePressed()
{
  if (arrayEnd == false)
    P.add(new point(mouseX, mouseY));
  else
  {
    singlePoint = new point(mouseX, mouseY);
    endPoint = new point(width, mouseY);
    nrIntersectii = 0;
    for (int i = 0; i < P.size() - 1; i++)
    {
      p = P.get(i);
      p1 = P.get(i + 1);
      if(determinant(singlePoint, endPoint, p) * determinant(singlePoint, endPoint, p1) < 0 && determinant(p, p1, singlePoint) * determinant(p, p1, endPoint) < 0)
        nrIntersectii++;
    }
    p = P.get(P.size() - 1);
    p1 = P.get(0);
    if(determinant(singlePoint, endPoint, p) * determinant(singlePoint, endPoint, p1) < 0 && determinant(p, p1, singlePoint) * determinant(p, p1, endPoint) < 0)
      nrIntersectii++;
    println(nrIntersectii);
  }
}

void keyPressed()
{
  if (keyCode == BACKSPACE)
  {
    if (arrayEnd == false && P.size() > 0)
      P.remove(P.size() - 1);
    else if (arrayEnd == true)
    {
      singlePoint = null;
      endPoint = null;
    }
  } else if (keyCode == ENTER)
    arrayEnd = !arrayEnd;
}

float determinant(point p1, point p2, point p3)
{
   float det = p1.x * p2.y + p2.x * p3.y + p1.y * p3.x;
   det -= (p3.x * p2.y + p1.y * p2.x + p1.x * p3.y);
   return det;
}
