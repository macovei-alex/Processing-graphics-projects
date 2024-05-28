void setup()
{
  size(900, 1000);
  frameRate(120);
  stroke(255);
  strokeWeight(2);
  textSize(30);
  textAlign(CENTER, CENTER);
  initialize();
  for (int i = 0; i < SQUARE_COUNT; i++)
    for (int j = 0; j < SQUARE_COUNT; j++)
      computeVal(i, j);
}

final int SQUARE_SIZE = 30, SQUARE_COUNT = 900 / SQUARE_SIZE;
final color colors[] = {#0000FF, #3B9533, #FF0000, #CB9640, #E896E4, 0, 0};
int bombLeft = 0, time = 0;
square[][] A = new square[SQUARE_COUNT][SQUARE_COUNT];
boolean gameOver = false, clicked = false;

void draw()
{
  if (gameOver == false && (bombLeft > 0 || checkWin() == false))
  {
    background(0);
    if (clicked == true && mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height)
    {
      clicked = false;
      if (mouseY < 900 && mouseButton == LEFT && A[mouseX / SQUARE_SIZE][mouseY / SQUARE_SIZE].bomb == 0 && A[mouseX / SQUARE_SIZE][mouseY / SQUARE_SIZE].marked == false)
        revealOnCLick(mouseX / SQUARE_SIZE, mouseY / SQUARE_SIZE);
      else if (mouseY < 900 && mouseButton == LEFT && A[mouseX / SQUARE_SIZE][mouseY / SQUARE_SIZE].bomb == 1 && A[mouseX / SQUARE_SIZE][mouseY / SQUARE_SIZE].marked == false)
        gameOver = true;
      else if (mouseY < 900 && mouseButton == RIGHT && A[mouseX / SQUARE_SIZE][mouseY / SQUARE_SIZE].clicked == false)
      {
        A[mouseX / SQUARE_SIZE][mouseY / SQUARE_SIZE].marked = !A[mouseX / SQUARE_SIZE][mouseY / SQUARE_SIZE].marked;
        if (A[mouseX / SQUARE_SIZE][mouseY / SQUARE_SIZE].marked == true)
          bombLeft--;
        else bombLeft++;
      }
    }
    for (int i = 0; i < SQUARE_COUNT; i++)
      for (int j = 0; j < SQUARE_COUNT; j++)
        A[i][j].drawSquare(SQUARE_SIZE * i, SQUARE_SIZE * j);
    if (frameCount % 120 == 0)
      time++;
    fill(255);
    text(time, 300, 950);
    text(bombLeft, 500, 950);
  } else if(bombLeft > 0 || checkWin() == false)
  {
    PImage bomb = loadImage("bomb.png");
    for (int i = 0; i < SQUARE_COUNT; i++)
      for (int j = 0; j < SQUARE_COUNT; j++)
        if (A[j][i].clicked == false && A[j][i].bomb == 1)
          image(bomb, j * SQUARE_SIZE, i * SQUARE_SIZE);
  } else if(bombLeft == 0 && checkWin() == true)
  {
    background(0);
    textSize(64);
    text("YOU WIN", width / 2, height / 2 - 75);
    if(time % 60 > 10)
      text(time / 60 + ":" + time % 60, width / 2, height / 2 + 75);
    else 
      text(time / 60 + ":0" + time % 60, width / 2, height / 2 + 75);
  }
}

void initialize()
{
  for (int i = 0; i < SQUARE_COUNT; i++)
    for (int j = 0; j < SQUARE_COUNT; j++)
    {
      if ((int)random(6) == 0)
      {
        A[i][j] = new square(1);
        bombLeft++;
      } else
        A[i][j] = new square(0);
    }
}

void computeVal(int i, int j)
{
  int val = 0;
  if (i > 0)
  {
    val += A[i - 1][j].bomb;
    if (j > 0)
      val += A[i - 1][j - 1].bomb;
    if (j < SQUARE_COUNT - 1)
      val += A[i - 1][j + 1].bomb;
  }
  val += A[i][j].bomb;
  if (j > 0)
    val += A[i][j - 1].bomb;
  if (j < SQUARE_COUNT - 1)
    val += A[i][j + 1].bomb;
  if (i < SQUARE_COUNT - 1)
  {
    val += A[i + 1][j].bomb;
    if (j > 0)
      val += A[i + 1][j - 1].bomb;
    if (j < SQUARE_COUNT - 1)
      val += A[i + 1][j + 1].bomb;
  }
  A[i][j].bombNumber = val;
}

void revealOnCLick(int i, int j)
{
  if (A[i][j].bomb == 0 && A[i][j].clicked == false && A[i][j].bombNumber == 0 && A[i][j].marked == false)
  {
    A[i][j].clicked = true;
    if (i > 0)
    {
      revealOnCLick(i - 1, j);
      if (j > 0)
        revealOnCLick(i - 1, j - 1);
      if (j < SQUARE_COUNT - 1)
        revealOnCLick(i - 1, j + 1);
    }
    if (j > 0)
      revealOnCLick(i, j - 1);
    if (j < SQUARE_COUNT - 1)
      revealOnCLick(i, j + 1);
    if (i < SQUARE_COUNT - 1)
    {
      revealOnCLick(i + 1, j);
      if (j > 0)
        revealOnCLick(i + 1, j - 1);
      if (j < SQUARE_COUNT - 1)
        revealOnCLick(i + 1, j + 1);
    }
  } else if (A[i][j].bomb == 0 && A[i][j].clicked == false && A[i][j].bombNumber != 0)
    A[i][j].clicked = true;
}

void mousePressed()
{
  clicked = true;
}

boolean checkWin()
{
  for(int i = 0; i < SQUARE_COUNT; i++)
    for(int j = 0; j < SQUARE_COUNT; j++)
      if(A[i][j].marked == false && A[i][j].bomb == 1)
        return false;
  return true;
}
