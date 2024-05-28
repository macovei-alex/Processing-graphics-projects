int sizeSq = 100, mistakes = 0, selectx = 0, selecty = 0; //<>//
int[][] solvedGrid = new int[9][9];
int[][] game = new int[9][9];
boolean[][][] pencil = new boolean[9][9][9];
boolean pencilMode = false, gameWin = false, select;

void setup()
{
  size(900, 1000);
  frameRate(60);
  textAlign(CENTER, CENTER);
  generateGrid();
  fastPencil();
}

void draw()
{
  if (mistakes < 3 && gameWin == false)
  {
    background(0);
    drawLines();
    drawMatrice();
    displayUI();
  } else if (mistakes >= 3)
  {
    background(0);
    textSize(64);
    fill(255);
    text("GAME OVER", width / 2, height / 2);
  } else
  {
    background(0);
    textSize(64);
    fill(255);
    text("YOU WIN", width / 2, height / 2);
  }
}

void drawLines()
{
  stroke(255);
  fill(0);
  for (int i = 1; i < 9; i++)
  {
    if (i % 3 == 0)
    {
      strokeWeight(4);
      line(sizeSq * i, 0, sizeSq * i, height - 100);
      line(0, sizeSq * i, width, sizeSq * i);
      strokeWeight(1);
    } else
    {
      line(sizeSq * i, 0, sizeSq * i, height - 100);
      line(0, sizeSq * i, width, sizeSq * i);
    }
  }
  strokeWeight(4);
  line(0, height - 100, width, height - 100);
  strokeWeight(1);
  fill(#3FA5D6); // blue
  rect(selectx * sizeSq + 1, selecty * sizeSq + 1, sizeSq - 2, sizeSq - 2);
  fill(#16B27F); // green
  noStroke();
  for (int i = 0; i < 9; i++)
    for (int j = 0; j < 9; j++)
      if (game[i][j] == game[selecty][selectx] && game[i][j] == solvedGrid[i][j])
        rect(j * sizeSq + 1, i * sizeSq + 1, sizeSq - 2, sizeSq - 2);
}

void drawMatrice()
{
  fill(255);
  for (int i = 0; i < 9; i++)
    for (int j = 0; j < 9; j++)
    {
      if (game[i][j] != 0) //<>//
      {
        textSize(64);
        if (game[i][j] != solvedGrid[i][j]) //<>//
        {
          fill(#FF0000); // red
          text(game[i][j], j * sizeSq + sizeSq / 2, i * sizeSq + sizeSq / 2 - 5);
          fill(255);
        } else
          text(game[i][j], j * sizeSq + sizeSq / 2, i * sizeSq + sizeSq / 2 - 5);
      } else
      {
        textSize(22);
        if (game[selecty][selectx] != 0 && pencil[i][j][game[selecty][selectx] - 1] == true)
        {
          fill(#3FA5D6); // blue
          rect(j * sizeSq + 1, i * sizeSq + 1, sizeSq - 2, sizeSq - 2);
          fill(255);
        }
        for (int k = 0; k < 9; k++)
          if (pencil[i][j][k] == true)
            text(k + 1, j * sizeSq + k % 3 * (sizeSq / 3) + 10, i * sizeSq + k / 3 * (sizeSq / 3) + 9);
      }
    }
}

void mousePressed()
{
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height - 100)
  {
    selectx = (int)mouseX / sizeSq;
    selecty = (int)mouseY / sizeSq;
  }
}

void keyPressed()
{
  if (key == ' ')
    pencilMode = !pencilMode;
  else if (key == BACKSPACE && game[selecty][selectx] != solvedGrid[selecty][selectx])
    game[selecty][selectx] = 0;
  else if (key >= '0' && key <= '9' && (game[selecty][selectx] == 0 || game[selecty][selectx] != solvedGrid[selecty][selectx]))
  {
    if (pencilMode == false)
    {
      game[selecty][selectx] = key - '0';
      if (game[selecty][selectx] != 0 && game[selecty][selectx] != solvedGrid[selecty][selectx])
        mistakes++;
      else
        updatePencil(key - '0', selecty, selectx);
    } else
      pencil[selecty][selectx][key - '0' - 1] = !pencil[selecty][selectx][key - '0' - 1];
  }
  else if((key == 'w' || (key == CODED && keyCode == UP)) && selecty > 0)
    selecty--;
  else if((key == 's' || (key == CODED && keyCode == DOWN)) && selecty < 8)
    selecty++;
  else if((key == 'a' || (key == CODED && keyCode == LEFT)) && selectx > 0)
    selectx--;
  else if((key == 'd' || (key == CODED && keyCode == RIGHT)) && selectx < 8)
    selectx++;
  checkWin();
}

void fastPencil()
{
  for (int i = 0; i < 9; i++)
    for (int j = 0; j < 9; j++)
      if (game[i][j] == 0)
      {
        for (int k = 0; k < 9; k++)
          pencil[i][j][k] = true;
        for (int k = 0; k < 9; k++)
        {
          if (game[k][j] != 0)
            pencil[i][j][game[k][j] - 1] = false;
          if (game[i][k] != 0)
            pencil[i][j][game[i][k] - 1] = false;
          if (game[i / 3 * 3 + k / 3][j / 3 * 3 + k % 3] != 0)
            pencil[i][j][game[i / 3 * 3 + k / 3][j / 3 * 3 + k % 3] - 1] = false;
        }
      }
}

void updatePencil(int val, int i, int j)
{
  for (int k = 0; k < 9; k++)
  {
    if (pencil[k][j][val - 1] == true)
      pencil[k][j][val - 1] = false;
    if (pencil[i][k][val - 1] == true)
      pencil[i][k][val - 1] = false;
    if (pencil[i / 3 * 3 + k / 3][j / 3 * 3 + k % 3][val - 1] == true)
      pencil[i / 3 * 3 + k / 3][j / 3 * 3 + k % 3][val - 1] = false;
  }
}

void checkWin()
{
  gameWin = true;
  for (int i = 0; i < 9; i++)
    for (int j = 0; j < 9; j++)
      if (game[i][j] != solvedGrid[i][j])
        gameWin = false;
}

void displayUI()
{
  fill(255);
  textSize(24);
  text("PENCIL", 100, 705);
  text("PEN", 100, 735);
  if (pencilMode == true)
    ellipse(35, 710, 20, 20);
  else
    ellipse(35, 740, 20, 20);
  text("MISTAKES: " + mistakes, 300, 725);
}
