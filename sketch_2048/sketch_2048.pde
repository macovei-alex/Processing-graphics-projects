final int BOARD_SIZE = 8, SQ_SIZE = 100;

int[][] board = new int[BOARD_SIZE][BOARD_SIZE];
color[] colors = new color[12];
boolean moveUp = false, moveDown = false, moveLeft = false, moveRight = false, gameLost = false;

void setup()
{
  size(1000, 1000);
  frameRate(60);
  stroke(0);
  strokeWeight(2);
  textAlign(CENTER, CENTER);
  textSize(48);
  initializeColors();
  createNumber(2);
  createNumber(4);
}

void draw()
{
  if (gameLost == false)
  {
    background(0);
    drawBoard();
  } else
  {
    background(0);
    textSize(60);
    fill(255);
    text("YOU LOST", width / 2, height / 2);
  }
}

void drawBoard()
{
  for (int i = 0; i < BOARD_SIZE; i++)
    for (int j = 0; j < BOARD_SIZE; j++)
      if (board[i][j] != 0)
      {
        fill(colors[int(log(board[i][j]) / log(2))]);
        rect(100 + j * SQ_SIZE, 100 + i * SQ_SIZE, SQ_SIZE, SQ_SIZE);
        fill(0);
        text(board[i][j], 100 + (j + 0.5) * SQ_SIZE, 100 + (i + 0.5) * SQ_SIZE);
      }
      else
      {
        fill(colors[0]);
        rect(100 + j * SQ_SIZE, 100 + i * SQ_SIZE, SQ_SIZE, SQ_SIZE);
      }
}

void createNumber(int numberToCreate)
{
  IntList emptyPlaceList = new IntList();
  for (int i = 0; i < BOARD_SIZE * BOARD_SIZE; i++)
    if (board[i / BOARD_SIZE][i % BOARD_SIZE] == 0)
      emptyPlaceList.append(i);
  if (emptyPlaceList.size() > 0)
  {
    int place = emptyPlaceList.get((int)random(0, emptyPlaceList.size()));
    board[place / BOARD_SIZE][place % BOARD_SIZE] = numberToCreate;
  } else
    gameLost = true;
}

void moveUp()
{
  for (int col = 0; col < BOARD_SIZE; col++)
  {
    boolean moveMade = false;
    do {
      moveMade = false;
      for (int line = 1; line < BOARD_SIZE; line++)
        if (board[line][col] != 0)
        {
          if (board[line - 1][col] == 0)
          {
            board[line - 1][col] = board[line][col];
            board[line][col] = 0;
            moveMade = true;
          } else if (board[line - 1][col] == board[line][col])
          {
            board[line - 1][col] *= 2;
            board[line][col] = 0;
            moveMade = true;
          }
        }
    } while (moveMade == true);
  }
  createNumber(2);
}

void moveDown()
{
  for (int col = 0; col < BOARD_SIZE; col++)
  {
    boolean moveMade = false;
    do {
      moveMade = false;
      for (int line = BOARD_SIZE - 2; line >= 0; line--)
        if (board[line][col] != 0)
        {
          if (board[line + 1][col] == 0)
          {
            board[line + 1][col] = board[line][col];
            board[line][col] = 0;
            moveMade = true;
          } else if (board[line + 1][col] == board[line][col])
          {
            board[line + 1][col] *= 2;
            board[line][col] = 0;
            moveMade = true;
          }
        }
    } while (moveMade == true);
  }
  createNumber(2);
}

void moveLeft()
{
  for (int line = 0; line < BOARD_SIZE; line++)
  {
    boolean moveMade = false;
    do {
      moveMade = false;
      for (int col = 1; col < BOARD_SIZE; col++)
        if (board[line][col] != 0)
        {
          if (board[line][col - 1] == 0)
          {
            board[line][col - 1] = board[line][col];
            board[line][col] = 0;
            moveMade = true;
          } else if (board[line][col - 1] == board[line][col])
          {
            board[line][col - 1] *= 2;
            board[line][col] = 0;
            moveMade = true;
          }
        }
    } while (moveMade == true);
  }
  createNumber(2);
}

void moveRight()
{
  for (int line = 0; line < BOARD_SIZE; line++)
  {
    boolean moveMade = false;
    do {
      moveMade = false;
      for (int col = BOARD_SIZE - 2; col >= 0; col--)
        if (board[line][col] != 0)
        {
          if (board[line][col + 1] == 0)
          {
            board[line][col + 1] = board[line][col];
            board[line][col] = 0;
            moveMade = true;
          } else if (board[line][col + 1] == board[line][col])
          {
            board[line][col + 1] *= 2;
            board[line][col] = 0;
            moveMade = true;
          }
        }
    } while (moveMade == true);
  }
  createNumber(2);
}

void initializeColors()
{
  colors[0] = #FFFFFF;
  colors[1] = #FFFF00;
  colors[2] = #FF5000;
  colors[3] = #FF0000;
  colors[4] = #FF0050;
  colors[5] = #FF00FF;
  colors[6] = #5000FF;
  colors[7] = #0000FF;
  colors[8] = #0050FF;
  colors[9] = #00FFFF;
  colors[10] = #00FF50;
  colors[11] = #00FF00;
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
