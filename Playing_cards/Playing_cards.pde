final int SIZEX = 125, SIZEY = 175, SPACE_BETWEEN_CARDS = 50;
PImage backSide;
int selectedIndex = -1, toDraw = 0, turn = 1, turnsToStay = 0, turnsToStay1 = 0, turnsToStay2 = 0;
card cardAbove, cardSelected;
button drawButton = new button(1350, 320, 100, 70, "Draw");
button restartButton = new button(1450, 50, 110, 70, "Restart");
button stayButton = new button(1350, 410, 100, 70, "Stay");

ArrayList<card> deck = new ArrayList<card>();
ArrayList<card> hand1 = new ArrayList<card>();
ArrayList<card> hand2 = new ArrayList<card>();

void setup()
{
  size(1600, 800);
  frameRate(60);
  stroke(255);
  strokeWeight(4);
  noFill();
  textSize(32);
  textAlign(CENTER, CENTER);
  backSide = loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\backSide.png");
  buildAndShuffleDeck();
  pickStartingCards();
}

void draw()
{
  background(35);
  cardAbove.display(width / 2 - SIZEX / 2, height / 2 - SIZEY / 2);
  //line(width / 2, 0, width / 2, height);
  //line(0, height / 2, width, height / 2);
  if (turn == 1)
    displayHand(hand1, hand2);
  else displayHand(hand2, hand1);
  drawButton.display();
  restartButton.display();
  stayButton.display();
  displayData();
}

void displayData()
{
  text("To Draw: " + toDraw, 300, 350);
  if (turn == 1)
  {
    text("To Stay: " + max(turnsToStay, turnsToStay1), 300, 450);
    text("Player 1:", 150, 725);
    text("Player 2:", 150, 75);
  }
  else
  {
    text("To Stay: " + max(turnsToStay, turnsToStay2), 300, 450);
    text("Player 2:", 150, 725);
    text("Player 1:", 150, 75);
  }
}

void displayHand(ArrayList<card> hand, ArrayList<card> counterHand)
{
  float spaceToLeave = (width - SIZEX - ((float)hand.size() - 1) * SPACE_BETWEEN_CARDS) / 2;
  boolean mouseOnCard = false;
  if (spaceToLeave <= mouseX && mouseX <= width - spaceToLeave)
    if (650 <= mouseY)
      mouseOnCard = true;
  for (int i = 0; i < hand.size(); i++)
  {
    card c = hand.get(i);
    if (mouseOnCard == true && abs(spaceToLeave + i * SPACE_BETWEEN_CARDS + SIZEX / 2 - mouseX) <= SIZEX / 4)
    {
      c.display(spaceToLeave + i * SPACE_BETWEEN_CARDS, 550);
      mouseOnCard = false;
    } else if (selectedIndex == i)
      c.display(spaceToLeave + i * SPACE_BETWEEN_CARDS, 550);
    else
      c.display(spaceToLeave + i * SPACE_BETWEEN_CARDS, 650);
  }
  spaceToLeave = (width - SIZEX - ((float)counterHand.size() - 1) * SPACE_BETWEEN_CARDS) / 2;
  for (int i = 0; i < counterHand.size(); i++)
    image(backSide, spaceToLeave + i * SPACE_BETWEEN_CARDS, 0, SIZEX, SIZEY);
}

void drawCards(ArrayList<card> hand, int number)
{
  for (int i = 0; i < deck.size() && number > 0; i++)
  {
    hand.add(deck.get(0));
    deck.remove(0);
    number--;
  }
}

void playCard(ArrayList<card> hand)
{
  if (turn == 1 && turnsToStay1 > 0)
  {
    turn = 2;
    turnsToStay1--;
  } else if (turn == 2 && turnsToStay2 > 0)
  {
    turn = 1;
    turnsToStay1--;
  } else if (checkValidity() == true)
  {
    if (cardSelected.val == 2 || cardSelected.val == 3)
      toDraw += cardSelected.val;
    if(cardSelected.val == 1)
      turnsToStay++;
    if(cardSelected.val == 4)
    {
      turnsToStay = 0;
      toDraw = 0;
    }
    deck.add(cardAbove);
    cardAbove = cardSelected;
    hand.remove(selectedIndex);
    if (turn == 1)
      turn = 2;
    else turn = 1;
  }
}

