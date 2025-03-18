//Game Choice - Rounds(Rogue-Like-CardBuilder Game)

ArrayList<Player> player = new ArrayList<>(); 
ArrayList<Projectiles> projectile = new ArrayList<Projectiles>(); 
ArrayList<Card> cards = new ArrayList<Card>(); 


//Images
PImage cross; 

void setup() {
  size(1200,800);
  playerCount(); 
  
  imageMode(CENTER); 
  cross = loadImage("crosshair.png");
  
  cards.add(new Card("Chemistry", "Bottles of Chemicals ", width / 2, 300));
  cards.add(new Card("Computer Science", " ", width / 2 - 600, 300));
  cards.add(new Card("Trigonometry", " ", width / 2 + 600, 300));
  cards.add(new Card("Game Development", " ", width / 2 + 300, 800));
  cards.add(new Card("Artificial Intelligence", " ", width / 2 - 300, 800));
  
  
  fullScreen();
} 

void draw() { 
  //Change//Test
  background(0);
  
 
  
   if(cardScreen()){
     player.clear();
     cardSelection(); 
   }else{
      playerDraw(); 
      playerCross(); 
      drawProjectiles(); 
   } 
  
 
}

public boolean game() {
  return true; 
} 
//Boolean to ensure that player will not be shown in cardScreen to reduce memory
public boolean cardScreen() {
  return true; 
} 
//Card Sketch
public void cardSelection() {
  player.clear(); 
  // Draw each card
  for (Card card : cards) {
    PImage image = null;  
    switch (card.title) {
      case "Chemistry": 
        image = card.chem; 
        break;
      case "Computer Science": 
        image = card.comp; 
        break;
      case "Trigonometry": 
        image = card.trig; 
        break;
      case "Game Development": 
        image = card.gameDev; 
        break;
      case "Artificial Intelligence": 
        image = card.ai; 
        break;
    }
    card.drawsCard(image);
  }
} 

void mouseMoved() {
  // Check if the mouse is over any card
  for (Card c : cards) {
    if (c.underCursor()) {
      c.selected = true;
    } else {
      c.selected = false;
    }
  }
}

public void drawScore() {
  //Top Right Corner of Screen
  //Functionality similar to the health Meter, but it only increments one when a round is over 
  
} 
public void previewCard() {
  //Smaller Format of 1-1-1-1-1
  //rect(25,height/2-100,250,300,50); 
  //image(chem, 150, height/2, 250, 200); 

  //rect(450,height/2-100,225,300,50);
  //image(comp, 575, height/2, 250,200); 
  
  //rect(850,height/2-100,225,300,50);
  //image(trig, 975, height/2, 250, 200); 
  
  //rect(1250,height/2-100,225,300,50); 
  //image(gameDev, 1375,height/2, 250,200); 
  
  //rect(1650,height/2 -100,225,300,50); 
  //image(ai, 1775, height/2, 250,200); 
} 

//Player CrossHair 
public void playerCross() { 
  stroke(0); 
  image(cross, mouseX, mouseY, 50,50);
} 

public void playerDraw() { 
  for(int i = 0; i < player.size(); i++) {
    Player p = player.get(i); 
    p.drawPlayer(); 
    //p.movePlayer(); 
  } 
} 

public void playerCount(){
  float xPos = height/2;
  float yPos = width/2; 
  
  //for(int i = 0; i < 1; i++) {
    player.add(new Player(xPos, yPos));
  //} 
} 

public void keyPressed() {
  for (int i = 0; i < player.size(); i++) {
    Player p = player.get(i);
    p.pressedKey();
  }
}

public void keyReleased() {
  for (int i = 0; i < player.size(); i++) {
    Player p = player.get(i);
    p.releaseKey();
  }
}

public void drawProjectiles() { 
  for(int i = 0; i < projectile.size(); i++) {
    Projectiles ps = projectile.get(i);
    ps.drawProjectile(); 
  } 
} 

//Spawns Projectiles
public void mouseClicked() { 
  //Allows for projectile to spawn from playe 
  for(int i = 0; i < player.size(); i++) {
        Player p = player.get(i);
      projectile.add(new Projectiles(p.xPos, p.yPos, p.pSize)); 
   
  }
} 
public void startingScreen() { 
} 

public void options() {
} 
