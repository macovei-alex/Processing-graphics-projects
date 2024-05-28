class Alien
{
  float x, y = -ALIEN_SIZE, hp = 5;
  
  Alien(float tx)
  {
    x = tx;
  }
  
  void move()
  {
    y += ALIEN_SPEED;
  }
  
  void display()
  {
    rect(x, y, ALIEN_SIZE, ALIEN_SIZE);
  }
}
