class player
{
  float playerSpeed = 3, playerHeight = 100, playerLength = 20, centerX, centerY;
  int hp = 100, jumpTime = JUMP_TIME_TOTAL;
  String facing = "right";
  boolean up = false, left = false, right = false;

  player(float tx, float ty)
  {
    centerX = tx - playerLength / 2;
    centerY = ty - playerHeight / 2;
  }

  void chooseMove()
  {
    if(up == true && jumpTime == JUMP_TIME_TOTAL)
      jumpTime = 0;
    if(jumpTime < JUMP_TIME_TOTAL)
      jump();
    if(left == true)
      move("left");
    if(right == true)
      move("right");
  }

  void move(String s)
  {
    switch (s)
    {
    case "left":
      if (!(centerX - playerLength / 2 - playerSpeed <= 0))
        centerX -= playerSpeed;
      facing = "left";
      break;
    case "right":
      if (!(centerX + playerLength / 2 + playerSpeed >= width))
        centerX += playerSpeed;
      facing = "right";
      break;
    }
  }

  void drawPlayer()
  {
    rect(centerX, centerY, playerLength, playerHeight);
    if (facing == "right")
      rect(centerX + playerLength / 2, centerY - playerHeight / 4, 2 * playerLength, playerHeight / 5);
    else if (facing == "left")
      rect(centerX - playerLength / 2, centerY - playerHeight / 4, 2 * playerLength, playerHeight / 5);
  }

  void jump()
  {
    if (jumpTime < JUMP_TIME_TOTAL / 2)
      centerY -= JUMP_HEIGHT_FRAME;
    else
      centerY += JUMP_HEIGHT_FRAME;
    jumpTime++;
  }
}
