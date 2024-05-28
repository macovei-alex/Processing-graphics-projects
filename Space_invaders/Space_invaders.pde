final int PROJECTILE_SPEED = 3, ALIEN_SIZE = 50;
final float ALIEN_SPEED = 0.5;
final int FRAMES_PER_PROJECTILE = 10;
ArrayList <Projectile> Projectiles = new ArrayList <Projectile> ();
ArrayList <Alien> Aliens = new ArrayList <Alien> ();
PlayerState player = new PlayerState();
boolean projectileEliminated = false, GAME_OVER = false;

void setup()
{
  size(800, 900);
  frameRate(120);
  stroke(255);
  fill(0);
}

void draw()
{
  background(0);
  if (GAME_OVER)
  {
    DisplayGameOver();
    return;
  }

  line(100, 0, 100, height);
  
  DisplayDefender();
  CreateAliens();
  
  if (frameCount % FRAMES_PER_PROJECTILE == 0)
  {
    int posX = min(max(120, mouseX), width - 20);
    Projectiles.add(new Projectile(posX, mousePressed && player.energy > 0));

    if (mousePressed == true)
      player.energy = max(player.energy - 5, 0);
    else
      player.energy = min(player.energy + 2, 100);
  }

  DisplayUI();

  for (int i = Projectiles.size() - 1; i >= 0; i--)
  {
    Projectile p = Projectiles.get(i);
    p.move();
    p.display();
    projectileEliminated = false;
    for (int j = Aliens.size() - 1; j >= 0 && projectileEliminated == false; j--)
    {
      Alien a = Aliens.get(j);
      a.hp -= p.checkHit(a);
      if (p.checkHit(a) > 0)
      {
        Projectiles.remove(i);
        projectileEliminated = true;
      }
      if (a.hp <= 0)
      {
        Aliens.remove(j);
        player.score++;
      } else if (a.y >= height - 35 - ALIEN_SIZE)
        GAME_OVER = true;
    }
    if (projectileEliminated == false && p.checkEnd() == true)
      Projectiles.remove(i);
  }
  for (int i = 0; i < Aliens.size(); i++)
  {
    Alien a = Aliens.get(i);
    a.move();
    a.display();
  }
}

void DisplayDefender()
{
  int posX = min(max(120, mouseX), width - 20);

  rect(posX - 20, height - 20, 40, 20);
  line(posX - 15, height - 20, posX, height - 35);
  line(posX + 15, height - 20, posX, height - 35);

  stroke(255, 80);
  line(100, height - 35, width, height - 35);
  stroke(255, 255);
}

void DisplayUI()
{
  textSize(28);
  textAlign(CENTER, CENTER);

  DisplayEnergy();
  DisplayScore();

  fill(0);
}

void DisplayEnergy()
{
  fill(0);
  rect(5, height - 120, 90, 40);

  fill(#00FF55);
  rect(5, height - 120, map(player.energy, 0, 100, 0, 90), 40);

  fill(255);
  text("Energy:", 50, height - 145);
}

void DisplayScore()
{
  fill(255);
  text("Score: ", 50, height - 250);
  text(player.score, 50, height - 220);
}

void CreateAliens()
{
  if (Aliens.size() == 0 || (Aliens.size() != 0 && Aliens.get(Aliens.size() - 1).y > 0))
    for (int i = 0; i < (width - 100) / ALIEN_SIZE; i++)
      if ((int)random(1, 10) % 4 == 0)
        Aliens.add(new Alien((i + 2) * ALIEN_SIZE));
}

void DisplayGameOver()
{
  textSize(64);
  textAlign(CENTER, CENTER);
  fill(255);
  text("Game Over", width / 2, height / 2);
}
