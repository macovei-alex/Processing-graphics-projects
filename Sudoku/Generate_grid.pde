void readFromFile(int templates[][][])
{
  int poz = 0;
  String[] allLines = loadStrings("templates.txt");
  for(int i = 0; i < allLines.length; i++)
  {
    String[] line = split(allLines[i], ' ');
    for(int j = 0; j < line.length; j++)
    {
      templates[poz / 81][poz / 9 % 9][poz % 9] = int(line[j]);
      poz++;
    }
  }
}

boolean checkLine(element[][] grid, int k, int val)
{
  for (int i = 0; i < 9; i++)
    if (grid[k / 9][i].val == val)
      return false;
  return true;
}

boolean checkCol(element[][] grid, int k, int val)
{
  for (int i = 0; i < 9; i++)
    if (grid[i][k % 9].val == val)
      return false;
  return true;
}

boolean checkSquare(element[][] grid, int k, int val)
{
  int linie0 = (k / 9) / 3 * 3, coloana0 = (k % 9) / 3 * 3;
  for (int i = linie0; i < linie0 + 3; i++)
    for (int j = coloana0; j < coloana0 + 3; j++)
      if (grid[i][j].val == val)
        return false;
  return true;
}


boolean check(element[][] grid, int k, int val)
{
  return (checkLine(grid, k, val) && checkCol(grid, k, val) && checkSquare(grid, k, val));
}

void fillGrid(element[][] grid, int model[][], int[] values)
{
  for (int i = 0; i < 9; i++)
    for (int j = 0; j < 9; j++)
    {
      grid[i][j] = new element();
      if (model[i][j] != 0)
      {
        grid[i][j].val = values[model[i][j] - 1];
        grid[i][j].fix = true;
      }
    }
}

void rotateGrid(element[][] grid)
{
  int[][] aux = new int[9][9];
  for (int i = 0; i < 9; i++)
    for (int j = 0; j < 9; j++)
    {
      aux[j][8 - i] = grid[i][j].val;
      grid[i][j].fix = false;
    }
  for (int i = 0; i < 9; i++)
    for (int j = 0; j < 9; j++)
    {
      grid[i][j].val = aux[i][j];
      if (aux[i][j] != 0)
        grid[i][j].fix = true;
    }
}

void randomSort(int values[])
{
  int numarSchimbari = 20 + (int)random(0, 10), aux;
  for (int i = 0; i < numarSchimbari; i++)
  {
    int poz1 = (int)random(0, 9), poz2 = (int)random(0, 9);
    aux = values[poz1];
    values[poz1] = values[poz2];
    values[poz2] = aux;
  }
}

void solve(element[][] grid, int k, int values[])
{
  if (k < 81)
  {
    if (grid[k / 9][k % 9].fix == false)
    {
      for (int i = 0; i < 9; i++)
      {
        if (check(grid, k, values[i]) == true)
        {
          grid[k / 9][k % 9].val = values[i];
          solve(grid, k + 1, values);
        }
      }
      grid[k / 9][k % 9].val = 0;
    } else
      solve(grid, k + 1, values);
  } else if (k == 81)
    for (int i = 0; i < 9; i++)
      for (int j = 0; j < 9; j++)
        solvedGrid[i][j] = grid[i][j].val;
}

void initializeGameMatrice(int[][] game, element[][] grid)
{
  for (int i = 0; i < 9; i++)
    for (int j = 0; j < 9; j++)
      game[i][j] = grid[i][j].val;
}

void generateGrid()
{
  element[][] grid = new element[9][9];
  int[] values = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
  randomSort(values);
  int[][][] templates = new int[4][9][9];
  readFromFile(templates);
  fillGrid(grid, templates[(int)random(0, 4)], values);
  for (int i = 0; i <= (int)random(0, 4); i++)
    rotateGrid(grid);
  initializeGameMatrice(game, grid);
  solve(grid, 0, values);
}
