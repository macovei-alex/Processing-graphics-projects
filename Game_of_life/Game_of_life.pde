int lenght = 100;

void setup()
{
  size(1020, 1020);
  stroke(255);
  fill(120);
  initializare();
  frameRate(30);
}

int[][] board = new int[lenght + 2][lenght + 2];
int[][] neighbours = new int[lenght + 2][lenght + 2];

void initializare()
{
  int i, j;
  for (i = 1; i <= lenght; i++)
    for (j = 1; j <= lenght; j++)
      if ((int)random(4) == 1)
        board[i][j] = 1;
      else
        board[i][j] = 0;
}

void paint()
{
  int i, j;
  for (i = 1; i <= lenght; i++)
    for (j = 1; j <= lenght; j++)
      if (board[i][j] == 1)
        rect(i * 10, j * 10, 10, 10);
}

void shift()
{
  int i, j;
  for (i = 1; i <= lenght; i++)
    for (j = 1; j <= lenght; j++)
      board[i][j] = neighbours[i][j];
}

void compute()
{
  int i, j;
  for (i = 1; i <= lenght; i++)
    for (j = 1; j <= lenght; j++)
    {
      neighbours[i][j] = board[i - 1][j - 1] + board[i - 1][j] + board[i - 1][j + 1] + board[i][j + 1] + board[i + 1][j + 1] + board[i + 1][j] + board[i + 1][j - 1] + board[i][j - 1];
      if ((board[i][j] == 1 && (neighbours[i][j] == 2 || neighbours[i][j] == 3)) || (board[i][j] == 0 && neighbours[i][j] == 3))
        neighbours[i][j] = 1;
      else
        neighbours[i][j] = 0;
    }
  shift();
}

void draw()
{
  background(0);
  compute();
  paint();
}
