void rotateCube()
{
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
    {
      r[0][0] = new square(s[0][i][j]);
      s[0][i][j].colour = s[1][i][j].colour;
      s[1][i][j].colour = s[2][i][j].colour;
      s[2][i][j].colour = s[3][i][j].colour;
      s[3][i][j].colour = r[0][0].colour;
    }

  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
    {
      u[i][j] = new square(s[4][2 - j][i]);
      d[i][j] = new square(s[5][j][2 - i]);
    }

  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
    {
      s[4][i][j].colour = u[i][j].colour;
      s[5][i][j].colour = d[i][j].colour;
    }
}

void move()
{
  square aux, aux1, aux2;

  aux = new square(r[0][0]);
  r[0][0].colour = r[2][0].colour;
  r[2][0].colour = r[2][2].colour;
  r[2][2].colour = r[0][2].colour;
  r[0][2].colour = aux.colour;

  aux.colour = r[0][1].colour;
  r[0][1].colour = r[1][0].colour;
  r[1][0].colour = r[2][1].colour;
  r[2][1].colour = r[1][2].colour;
  r[1][2].colour = aux.colour;

  aux.colour = f[2][2].colour;
  aux1 = new square(f[1][2]);
  aux2 = new square(f[0][2]);

  f[2][2].colour = d[2][2].colour;
  f[1][2].colour = d[1][2].colour;
  f[0][2].colour = d[0][2].colour;

  d[2][2].colour = b[0][0].colour;
  d[1][2].colour = b[1][0].colour;
  d[0][2].colour = b[2][0].colour;

  b[0][0].colour = u[2][2].colour;
  b[1][0].colour = u[1][2].colour;
  b[2][0].colour = u[0][2].colour;

  u[2][2].colour = aux.colour;
  u[1][2].colour = aux1.colour;
  u[0][2].colour = aux2.colour;
}

void moveReverse()
{
  square aux, aux1, aux2;

  aux = new square(r[0][0]);
  r[0][0].colour = r[0][2].colour;
  r[0][2].colour = r[2][2].colour;
  r[2][2].colour = r[2][0].colour;
  r[2][0].colour = aux.colour;

  aux.colour = r[0][1].colour;
  r[0][1].colour = r[1][2].colour;
  r[1][2].colour = r[2][1].colour;
  r[2][1].colour = r[1][0].colour;
  r[1][0].colour = aux.colour;

  aux.colour = f[2][2].colour;
  aux1 = new square(f[1][2]);
  aux2 = new square(f[0][2]);

  f[2][2].colour = u[2][2].colour;
  f[1][2].colour = u[1][2].colour;
  f[0][2].colour = u[0][2].colour;

  u[2][2].colour = b[0][0].colour;
  u[1][2].colour = b[1][0].colour;
  u[0][2].colour = b[2][0].colour;

  b[0][0].colour = d[2][2].colour;
  b[1][0].colour = d[1][2].colour;
  b[2][0].colour = d[0][2].colour;

  d[2][2].colour = aux.colour;
  d[1][2].colour = aux1.colour;
  d[0][2].colour = aux2.colour;
}

void RMove(boolean forward)
{
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
    {
      r[i][j] = new square(s[1][i][j]);
      u[i][j] = new square(s[4][i][j]);
      f[i][j] = new square(s[0][i][j]);
      b[i][j] = new square(s[2][i][j]);
      d[i][j] = new square(s[5][i][j]);
    }
  if (forward == true)
    move();
  else
    moveReverse();
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
    {
      s[1][i][j] = new square(r[i][j]);
      s[4][i][j] = new square(u[i][j]);
      s[0][i][j] = new square(f[i][j]);
      s[2][i][j] = new square(b[i][j]);
      s[5][i][j] = new square(d[i][j]);
    }
}

void LMove(boolean forward)
{
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
    {
      r[i][j] = new square(s[3][i][j]);
      u[i][j] = new square(s[4][2 - i][2 - j]);
      f[i][j] = new square(s[2][i][j]);
      b[i][j] = new square(s[0][i][j]);
      d[i][j] = new square(s[5][2 - i][2 - j]);
    }
  if (forward == true)
    move();
  else
    moveReverse();
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
    {
      s[3][i][j] = new square(r[i][j]);
      s[4][2 - i][2 - j] = new square(u[i][j]);
      s[2][i][j] = new square(f[i][j]);
      s[0][i][j] = new square(b[i][j]);
      s[5][2 - i][2 - j] = new square(d[i][j]);
    }
}

void FMove(boolean forward)
{
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
    {
      r[i][j] = new square(s[0][i][j]);
      u[i][j] = new square(s[4][j][2 - i]);
      f[i][j] = new square(s[3][i][j]);
      b[i][j] = new square(s[1][i][j]);
      d[i][j] = new square(s[5][2 - j][i]);
    }
  if (forward == true)
    move();
  else
    moveReverse();
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
    {
      s[0][i][j] = new square(r[i][j]);
      s[4][j][2 - i] = new square(u[i][j]);
      s[3][i][j] = new square(f[i][j]);
      s[1][i][j] = new square(b[i][j]);
      s[5][2 - j][i] = new square(d[i][j]);
    }
}

void BMove(boolean forward)
{
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
    {
      r[i][j] = new square(s[2][i][j]);
      u[i][j] = new square(s[4][2 - j][i]);
      f[i][j] = new square(s[1][i][j]);
      b[i][j] = new square(s[3][i][j]);
      d[i][j] = new square(s[5][j][2 - i]);
    }
  if (forward == true)
    move();
  else
    moveReverse();
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
    {
      s[2][i][j] = new square(r[i][j]);
      s[4][2 - j][i] = new square(u[i][j]);
      s[1][i][j] = new square(f[i][j]);
      s[3][i][j] = new square(b[i][j]);
      s[5][j][2 - i] = new square(d[i][j]);
    }
}

void UMove(boolean forward)
{
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
    {
      r[i][j] = new square(s[4][2 - j][i]);
      u[i][j] = new square(s[3][2 - j][i]);
      f[i][j] = new square(s[0][2 - j][i]);
      b[i][j] = new square(s[2][j][2 - i]);
      d[i][j] = new square(s[1][2 - j][i]);
    }
  if (forward == true)
    move();
  else
    moveReverse();
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
    {
      s[4][2 - j][i] = new square(r[i][j]);
      s[3][2 - j][i] = new square(u[i][j]);
      s[0][2 - j][i] = new square(f[i][j]);
      s[2][j][2 - i] = new square(b[i][j]);
      s[1][2 - j][i] = new square(d[i][j]);
    }
}

void DMove(boolean forward)
{
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
    {
      r[i][j] = new square(s[5][j][2 - i]);
      u[i][j] = new square(s[1][j][2 - i]);
      f[i][j] = new square(s[0][j][2 - i]);
      b[i][j] = new square(s[2][2 - j][i]);
      d[i][j] = new square(s[3][j][2 - i]);
    }
  if (forward == true)
    move();
  else
    moveReverse();
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
    {
      s[5][j][2 - i] = new square(r[i][j]);
      s[1][j][2 - i] = new square(u[i][j]);
      s[0][j][2 - i] = new square(f[i][j]);
      s[2][2 - j][i] = new square(b[i][j]);
      s[3][j][2 - i] = new square(d[i][j]);
    }
}
