final int sqSize = 100;
square[][][] s = new square[6][3][3];
square[][] r = new square[3][3];
square[][] f = new square[3][3];
square[][] u = new square[3][3];
square[][] d = new square[3][3];
square[][] b = new square[3][3];
String moves = new String("");

void setup()
{
  size(800, 800, P3D);
  stroke(0);
  strokeWeight(2);
  initialize();
  frameRate(60);
}

void draw()
{
  background(0);
  lights();
  translate(400, 425, -200);
  rotateX(- PI / 9);
  rotateY(- PI / 12);
  if (mousePressed)
  {
    rotateY((mouseX / float(width) - 0.5) * TWO_PI);
    rotateX(-(mouseY / float(height) - 0.5) * PI);
  }
  fill(255);
  noStroke();
  box(2, 2000, 2);
  box(2000, 2, 2);
  box(2, 2, 2000);
  stroke(0);
  drawCube();
}

void initialize()
{
  color colour;
  for (int i = 0; i < 6; i++)
  {
    colour = setColor(i);
    for (int j = 0; j < 3; j++)
      for (int k = 0; k < 3; k++)
        s[i][j][k] = new square(j, k, colour, i);
  }
}

void drawCube()
{
  for (int i = 0; i < 6; i++)
    for (int j = 0; j < 3; j++)
      for (int k = 0; k < 3; k++)
        s[i][j][k].display();
}

color setColor(int face)
{
  switch (face)
  {
    case 0 : return #8E0B0B; // red
    case 1 : return #182183; // blue
    case 2 : return #C18B14; // orange
    case 3 : return #13ED35; // green
    case 4 : return #FFFFFF; // white
    default : return #E6FA12; // yellow
  }
}

void ctrlz()
{
  if(moves.length() == 0)
    return;
  switch (moves.charAt(moves.length() - 1))
  {
    case 'r' : RMove(false); break;
    case 'R' : RMove(true); break;
    case 'u' : UMove(false); break;
    case 'U' : UMove(true); break;
    case 'f' : FMove(false); break;
    case 'F' : FMove(true); break;
    case 'l' : LMove(false); break;
    case 'L' : LMove(true); break;
    case 'b' : BMove(false); break;
    case 'B' : BMove(true); break;
    case 'd' : DMove(false); break;
    case 'D' : DMove(true); break;
    case ' ' : rotateCube(); rotateCube(); rotateCube(); break;
  }
  moves = moves.substring(0, moves.length() - 1);
}

void keyPressed()
{
  switch (key)
  {
    case 'r' : RMove(true); moves += "r"; break;
    case 'R' : RMove(false); moves += "R"; break;
    case 'u' : UMove(true); moves += "u"; break;
    case 'U' : UMove(false); moves += "U"; break;
    case 'f' : FMove(true); moves += "f"; break;
    case 'F' : FMove(false); moves += "F"; break;
    case 'l' : LMove(true); moves += "l"; break;
    case 'L' : LMove(false); moves += "L"; break;
    case 'b' : BMove(true); moves += "b"; break;
    case 'B' : BMove(false); moves += "B"; break;
    case 'd' : DMove(true); moves += "d"; break;
    case 'D' : DMove(false); moves += "D"; break;
    case ' ' : rotateCube(); moves += " "; break;
    case 'Z' : ctrlz(); break;
  }
}
