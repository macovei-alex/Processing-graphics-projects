void setup() {
  size(400, 400);
  noFill();
  stroke(255);
}

int rad = 20;
float speed = 10, xdirection = 1, ydirection = 1, angle = PI / 3;
float xspeed = speed * cos(angle), yspeed = speed * sin(angle), xpos = width / 2, ypos = height / 2;

void draw() {
  background(0);
  xpos += xspeed * xdirection;
  ypos += yspeed * ydirection;
  if (xpos + rad >= width || xpos <= rad)
    xdirection *= -1;
  if (ypos + rad >= height || ypos <= rad)
    ydirection *= -1;
  ellipse(xpos, ypos, 2 * rad, 2 * rad);
}
