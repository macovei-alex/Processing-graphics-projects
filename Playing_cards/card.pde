class card
{
  String symbol;
  int val;
  PImage img;
  
  card(int tVal, String tSymbol, PImage tImg)
  {
    val = tVal;
    symbol = tSymbol;
    img = tImg;
  }
  
  void display(float x, float y)
  {
    image(img, x, y, SIZEX, SIZEY);
  }
}
