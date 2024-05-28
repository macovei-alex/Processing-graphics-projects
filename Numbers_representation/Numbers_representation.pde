int[][] matrix = new int[25][2];

void setup()
{
  size(1600, 600);
  frameRate(10);
  for (int i = 0; i < 25; i++)
  {
    matrix[i][0] = 0;
    matrix[i][1] = 0;
  }
}

int number = 1, posx = 0, matPos = 0;

void paint()
{
  background(0);
  int posx = 0, i = 0;
  while (matrix[i][0] != 0)
  {
    
    stroke(255);
    fill(120);
    if (matrix[i][0] == 1)
    {
      stroke(255, 0, 0);
      fill(120, 0, 0);
    }
    for (int j = 1; j <= matrix[i][0]; j++)
    {
      for (int k = 1; k <= matrix[i][1]; k++)
        rect(posx, 600 - k * 10, 10, 10);
      posx += 10;
    }
    posx += 10;
    i++;
  }
}

void shift()
{
  for (int i = 1; i < 25; i++)
  {
    matrix[i - 1][0] = matrix[i][0];
    matrix[i - 1][1] = matrix[i][1];
  }
}

void draw()
{
  int biggestDivisor = 1, d = 2;
  while (d <= sqrt(number))
  {
    if (number % d == 0)
      biggestDivisor = d;
    d++;
  }
  posx += 10;
  for (int j = 1; j <= biggestDivisor; j++)
  {
    for (int k = 1; k <= number / biggestDivisor; k++)
    {
      matrix[matPos][0] = biggestDivisor;
      matrix[matPos][1] = number / biggestDivisor;
    }
    posx += 10;
  }
  number += 1;
  matPos++;
  if (matPos >= 24)
  {
    shift();
    matPos--;
  }
  paint();
}
