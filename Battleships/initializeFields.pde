void matricesInitialization()
{
  String[] lines1 = loadStrings("input1.txt");
  String[] lines2 = loadStrings("input2.txt");
  for (int i = 0; i < TILE_NUMBER; i++)
    for (int j = 0; j < TILE_NUMBER; j++)
    {
      field1[i][j] = new tile();
      field2[i][j] = new tile();
    }
  if(!readAndCheckMatrix(lines1, 1))
    gameEnded = true;
  if(!readAndCheckMatrix(lines2, 2))
    gameEnded = true;
}

boolean readAndCheckMatrix(String[] lines, int matrixNumber)
{
  int[][] mat = new int[TILE_NUMBER][TILE_NUMBER];
  for(int i = 0; i < TILE_NUMBER; i++)
  {
    String[] line = split(lines[i], ' ');
    for(int j = 0; j < TILE_NUMBER; j++)
      mat[i][j] = int(line[j]);
  }
  //if(!checkValidMatrix(mat1))
    //return false;
  if(matrixNumber == 1)
  {
    for(int i = 0; i < TILE_NUMBER; i++)
      for(int j = 0; j < TILE_NUMBER; j++)
        field1[i][j].boat = (mat[i][j] == 1);
  }
  else
  {
    for(int i = 0; i < TILE_NUMBER; i++)
      for(int j = 0; j < TILE_NUMBER; j++)
        field2[i][j].boat = (mat[i][j] == 1);
  }
  return true;
}

boolean checkValidMatrix(int[][] mat)
{
  int[] boatSizes = new int[4];
  boatSizes[0] = 2;
  boatSizes[1] = 3;
  boatSizes[2] = 2;
  boatSizes[3] = 1;
  for (int i = 0; i < TILE_NUMBER; i++)
    for (int j = 0; j < TILE_NUMBER; j++)
      if (mat[i][j] == 1)
      {
        int boatSize = searchBoatTiles(mat, i, j);
        if (0 < boatSize && boatSize <= 4)
          boatSizes[boatSize - 1]--;
      }
  for (int i = 0; i < 4; i++)
    if (boatSizes[i] != 0)
      return false;
  return true;
}

int searchBoatTiles(int[][] mat, int i, int j)
{
  if (0 <= i && i < TILE_NUMBER && 0 <= j  && j < TILE_NUMBER && mat[i][j] == 1)
  {
    mat[i][j] = 2;
    return 1 + searchBoatTiles(mat, i - 1, j) + searchBoatTiles(mat, i + 1, j) + searchBoatTiles(mat, i, j - 1) + searchBoatTiles(mat, i, j + 1);
  }
  return 0;
}
