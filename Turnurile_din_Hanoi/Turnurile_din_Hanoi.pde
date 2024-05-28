final int NR_INELE = 20, XMIN = 50;
float DELTAX = 30, DIMY = 40;
FloatList turnA = new FloatList(), turnB = new FloatList(), turnC = new FloatList();
StringList mutari = new StringList();
float I, I2;
int clic = 0, i = 0;
boolean victorie = false, seRezolva = false;

void setup()
{
  size(1500, 1000);
  frameRate(60);
  stroke(255);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  initializare();
}

void draw()
{
  if ((turnB.size() != NR_INELE && turnC.size() != NR_INELE))
  {
    background(60);
    stalpi();
    desenareTurn('A');
    desenareTurn('B');
    desenareTurn('C');
  } else if(seRezolva == false)
  {
    background(0);
    fill(255);
    textSize(128);
    text("GATA!", width / 2, height / 2);
    textSize(20);
    text("in sfarsit :(", width / 2, height / 2 + 100);
  }
  if (seRezolva == true)
  {
    background(60);
    stalpi();
    desenareTurn('A');
    desenareTurn('B');
    desenareTurn('C');
    if (i < mutari.size())
      citireMutari(i);
    else if(i == mutari.size())
      println(i);
    i++;
  } 
}

void initializare()
{
  if (NR_INELE * DELTAX >= XMIN)
    DELTAX = (float)(width / 3 - XMIN) / NR_INELE;
  if (DIMY * NR_INELE > 780)
    DIMY = 780.0 / NR_INELE;
  turnA.clear();
  for (int i = 1; i <= NR_INELE; i++)
    turnA.append(width / 3 - i * DELTAX);
  turnB.clear();
  turnC.clear();
}

void stalpi()
{
  line(width / 3, 0, width / 3, height);
  line(2 * width / 3, 0, 2 * width / 3, height);
  fill(0);
  rect(1 * width / 6, 900, width / 3, 20);
  rect(3 * width / 6, 900, width / 3, 20);
  rect(5 * width / 6, 900, width / 3, 20);
  rect(1 * width / 6, 500, 20, 780);
  rect(3 * width / 6, 500, 20, 780);
  rect(5 * width / 6, 500, 20, 780);
  fill(160);
  textSize(40);
  text("A", 1 * width / 6, 950);
  text("B", 3 * width / 6, 950);
  text("C", 5 * width / 6, 950);
  textSize(20);
}

void desenareTurn(char coloana)
{
  float y = 890 - DIMY / 2;
  switch(coloana)
  {
  case 'A':
    for (int i = 0; i < turnA.size(); i++)
    {
      I = turnA.get(i);
      fill(160);
      if (i == turnA.size() - 1 && clic == 1)
        fill(220);
      rect(1 * width / 6, y, I, DIMY);
      fill(0);
      text((int)(NR_INELE - (width / 3 - I) / DELTAX + 1), 1 * width / 6, y);
      y -= DIMY;
    }
    break;
  case 'B':
    for (int i = 0; i < turnB.size(); i++)
    {
      I = turnB.get(i);
      fill(160);
      if (i == turnB.size() - 1 && clic == 2)
        fill(220);
      rect(3 * width / 6, y, I, DIMY);
      fill(0);
      text((int)(NR_INELE - (width / 3 - I) / DELTAX + 1), 3 * width / 6, y);
      y -= DIMY;
    }
    break;
  case 'C':
    for (int i = 0; i < turnC.size(); i++)
    {
      I = turnC.get(i);
      fill(160);
      if (i == turnC.size() - 1 && clic == 3)
        fill(220);
      rect(5 * width / 6, y, I, DIMY);
      fill(0);
      text((int)(NR_INELE - (width / 3 - I) / DELTAX + 1), 5 * width / 6, y);
      y -= DIMY;
    }
    break;
  }
}

void transfer(FloatList donator, FloatList primitor)
{
  if (donator.size() > 0)
  {
    I2 = donator.get(donator.size() - 1);
    if (primitor.size() > 0)
      I = primitor.get(primitor.size() - 1);
    if (primitor.size() == 0 || I2 < I)
    {
      donator.remove(donator.size() - 1);
      primitor.append(I2);
    }
  }
}

void rezolvare(FloatList A, FloatList B, FloatList C, int nr, String a, String b, String c) // DONATOR, PRIMITOR, INTERMEDIAR
{
  if (nr == 1)
  {
    mutari.append(a + b);
  } else
  {
    rezolvare(A, C, B, nr - 1, a, c, b);
    mutari.append(a + b);
    rezolvare(C, B, A, nr - 1, c, b, a);
  }
}

void citireMutari(int i)
{
  String mutare = mutari.get(i);
  switch(mutare)
  {
  case "ab" :
    transfer(turnA, turnB);
    break;
  case "ac" :
    transfer(turnA, turnC);
    break;
  case "ba" :
    transfer(turnB, turnA);
    break;
  case "bc" :
    transfer(turnB, turnC);
    break;
  case "ca" :
    transfer(turnC, turnA);
    break;
  case "cb" :
    transfer(turnC, turnB);
    break;
  default :
    print("er");
    break;
  }
}

void keyPressed()
{
  if (key == ENTER)
  {
    initializare();
    seRezolva = !seRezolva;
    if (seRezolva == true)
    {
      rezolvare(turnA, turnB, turnC, NR_INELE, "a", "b", "c");
      PrintWriter output = createWriter("output.txt");
      for(int i = 0; i < mutari.size(); i++)
      {
        output.print(mutari.get(i) + " ");
        if(i % 38 == 37)
          output.print('\n');
      }
      output.flush();
      output.close();
    }
  }
}

void mousePressed()
{
  if (seRezolva == false)
  {
    if (0 <= mouseX && mouseX < width / 3)
    {
      if (clic == 0)
        clic = 1;
      else if (clic != 1)
      {
        if (clic == 2)
          transfer(turnB, turnA);
        else
          transfer(turnC, turnA);
        clic = 0;
      } else
        clic = 0;
    } else if (width / 3 <= mouseX && mouseX < 2 * width / 3)
    {
      if (clic == 0)
        clic = 2;
      else if (clic != 2)
      {
        if (clic == 1)
          transfer(turnA, turnB);
        else
          transfer(turnC, turnB);
        clic = 0;
      } else
        clic = 0;
    } else
    {
      if (clic == 0)
        clic = 3;
      else if (clic != 3)
      {
        if (clic == 1)
          transfer(turnA, turnC);
        else
          transfer(turnB, turnC);
        clic = 0;
      } else clic = 0;
    }
  } else
    clic = 0;
}
