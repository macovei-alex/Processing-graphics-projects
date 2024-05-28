final int POINT_SIZE = 2, OFFSET_X = 3;
final float STEP = 1;
FloatList Y = new FloatList();

void setup()
{
  size(800, 800);
  frameRate(60);
  stroke(255);
  fill(255);
  Y.append(0);
}

float zoom = 2, translateX = 100, translateY = 400, mX = 0, mY = 0;
boolean pressed = false;

void draw()
{
  background(0);
  if (pressed == true)
  {
    translateX = translateX - mX + mouseX;
    translateY = translateY - mY + mouseY;
    mX = mouseX;
    mY = mouseY;
  }
  translate(translateX, translateY);
  drawAxis();
  
  float y = Y.get(Y.size() - 1);
  Y.append(y + random(-10, 10));
  
  drawPoints();
}

void drawAxis()
{
  line(0, -10000, 0, 10000);
  line(-10000, 0, 10000, 0);
}

void drawPoints()
{
  ellipse(0, 0, POINT_SIZE * zoom, POINT_SIZE * zoom);
  for (int i = 0; i < Y.size() - 1; i++)
  {
    float y1 = Y.get(i), y2 = Y.get(i + 1);
    ellipse((i + 1) * OFFSET_X * zoom * STEP, y2 * zoom, POINT_SIZE * zoom, POINT_SIZE * zoom);
    line(i * OFFSET_X * zoom * STEP, y1 * zoom, (i + 1) * OFFSET_X * zoom * STEP, y2 * zoom);
  }
}

void mouseWheel(MouseEvent direction)
{
  float lastZoom = zoom, posX, posY;
  zoom *= (1 - direction.getCount() * 0.1);
  posX = (mouseX - translateX) / lastZoom * zoom;
  posY = (mouseY - translateY) / lastZoom * zoom;
  translateX = mouseX - posX;
  translateY = mouseY - posY;
}

void mousePressed()
{
  if (pressed == false)
  {
    pressed = true;
    mX = mouseX;
    mY = mouseY;
  }
}

void mouseReleased()
{
  pressed = false;
}
