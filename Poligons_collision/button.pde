class button
{
  float x, y, sizeX, sizeY;
  boolean selected = false;
  String name;
  
  button(float tx, float ty, float tsizeX, float tsizeY, String tname)
  {
    x = tx;
    y = ty;
    sizeX = tsizeX;
    sizeY = tsizeY;
    name = tname;
  }
  
  void display()
  {
    if (selected == true)
    {
      fill(120);
      rect(x, y, sizeX, sizeY);
      fill(0);
    } else
      rect(x, y, sizeX, sizeY);
    text(name, x + sizeX / 2, y + sizeY / 2);
  }

  boolean pressed()
  {
    if (x <= mouseX && mouseX <= x + sizeX)
      if (y <= mouseY && mouseY <= y + sizeY)
      {
        selected = true;
        return true;
      }
    return false;
  }
}
