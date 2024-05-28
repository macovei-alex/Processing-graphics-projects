class square
{
  int a, b, face;
  color colour;

  square(int a, int b, color colour, int face)
  {
    this.a = a * sqSize;
    this.b = b * sqSize;
    this.colour = colour;
    this.face = face;
  }

  square(square other)
  {
    a = other.a;
    b = other.b;
    face = other.face;
    colour = other.colour;
  }

  void display()
  {
    switch (face)
    {
    case 0 : // front
      fill(colour);
      beginShape();
      vertex(b - 1.5 * sqSize, a - 1.5 * sqSize, 1.5 * sqSize);
      vertex(b - 0.5 * sqSize, a - 1.5 * sqSize, 1.5 * sqSize);
      vertex(b - 0.5 * sqSize, a - 0.5 * sqSize, 1.5 * sqSize);
      vertex(b - 1.5 * sqSize, a - 0.5 * sqSize, 1.5 * sqSize);
      endShape();
      break;
    case 1 : // right
      fill(colour);
      beginShape();
      vertex(1.5 * sqSize, a - 1.5 * sqSize, 1.5 * sqSize - b);
      vertex(1.5 * sqSize, a - 0.5 * sqSize, 1.5 * sqSize - b);
      vertex(1.5 * sqSize, a - 0.5 * sqSize, 0.5 * sqSize - b);
      vertex(1.5 * sqSize, a - 1.5 * sqSize, 0.5 * sqSize - b);
      endShape();
      break;
    case 2 : // back
      fill(colour);
      beginShape();
      vertex(0.5 * sqSize - b, a - 1.5 * sqSize, -1.5 * sqSize);
      vertex(1.5 * sqSize - b, a - 1.5 * sqSize, -1.5 * sqSize);
      vertex(1.5 * sqSize - b, a - 0.5 * sqSize, -1.5 * sqSize);
      vertex(0.5 * sqSize - b, a - 0.5 * sqSize, -1.5 * sqSize);
      endShape();
      break;
    case 3 : // left
      fill(colour);
      beginShape();
      vertex(-1.5 * sqSize, a - 1.5 * sqSize, b - 1.5 * sqSize);
      vertex(-1.5 * sqSize, a - 0.5 * sqSize, b - 1.5 * sqSize);
      vertex(-1.5 * sqSize, a - 0.5 * sqSize, b - 0.5 * sqSize);
      vertex(-1.5 * sqSize, a - 1.5 * sqSize, b - 0.5 * sqSize);
      endShape();
      break;
    case 4: // top
      fill(colour);
      beginShape();
      vertex(b - 1.5 * sqSize, -1.5 * sqSize, a - 1.5 * sqSize);
      vertex(b - 0.5 * sqSize, -1.5 * sqSize, a - 1.5 * sqSize);
      vertex(b - 0.5 * sqSize, -1.5 * sqSize, a - 0.5 * sqSize);
      vertex(b - 1.5 * sqSize, -1.5 * sqSize, a - 0.5 * sqSize);
      endShape();
      break;
    case 5 : // bottom
      fill(colour);
      beginShape();
      vertex(b - 1.5 * sqSize, 1.5 * sqSize, 0.5 * sqSize - a);
      vertex(b - 0.5 * sqSize, 1.5 * sqSize, 0.5 * sqSize - a);
      vertex(b - 0.5 * sqSize, 1.5 * sqSize, 1.5 * sqSize - a);
      vertex(b - 1.5 * sqSize, 1.5 * sqSize, 1.5 * sqSize - a);
      endShape();
      break;
    }
  }
}
