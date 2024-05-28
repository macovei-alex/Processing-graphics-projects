class button
{
  boolean revealed = false;
  float x, y;
  String val;
  
  button(float tx, float ty, String tval)
  {
    x= tx;
    y = ty;
    val = tval;
  }
  
  void drawLetter()
  {
    rect(x, y, SIZEX, SIZEY);
    if(revealed == true)
      text(val, x, y);
  }
  
  boolean clicked()
  {
    if(x - SIZEX / 2 <= mouseX && mouseX <= x + SIZEX / 2)
      if(y - SIZEY / 2 <= mouseY && mouseY <= y + SIZEY / 2)
        return true;
    return false;
  }
}
