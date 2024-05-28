final float ACC_PER_FRAME = 0.5, BALL_RAD = 20;
ArrayList <ball> Balls = new ArrayList <ball> ();
ball b;

void setup()
{
  size(800, 600);
  noStroke();
  frameRate(60);
}

void draw()
{
  background(0);
  if(frameCount % 2 == 0)
    Balls.add(new ball(random(BALL_RAD, width - BALL_RAD), random(-4, 4)));
  for(int i = 0; i < Balls.size(); i++)
  {
    b = Balls.get(i);
    b.move_handleCollision();
    b.display();
    if(b.lifeTimer <= 0)
      Balls.remove(i--);
  }
}
