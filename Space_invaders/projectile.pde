class Projectile
{
  float x, y = height - 60, x1;
  boolean powerUp;

  Projectile(float tx, boolean p)
  {
    x = tx;
    powerUp = p;
    if(powerUp == true)
    {
      x1 = x + 10;
      x -= 10;
    }
  }

  void display()
  {
    if (powerUp == true)
    {
      line(x, y, x, y + 20);
      line(x1, y, x1, y + 20);
    } else
      line(x, y, x, y + 20);
  }

  void move()
  {
    y -= PROJECTILE_SPEED;
  }

  boolean checkEnd()
  {
    if (y <= 10)
      return true;
    return false;
  }
  
  int checkHit(Alien a)
  {
    int damage = 0;
    if(y <= a.y + ALIEN_SIZE && a.x <= x && x <= a.x + ALIEN_SIZE)
      damage++;
    if(powerUp == true && y <= a.y + ALIEN_SIZE && a.x <= x1 && x1 <= a.x + ALIEN_SIZE)
      damage++;
    return damage;
  }
}
