//Game Choice - Rounds(Rogue-Like-CardBuilder Game)

ArrayList<Player> player = new ArrayList<>(); 
ArrayList<Projectiles> projectile = new ArrayList<Projectiles>(); 

float cardXSize = 200, cardYSize = 300;

PImage chem, comp, gameDev, trig, ai; 

//Images
PImage cross; 

void setup() {
  size(1200,800);
  playerCount(); 
  
  imageMode(CENTER); 
  cross = loadImage("crosshair.png");
  chem = loadImage("chem.jpg");
  comp = loadImage("comp.jpg");
  gameDev = loadImage("gamedev.jpg");
  trig = loadImage("trig.jpg");
  ai = loadImage("ai.jpg");
  
  
  fullScreen();
} 

void draw() { 
  //Change//Test
  background(0);
  
  playerDraw(); 
  playerCross(); 
  drawProjectiles(); 
  
  //Setup for Cards
  fill(255);
  stroke(255,0,0);
  strokeWeight(4);
  
  //Smaller Copy 
  rect(25,height/2-100,250,300,50); 
  image(chem, 150, height/2, 250, 200); 

  rect(450,height/2-100,225,300,50);
  image(comp, 575, height/2, 250,200); 
  
  rect(850,height/2-100,225,300,50);
  image(trig, 975, height/2, 250, 200); 
  
  rect(1250,height/2-100,225,300,50); 
  image(gameDev, 1375,height/2, 250,200); 
  
  rect(1650,height/2 -100,225,300,50); 
  image(ai, 1775, height/2, 250,200); 
  
  
  //Bigger Copy 
  //Screen Spec not large enough to load 
  //1-1-1-1-1 Formatt
  //rect(25,100,350,400,50); 
  //image(chem, 150, height/2, 250, 200); 

  //rect(450,100,350,400,50);
  //image(comp, 575, height/2, 250,200); 
  
  //rect(850,100,350,400,50);
  //image(trig, 975, height/2, 250, 200); 
  
  //rect(1250,100,350,400,50); 
  //image(gameDev, 1375,height/2, 250,200); 
  
  //rect(1650,100,350,400,50); 
  //image(ai, 1775, height/2, 250,200); 
  
  //New Format of 3 - 2
  
  rect(width/2-200,100,350,400,50); 
  image(chem, 150, height/2, 250, 200); 

  rect(width/2- 800,100,350,400,50);
  image(comp, 575, height/2, 250,200); 
  
  rect(width/2 + 400,100,350,400,50);
  image(trig, 975, height/2, 250, 200); 
  
  //rect(1250,100,350,400,50); 
  //image(gameDev, 1375,height/2, 250,200); 
  
  //rect(1650,100,350,400,50); 
  //image(ai, 1775, height/2, 250,200); 
  
 
} 
//Card Sketch
//public void cardArt() {
//  fill(255);
//  stroke(0);
//  strokeWeight(3);
 
//} 

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
