void setup()
{
  size(800, 800);
  frameRate(600);
  fill(255);
  noStroke();
  initializeArray();
}

final int size = 1000, indexNumber = 20;
int[] v = new int[size];
int[] index = new int[indexNumber];

void draw()
{
  background(0);
  displayRect();
  for (int i = 0; i < indexNumber; i++)
    if (index[i] < size - 1)
    {
      if (v[index[i]] > v[index[i] + 1])
      {
        int aux = v[index[i]];
        v[index[i]] = v[index[i] + 1];
        v[index[i] + 1] = aux;
      }
      index[i]++;
    } else
      index[i] = 0;
}

void initializeArray()
{
  for (int i = 0; i < size; i++)
    v[i] = (int)random(0, size);
  for(int i = 0; i < indexNumber; i++)
    index[i] = i * size / indexNumber;
}

void displayRect()
{
  float x = 0;
  for (int i = 0; i < size; i++)
  {
    rect(x, height, (float)width / size, -(float)height / size * v[i]);
    x += (float)width / size;
  }
}
