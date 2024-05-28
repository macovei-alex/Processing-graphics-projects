ArrayList<point> v1 = new ArrayList<point>();
ArrayList<point> v2 = new ArrayList<point>();

void setup()
{
  size(800, 800);
  frameRate(60);
  stroke(255);
  strokeWeight(1);
  textAlign(CENTER, CENTER);
  textSize(16);
  noFill();
}

button button1 = new button(100, 800 - 66, 100, 33, "poligon1");
button button2 = new button(300, 800 - 66, 100, 33, "poligon2");
button button3 = new button(500, 800 - 66, 100, 33, "rezultat");

void draw()
{
  background(0);
  point p1, p2;
  line(0, height - 100, width, height - 100);
  button1.display();
  button2.display();
  button3.display();
  for (int i = 0; i < v1.size() - 1; i++)
  {
    p1 = v1.get(i);
    p2 = v1.get(i + 1);
    line(p1.x, p1.y, p2.x, p2.y);
  }
  for (int i = 0; i < v2.size() - 1; i++)
  {
    p1 = v2.get(i);
    p2 = v2.get(i + 1);
    line(p1.x, p1.y, p2.x, p2.y);
  }
}

void mousePressed()
{
  if (button1.pressed() == true)
    button2.selected = false;
  else if (button2.pressed() == true)
    button1.selected = false;
  else if(button3.pressed() == true)
  {
    println(checkCollision(v1, v2));
    button3.selected = false;
  }
  else
  {
    if (button1.selected == true)
      addPoint(v1, mouseX, mouseY);
    else if(button2.selected == true)
      addPoint(v2, mouseX, mouseY);
  }
}

void keyPressed()
{
  if(key == BACKSPACE)
  {
    if(button1.selected == true)
      deletePoint(v1);
    else if(button2.selected == true)
      deletePoint(v2);
  }
}

String checkCollision(ArrayList<point> v1, ArrayList<point> v2)
{
  if (v1.size() < 3 || v2.size() < 3)
    return "Nu sunt destule puncte intr-unul dintre poligoane";
  for (int i = 0; i < v1.size() - 1; i++)
  {
    point p1 = v1.get(i);
    point p2 = v1.get(i + 1);
    for (int j = 0; j < v2.size() - 1; j++)
    {
      point p3 = v2.get(j);
      point p4 = v2.get(j + 1);
      if (determinant(p1, p2, p3) * determinant(p1, p2, p4) < 0 && determinant(p3, p4, p1) * determinant(p3, p4, p2) < 0)
        return "Are loc coliziune";
    }
  }
  return "Nu are loc coliziune";
}

void addPoint(ArrayList<point> v, float x, float y)
{
  point p;
  if (v.size() != 0)
  {
    v.remove(v.size() - 1);
    p = v.get(0);
    v.add(new point(x, y));
    v.add(p);
  }
  else
  {
    v.add(new point(x, y));
    v.add(new point(x, y));
  }
}

void deletePoint(ArrayList<point> v)
{
  if(v.size() > 0)
  {
    v.remove(v.size() - 1);
    v.remove(v.size() - 1);
    if(v.size() > 0)
      v.add(v.get(0));
  }
}

float determinant(point p1, point p2, point p3)
{
  float det;
  det = p1.x * p2.y + p2.x * p3.y + p1.y * p3.x;
  det -= (p3.x * p2.y + p1.y * p2.x + p1.x * p3.y);
  return det;
}
