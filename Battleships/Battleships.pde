final int TILE_SIZE = 80, TILE_NUMBER = 10, BOAT_NUMBER = 18;
final color notHit = 180, notBoat = #0000FF, boat = #FF0000;
tile[][] field1 = new tile[TILE_NUMBER][TILE_NUMBER];
tile[][] field2 = new tile[TILE_NUMBER][TILE_NUMBER];
int player = 1, changeAlpha = 255, clickDelay = 0;
boolean gameEnded = false;

void setup()
{
  size(800, 1000);
  frameRate(60);
  textAlign(CENTER, CENTER);
  textSize(32);
  matricesInitialization();
}

void draw()
{
  background(0);
  if(checkEnd() == true)
    gameEnded = true;
  if (gameEnded == false)
  {
    if (clickDelay > 0)
    {
      clickDelay--;
      if (clickDelay == 0)
      {
        if (player == 1)
          player = 2;
        else player = 1;
      }
    } else if (changeAlpha < 255)
      changeAlpha += 5;
    drawField();
    displayInfo();
  } else
  {
    background(0);
    textSize(128);
    fill(255);
    strokeWeight(2);
    text("Player " + player + " wins", width / 2, height / 2);
  }
}

void drawField()
{
  if (player == 2)
  {
    for (int i = 0; i < TILE_NUMBER; i++)
      for (int j = 0; j < TILE_NUMBER; j++)
      {
        if (field1[i][j].hit == false)
          fill(notHit, changeAlpha);
        else if (field1[i][j].boat == true)
          fill(boat, changeAlpha);
        else fill(notBoat, changeAlpha);
        rect(j * TILE_SIZE, i * TILE_SIZE, TILE_SIZE, TILE_SIZE);
      }
  } else if (player == 1)
  {
    for (int i = 0; i < TILE_NUMBER; i++)
      for (int j = 0; j < TILE_NUMBER; j++)
      {
        if (field2[i][j].hit == false)
          fill(notHit, changeAlpha);
        else if (field2[i][j].boat == true)
          fill(boat, changeAlpha);
        else fill(notBoat, changeAlpha);
        rect(j * TILE_SIZE, i * TILE_SIZE, TILE_SIZE, TILE_SIZE);
      }
  }
}

void displayInfo()
{
  fill(255);
  text("Player: " + player, width / 2, (height - TILE_SIZE * TILE_NUMBER) / 2 + TILE_SIZE * TILE_NUMBER);
}

boolean checkEnd()
{
  int boatSum = 0;
  if (player == 1)
  {
    for (int i = 0; i < TILE_NUMBER; i++)
      for (int j = 0; j < TILE_NUMBER; j++)
        if (field2[i][j].hit == true && field2[i][j].boat == true)
          boatSum++;
    if (boatSum == BOAT_NUMBER)
      return true;
  }
  if (player == 2)
  {
    for (int i = 0; i < TILE_NUMBER; i++)
      for (int j = 0; j < TILE_NUMBER; j++)
        if (field1[i][j].hit == true && field1[i][j].boat == true)
          boatSum++;
    if (boatSum == BOAT_NUMBER)
      return true;
  }
  return false;
}

void mousePressed()
{
  if (clickDelay == 0 && changeAlpha == 255 && mouseY < 800)
  {
    if (player == 1 && field2[mouseY / TILE_SIZE][mouseX / TILE_SIZE].hit == false)
    {
      field2[mouseY / TILE_SIZE][mouseX / TILE_SIZE].hit = true;
    } else if (player == 2 && field1[mouseY / TILE_SIZE][mouseX / TILE_SIZE].hit == false)
    {
      field1[mouseY / TILE_SIZE][mouseX / TILE_SIZE].hit = true;
    }
    changeAlpha = 120;
    clickDelay = 10;
  }
}
