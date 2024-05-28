class segment
{
  int x, y, nextx, nexty;

  segment(int tx, int ty, int tnextx, int tnexty)
  {
    x = tx;
    y = ty;
    nextx = tnextx;
    nexty = tnexty;
  }

  void move(segment nextSegment)
  {
    x = nextx;
    y = nexty;
    nextx = nextSegment.x;
    nexty = nextSegment.y;
  }

  boolean checkCollision(segment head)
  {
    if (x == head.x && y == head.y)
      return true; //<>//
    return false;
  }

  void display()
  {
    rect(x, y, size, size);
  }
}