boolean checkValidity()
{
  if (turnsToStay > 0)
  {
    if (cardSelected.val == 1 || cardSelected.val == 4)
      return true;
    return false;
  }
  if ((cardAbove.symbol == cardSelected.symbol || cardAbove.val == cardSelected.val) && turnsToStay == 0)
    return true;
  if (cardSelected.val == 1)
    return true;
  if (cardSelected.val == 4 && toDraw > 0)
    return true;
  if (cardSelected.val == 7)
    return true;
  return false;
}

void buildAndShuffleDeck()
{
  if (deck.size() > 0)
    deck = new ArrayList<card>();
  deck.add(new card(1, "negru", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\1negru.png")));
  deck.add(new card(2, "negru", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\2negru.png")));
  deck.add(new card(3, "negru", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\3negru.png")));
  deck.add(new card(4, "negru", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\4negru.png")));
  deck.add(new card(5, "negru", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\5negru.png")));
  deck.add(new card(6, "negru", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\6negru.png")));
  deck.add(new card(7, "negru", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\7negru.png")));
  deck.add(new card(8, "negru", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\8negru.png")));
  deck.add(new card(9, "negru", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\9negru.png")));
  deck.add(new card(10, "negru", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\10negru.png")));
  deck.add(new card(11, "negru", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\11negru.png")));
  deck.add(new card(12, "negru", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\12negru.png")));
  deck.add(new card(13, "negru", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\13negru.png")));
  deck.add(new card(1, "rosu", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\1rosu.png")));
  deck.add(new card(2, "rosu", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\2rosu.png")));
  deck.add(new card(3, "rosu", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\3rosu.png")));
  deck.add(new card(4, "rosu", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\4rosu.png")));
  deck.add(new card(5, "rosu", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\5rosu.png")));
  deck.add(new card(6, "rosu", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\6rosu.png")));
  deck.add(new card(7, "rosu", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\7rosu.png")));
  deck.add(new card(8, "rosu", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\8rosu.png")));
  deck.add(new card(9, "rosu", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\9rosu.png")));
  deck.add(new card(10, "rosu", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\10rosu.png")));
  deck.add(new card(11, "rosu", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\11rosu.png")));
  deck.add(new card(12, "rosu", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\12rosu.png")));
  deck.add(new card(13, "rosu", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\13rosu.png")));
  deck.add(new card(1, "romb", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\1romb.png")));
  deck.add(new card(2, "romb", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\2romb.png")));
  deck.add(new card(3, "romb", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\3romb.png")));
  deck.add(new card(4, "romb", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\4romb.png")));
  deck.add(new card(5, "romb", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\5romb.png")));
  deck.add(new card(6, "romb", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\6romb.png")));
  deck.add(new card(7, "romb", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\7romb.png")));
  deck.add(new card(8, "romb", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\8romb.png")));
  deck.add(new card(9, "romb", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\9romb.png")));
  deck.add(new card(10, "romb", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\10romb.png")));
  deck.add(new card(11, "romb", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\11romb.png")));
  deck.add(new card(12, "romb", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\12romb.png")));
  deck.add(new card(13, "romb", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\13romb.png")));
  deck.add(new card(1, "trefla", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\1trefla.png")));
  deck.add(new card(2, "trefla", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\2trefla.png")));
  deck.add(new card(3, "trefla", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\3trefla.png")));
  deck.add(new card(4, "trefla", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\4trefla.png")));
  deck.add(new card(5, "trefla", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\5trefla.png")));
  deck.add(new card(6, "trefla", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\6trefla.png")));
  deck.add(new card(7, "trefla", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\7trefla.png")));
  deck.add(new card(8, "trefla", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\8trefla.png")));
  deck.add(new card(9, "trefla", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\9trefla.png")));
  deck.add(new card(10, "trefla", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\10trefla.png")));
  deck.add(new card(11, "trefla", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\11trefla.png")));
  deck.add(new card(12, "trefla", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\12trefla.png")));
  deck.add(new card(13, "trefla", loadImage("E:\\Mac\\Processing\\Projects\\Playing_cards\\Images\\13trefla.png")));
  for (int i = 0; i < deck.size(); i++)
  {
    int random = (int)random(0, deck.size());
    card c1 = deck.get(i);
    card c2 = deck.get(random);
    deck.set(random, c1);
    deck.set(i, c2);
  }
}

void pickStartingCards()
{
  int random = (int)random(0, deck.size());
  cardAbove = deck.get(random);
  deck.remove(random);
  if (hand1.size() > 0)
    hand1 = new ArrayList<card>();
  if (hand2.size() > 0)
    hand2 = new ArrayList<card>();
  drawCards(hand1, 5);
  drawCards(hand2, 5);
}

void mousePressed()
{
  if (turn == 1)
  {
    float spaceToLeave = (width - SIZEX - ((float)hand1.size() - 1) * SPACE_BETWEEN_CARDS) / 2;
    if (spaceToLeave <= mouseX && mouseX <= width - spaceToLeave && 650 <= mouseY)
    {
      for (int i = 0; i < hand1.size(); i++)
        if (abs(spaceToLeave + i * SPACE_BETWEEN_CARDS + SIZEX / 2 - mouseX) <= SIZEX / 4)
        {
          selectedIndex = i;
          cardSelected = hand1.get(i);
        }
    } else if ((width - SIZEX) / 2 <= mouseX && mouseX <= (width + SIZEX) / 2)
    {
      if ((height - SIZEY) / 2 <= mouseY && mouseY <= (height + SIZEY) / 2)
      {
        if (selectedIndex != -1)
        {
          playCard(hand1);
          selectedIndex = -1;
        }
      }
    } else if (drawButton.pressed() == true && max(turnsToStay, turnsToStay1) == 0)
    {
      drawCards(hand1, min(deck.size(), max(toDraw, 1)));
      toDraw = 0;
      turn = 2;
    } else if (stayButton.pressed() == true && turnsToStay > 0)
    {
      turnsToStay1 = turnsToStay;
      turnsToStay = 0;
      turn = 2;
    } else if (restartButton.pressed() == true)
      setup();
  } else
  {
    float spaceToLeave = (width - SIZEX - ((float)hand2.size() - 1) * SPACE_BETWEEN_CARDS) / 2;
    if (spaceToLeave <= mouseX && mouseX <= width - spaceToLeave && 650 <= mouseY)
    {
      for (int i = 0; i < hand2.size(); i++)
        if (abs(spaceToLeave + i * SPACE_BETWEEN_CARDS + SIZEX / 2 - mouseX) <= SIZEX / 4)
        {
          selectedIndex = i;
          cardSelected = hand2.get(i);
        }
    } else if ((width - SIZEX) / 2 <= mouseX && mouseX <= (width + SIZEX) / 2)
    {
      if ((height - SIZEY) / 2 <= mouseY && mouseY <= (height + SIZEY) / 2)
        if (selectedIndex != -1)
        {
          playCard(hand2);
          selectedIndex = -1;
        }
    } else if (drawButton.pressed() == true && max(turnsToStay, turnsToStay2) == 0)
    {
      drawCards(hand2, min(deck.size(), max(toDraw, 1)));
      toDraw = 0;
      turn = 1;
    } else if (stayButton.pressed() == true && turnsToStay > 0)
    {
      turnsToStay1 = turnsToStay;
      turnsToStay = 0;
      turn = 2;
    } else if (restartButton.pressed() == true)
      setup();
  }
}
