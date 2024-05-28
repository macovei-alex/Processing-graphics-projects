final int BOARD_SIZE = 4, SQ_SIZE = 200;

int[][] board = new int[BOARD_SIZE][BOARD_SIZE];
boolean moveUp = false, moveDown = false, moveLeft = false, moveRight = false;

void setup()
{
  size(1000, 1000);
  frameRate(60);
  stroke(255);
  strokeWeight(2);
  textAlign(CENTER, CENTER);
  textSize(48);
  initializeBoard();
}

void draw()
{
  background(0);
  drawBoard();
}

void drawBoard()
{
  for (int i = 0; i < BOARD_SIZE; i++)
    for (int j = 0; j < BOARD_SIZE; j++)
    {
      fill(200);
      rect(100 + i * SQ_SIZE, 100 + j * SQ_SIZE, SQ_SIZE, SQ_SIZE);
      if (board[i][j] != 0)
      {
        fill(0);
        text(board[i][j], 100 + (i + 0.5) * SQ_SIZE, 100 + (j + 0.5) * SQ_SIZE);
      }
    }
}

void initializeBoard()
{
  int r1 = (int)random(0, BOARD_SIZE * BOARD_SIZE), r2;
  do
  {
    r2 = (int)random(0, BOARD_SIZE * BOARD_SIZE);
  }
  while (r1 == r2);
  board[r1 % BOARD_SIZE][r1 / BOARD_SIZE] = 2;
  board[r2 % BOARD_SIZE][r2 / BOARD_SIZE] = 4;
}

void moveUp()
{
  for (int i = 0; i < BOARD_SIZE; i++)
  {
    int j;
    for (j = 0; j < BOARD_SIZE && board[i][j] == 0; j++);
    if(j != BOARD_SIZE)
  }
}

void moveDown()
{
}

void moveLeft()
{
}

void moveRight()
{
}

void keyPressed()
{
  switch(key)
  {
  case 'w':
    if (moveUp == false) moveUp();
    moveUp = true;
    break;
  case 's':
    if (moveDown == false) moveDown();
    moveDown = true;
    break;
  case 'a':
    if (moveLeft == false) moveLeft();
    moveLeft = true;
    break;
  case 'd' :
    if (moveRight == false) moveRight();
    moveRight = true;
    break;
  }
}

void keyReleased()
{
  switch(key)
  {
  case 'w':
    moveUp = false;
    break;
  case 's':
    moveDown = false;
    break;
  case 'a':
    moveLeft = false;
    break;
  case 'd' :
    moveRight = false;
    break;
  }
}
