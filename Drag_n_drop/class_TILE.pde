class TILE
{
  float tileX, tileY;
  boolean selected = true;
  float deltaX = 0, deltaY = 0;
  
  TILE(float tx, float ty)
  {
    tileX = tx;
    tileY = ty;
  }
  
  void display()
  {
    rect(tileX, tileY, TILE_LENGTH, TILE_LENGTH);
  }
  
  boolean mouseOnTile()
  {
    if(mouseX < tileX - TILE_LENGTH / 2 || tileX + TILE_LENGTH / 2 < mouseX)
      return false;
    if(mouseY < tileY - TILE_LENGTH / 2 || tileY + TILE_LENGTH / 2 < mouseY)
      return false;
    return true;
  }
  
  void tileSelected()
  {
    if(mousePressed == true)
    {
      if(mouseOnTile() == true && selected == false)
      {
        deltaX = mouseX - tileX;
        deltaY = mouseY - tileY;
        selected = true;
      }
      else if(selected == true)
      {
        tileX = mouseX - deltaX;
        tileY = mouseY - deltaY;
      }
    }
    else if(mousePressed == false)
      selected = false;
  }
}
