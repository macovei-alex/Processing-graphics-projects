final int SIZEX = 50, SIZEY = 50;
String word = "APA";
ArrayList<button> b = new ArrayList<button>();

void setup()
{
  size(800, 800);
  frameRate(60);
  stroke(255);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(20);
  buttonsSetup();
}

void draw()
{
  background(0);
}

void buttonsSetup()
{
  float spaceToLeave = (width - word.length() * (SIZEX + 10) + 10) / 2;
  for(int i = 0; i < word.length(); i++)
    b.add(new button(spaceToLeave + (SIZEX + 10) * i - 10 + SIZEX / 2, 600, word[i]));
}
