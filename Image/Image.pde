PImage img;

void setup() 
{
  size(1920, 1080);
  img = loadImage("colour bomb.jpg");
}

void draw() 
{
  image(img, 0, 0);
}
