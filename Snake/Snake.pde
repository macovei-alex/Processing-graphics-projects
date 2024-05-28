ArrayList <segment> S = new ArrayList <segment>();
int direction = 0, headDirection = 0, size = 15, applex, appley, score = 0;
segment seg, head;
boolean gameOver = false, appleExists = false;
float time = 0;

void setup()
{
  size(700, 700);
  frameRate(60);
  stroke(255);
  fill(80);
  S.add(new segment(width / 2 / size * size, height / 2 / size * size, -1, -1));
  textAlign(CENTER, CENTER);
  textSize(64);
}

void draw()
{
  if (time >= 1)
  {
    time = 0;
    background(0);
    if (gameOver == false)
    {
      if (appleExists == false)
        createApple();
      displayApple();
      head = S.get(0);
      if (head.x == applex && head.y == appley)
        eatApple();
      switch (headDirection)
      {
      case 0:
        head.x += size;
        break;
      case 1:
        head.y -= size;
        break;
      case 2:
        head.x -= size;
        break;
      case 3:
        head.y += size;
        break;
      }
      if (head.x < 0 || head.x > width - size || head.y < 0 || head.y > height - size)
        gameOver = true;
      head.display();
      for (int i = 1; i < S.size(); i++)
      {
        seg = S.get(i);
        seg.move(S.get(i - 1));
        if (seg.checkCollision(head) == false)
          seg.display();
        else
          gameOver = true;
      }
    } 
    else
      text("GAME OVER", width / 2, height / 2);
  }
  else
    time += 10 / frameRate;
}

void keyPressed()
{
  if (key == 'a')
    direction = 1;
  else if (key == 'd')
    direction = -1;
  else
    direction = 0;
  headDirection = (headDirection + direction + 4) % 4;
}

void createApple()
{
  applex = (int)random(0, width / size - 1) * size;
  appley = (int)random(0, height / size - 1) * size;
  appleExists = true;
}

void displayApple()
{
  stroke(255, 0, 0);
  fill(120, 0, 0);
  rect(applex, appley, size, size);
  stroke(255);
  fill(80); //<>//
}

void eatApple()
{
  appleExists = false;
  segment lastSeg = S.get(S.size() - 1);
  S.add(new segment(-size, -size, lastSeg.x, lastSeg.y));
  println(score++);
}
