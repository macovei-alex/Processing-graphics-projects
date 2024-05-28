class button
{
  int x, y, sizeX, sizeY;
  String name;
  
  button(int tx, int ty, int tsizeX, int tsizeY, String tname)
  {
    x = tx;
    y = ty;
    sizeX = tsizeX;
    sizeY = tsizeY;
    name = tname;
  }
  
  boolean pressed()
  {
    if(x <= mouseX && mouseX <= x + sizeX)
      if(y <= mouseY && mouseY <= y + sizeY)
        return true;
    return false;
  }
  
  void display()
  {
    rect(x, y, sizeX, sizeY);
    text(name, x + sizeX / 2, y + sizeY / 2);
  }
}
