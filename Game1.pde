//Game Choice - Rounds(Rogue-Like-CardBuilder Game)

//ArrayList for all objects 
ArrayList<Player> player = new ArrayList<>(); 
ArrayList<Projectiles> projectile = new ArrayList<Projectiles>(); 
ArrayList<Card> cards = new ArrayList<Card>(); 
ArrayList<Block> blocks = new ArrayList<Block>(); 
ArrayList<CollidableObject> objects = new ArrayList<CollidableObject>(); 

//Player p created 
Player p;  

//Card to track selected Card
Card selectedCard = null;

//movement boolean variables 
boolean up, down, left, right, jumpKey; 
//deciding gamestate 
String gameState = "playing"; 

//Images
PImage cross; 

void setup() {
  size(1100,800);
  
  p = new Player(); // Initialize the Player object
  player.add(p); // Add the Player to the player list
 
   //CrossHair 
  imageMode(CENTER); 
  cross = loadImage("crosshair.png");
  
  //Cards
  cards.add(new Card("Chemistry", "Bottles of Chemicals ", width / 2+200, 600));
  cards.add(new Card("Computer Science", " ", width / 2 - 400, 600));
  cards.add(new Card("Trigonometry", " ", width / 2 + 800, 600));
  cards.add(new Card("Game Development", " ", width / 2 + 500, 1100));
  cards.add(new Card("Artificial Intelligence", " ", width / 2 - 100, 1100));
  
  //Map 
  rectMode(CENTER); 
  playerCross(); 
  fullScreen();
  map1(); 
  border(); 

} 

public void draw() { 
  //Change//Test
  background(50);


  switch (gameState) {
    case "playing":
      drawMap(); 
      handleCollisions(); 
      handleProjectileCollisions(); 
      playerDraw();
      drawProjectiles();
      
      if (!p.alive()) { 
        gameState = "roundend";
      } 
      break;
      
    case "roundend":
      roundEnd();
      gameState = "selectcards";
      break;
      
    case "selectcards":
    //Had to remove clear Screen because it also removes the card and images
      //clearScreen();
      roundEnd(); 
      cardSelection();
      previewCard();
      break;
  }
    ////Switch Statement to swap the screens 
    //switch(gameState) {
    //  case "playing":
    //  drawMap(); 
    //  handleCollisions(); 
    //  handleProjectileCollisions(); 
    //  playerDraw();
    //  drawProjectiles(); 
   //if(p.alive()) {
   //   drawMap();
   //   handleCollisions();
   //   handleProjectileCollisions();
   //   playerDraw();
   //   drawProjectiles(); 
   //}else {
   //  roundEnd();
   //  cardSelection();
   //  previewCard(); 
   //} 
   
      //roundEnd(); 
      //cardSelection();
      //previewCard(); 
    //  if(!p.alive()){ 
    //      gameState = "roundend"; 
    //  } 
    //  break;
      
    //  case "roundend":
    //    roundEnd();
    //    gameState = "selectcards";
    //    break;
        
    //   case "selectcards":
    //     clearScreen();
    //     cardSelection();
    //     previewCard();
    //     break; 
    //}
    
    //text( ""+p.canJump, 100,100);
    //TESTING
  //if(gameState.equals("selectcards")){
  //  for(Card c: cards) {
  //    if(c.underCursor()){
  //      selectedCard = c; 
  //      previewCard();
  //      //gameState = "playing"; 
  //      //gameScreen(); 
  //      break; 
  //    } 
  //  } 
  //}
  //selectedCard = cards.get(1);
  //previewCard();
}

//Collision Method for all collidable objects, blocks and for wall jumps 
public void handleCollisions()
{
  for(CollidableObject co: objects)
    for(Block b: blocks)
      co.bounce( b.sideHitBy( co ), b );
}

//Collision Method for Projectiles
public void handleProjectileCollisions() {
  for(int i = projectile.size()-1; i >= 0; i--) {
    Projectiles pjs = projectile.get(i);
    for(Player p: player) {
      //For colliding with player 
      if(pjs.caughtPlayer()){
        p.damage(100);
        projectile.remove(i); 
        return; 
      } 
    } 
   
  
  //Collision Handle with block
  for(Block b : blocks) {
    if(pjs.caughtBlock(b)){
      projectile.remove(i);
      return; 
    } 
  } 
  }
} 

//Method for clearing the screen 
public void clearScreen() {
  player.clear();
  projectile.clear();
  cards.clear();
  blocks.clear();
  objects.clear();
  
} 

//Game boolean control 
public boolean game() {
  return true; 
} 

//Default game screen 
public void gameScreen() {
  //Resets the player and hte map
  p = new Player();
  player.add(p);
  objects.add(p);
  map1();
  border(); 
} 

//boolean for card selection to begin 
public boolean cardScreen() {
  return true; 
} 

