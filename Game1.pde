//Game Choice - Rounds(Rogue-Like-CardBuilder Game)

ArrayList<Player> player = new ArrayList<>(); 
ArrayList<Projectiles> projectile = new ArrayList<Projectiles>(); 

float cardXSize = 200, cardYSize = 300;

//Images
PImage cross; 

void setup() {
  size(800,800);
  playerCount(); 
  
  imageMode(CENTER); 
  cross = loadImage("crosshair.png");
} 

void draw() { 
  //Change//Test
  background(255);
  
  playerDraw(); 
  playerCross(); 
  drawProjectiles(); 
 
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
