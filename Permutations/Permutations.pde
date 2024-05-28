int[] v = new int[10];
int k = 0, lungimeNumar = 5, numarCifre = 9;
boolean ultimulNumar = false;

void setup()
{
  size(300, 200);
  frameRate(600);
  textSize(64);
  fill(255);
  textAlign(CENTER, CENTER);
}

void draw()
{
  if (ultimulNumar == false)
  {
    background(0);
    while (k < lungimeNumar)
    {
      if (v[k] > numarCifre)
        v[k] = 1;
      else v[k]++;
      while (verificare() == false && v[k] <= numarCifre)
        v[k]++;
      if (v[k] > numarCifre)
        k--;
      else
        k++;
    }
    k = lungimeNumar - 1;
    afisare();
  }
}

void afisare()
{
  int nr = 0;
  ultimulNumar = true;
  for (int i = 0; i < lungimeNumar; i++)
  {
    nr = nr * 10 + v[i];
    if (v[i] != numarCifre - i)
      ultimulNumar = false;
  }
  text(nr, width / 2, height / 2);
}

boolean verificare()
{
  for (int i = 0; i < k; i++)
    if (v[i] == v[k])
      return false;
  return true;
}