//Card Sketch
public void cardSelection() {
  if(cardScreen()) {
    
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
} 

public void mouseMoved() {
  // Check if the mouse is over any card
  for (Card c : cards) {
    if (c.underCursor()) {
      c.selected = true;
    } else {
      c.selected = false;
    }
  }
}

//Player CrossHair 
public void playerCross() { 
  cursor(cross, mouseX, mouseY);
} 

//The red triangle indicator isnside of player 
public void directionIndicator() {
  for(int i = 0; i < player.size(); i++) {
    Player p = player.get(i); 
    float angle = atan2(mouseY - p.yPos, mouseX - p.xPos);
    
    pushMatrix();
    translate(p.xPos, p.yPos);
    rotate(angle);
    
   
    fill(255,0,0);
    noStroke();
    triangle(20,0,-20,-20,-20,20); 
    //triangle(20,0,-10,-10,-10,10);
    popMatrix(); 
  } 
} 

//Drwas player and the indicator 
public void playerDraw() { 
  for(int i = 0; i < player.size(); i++) {
    p.drawPlayer(); 
    
    //Collision for player againist blocks 
    //p.playerObst(blocks); 
  } 
  
  directionIndicator();
} 

//Draws projectile 
public void drawProjectiles() { 
  for(int i = 0; i < projectile.size(); i++) {
    Projectiles ps = projectile.get(i);
    ps.drawProjectile(); 
  } 
} 

//Spawns Projectiles
public void mouseClicked() { 
  println(gameState);
  //Card Selection Check
  if(gameState.equals("selectcards")){
    for(Card c: cards) {
      if(c.underCursor()){
        selectedCard = c; 
        gameState = "playing"; 
        gameScreen(); 
        break; 
      } 
    } 
  }
  //Allows for projectile to spawn from playe 
  for(int i = 0; i < player.size(); i++) {
      Player p = player.get(i);
      
      float angle = atan2(mouseY - p.yPos, mouseX - p.xPos);
      
      float pOffSet = p.pSize/2 + 50; 
      
      float spawnXPos = p.xPos + cos(angle) * pOffSet;
      float spawnYPos = p.yPos + sin(angle) * pOffSet; 
      
      //float xSpd = (mouseX - p.xPos) * 0.1;
      //float ySpd = (mouseY - p.yPos) * 0.1; 
      
      float xSpd = cos(angle) * 10;
      float ySpd = sin(angle) * 10; 
      
      projectile.add(new Projectiles(spawnXPos, spawnYPos-10, xSpd, ySpd,p.pSize)); 
   
  }
}

public void previewCard() {
  //Smaller Format of 1-1-1-1-1
  if(selectedCard != null) {
      PImage image = null;
      switch(selectedCard.title) {
        case "Chemistry": 
        image = selectedCard.chem; 
        break;
      case "Computer Science": 
        image = selectedCard.comp; 
        break;
      case "Trigonometry": 
        image = selectedCard.trig; 
        break;
      case "Game Development": 
        image = selectedCard.gameDev; 
        break;
      case "Artificial Intelligence": 
        image = selectedCard.ai; 
        break;
    }
    if (image != null) {
      imageMode(CORNER);
      image(image, width - 100, 40, 80, 80); // Draw the image at the top right corner in a smaller size
    }
  }
      
} 


public void roundEnd() {
    
    fill(0,0,0, 200); 
    rect(0, 0, width+2000, height+1500);
    
    textSize(200);
    fill(255); 
    text("POINT", width/2-750, height/2-360);
    player.clear();
    projectile.clear();
    
    fill(#0347FF);
    circle(width/2+300, height/2-425,200);
    
    cardScreen(); 
    gameState = "selectcards"; 
    
} 
//Method for drawin the map based on the arraylist 
public void drawMap() {
 // map1();
  //border(); 
  for(Block b: blocks) {
    b.displayBlocks(); 
  } 
  
} 

//Method for the border blocks 
public void border() {
  int borderColor = color(255,0,0); 
  //Top
  blocks.add(new Block(100, 10, width+1800, 10, borderColor));
  
  //Bottom
  blocks.add(new Block(100, height-5, width+1800, 10, borderColor));
  
  //Left 
  blocks.add(new Block(1, 0, 10, height+12000, borderColor));
  
  //Right 
  blocks.add(new Block(width+1, 0, 10, height+12000, borderColor)); 
  
  
}

//Method for the first map 
public void map1() {
  int blockColor = color(213, 255, 246); 
  //Side
  blocks.add(new Block(300,300,200,400, blockColor)); 
  blocks.add(new Block(1600, 300, 200, 400, blockColor)); 

  //Middle platform ----
  blocks.add(new Block(950, 300, 500, 100, blockColor)); 
  
  
  //Upper long platform 
  blocks.add(new Block(950,800,1000,100, blockColor));
  blocks.add(new Block(950,1100, 700, 200, blockColor)); 
  
  //Small platforms 
  blocks.add(new Block(700, 550, 200, 50, blockColor)); 
  blocks.add(new Block(1200, 550, 200, 50, blockColor)); 
  
  ////Spawner Positions 
  blocks.add(new Block(300,1100, 200, 200, blockColor)); 
  blocks.add(new Block(1600,1100, 200, 200, blockColor)); 
} 

public void keyPressed()
{
  //Directions pressed
  if( key == 'w' || key == 'W' || keyCode == UP )    up = true;
  if( key == 's' || key == 'S' || keyCode == DOWN )  down = true;
  if( key == 'a' || key == 'A' || keyCode == LEFT )  left = true;
  if( key == 'd' || key == 'D' || keyCode == RIGHT ) right = true;
  
  if( key == ' ')
    p.jump();
}

public void keyReleased()
{
  //Directions un-pressed
  if( key == 'w' || key == 'W' || keyCode == UP )    up = false;
  if( key == 's' || key == 'S' || keyCode == DOWN )  down = false;
  if( key == 'a' || key == 'A' || keyCode == LEFT ) { left = false; p.leftGrip = false; }
  if( key == 'd' || key == 'D' || keyCode == RIGHT ){ right = false; p.rightGrip = false; }
}
