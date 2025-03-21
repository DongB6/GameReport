public class Projectiles{
  
   //ArrayList<PImage> images = new ArrayList<PImage>(); 
   float xPos, yPos; 
   float xSpd = 0, ySpd = 0; 
   float imageSize = 100; 
   PImage rocket, pot1; 
   float gravity = 0.1f; 
   float velocity; 

   
  //Projectile Constructor 
   public Projectiles(float xPos, float yPos, float xSpd, float ySpd, float imageSize) {
     this.xPos = xPos;
     this.yPos = yPos;
     this.xSpd = xSpd; 
     this.ySpd = ySpd; 
     this.imageSize = imageSize;
     
     imageMode(CENTER);
     rocket = loadImage("rocket.png");     
     pot1 = loadImage("pot1.png"); 
   } 
   
   public void chosenProjectile() {
   }
   
   public void drawProjectile() {
     image(pot1, xPos, yPos, imageSize, imageSize);
     moveProjectile(); 
   } 
   
   public void moveProjectile() {
     xPos += xSpd;
     yPos += ySpd; 
     ySpd += gravity; 
     
     xSpd *= 0.90; 
     ySpd *= 0.90; 
   } 
   
   public boolean caughtPlayer() { 
    if(dist(mouseX, mouseY, xPos, yPos) < ((imageSize/2) + 40)){
      return true;
    } 
      return false; 
  } 
  
  //public boolean caughtPlayer(Player player) {
  //  float distance = dist(xPos, yPos, player.xPos, player.yPos);
  //  return distance < (imageSize / 2 + player.pSize / 2) + 12;
  //}
  
  public boolean caughtBlock(Block b) {
    boolean xCollision = xPos + imageSize/2 > b.xPos && yPos - imageSize/2 < b.xPos + b.xSize;
    boolean yCollision = yPos + imageSize/2 > b.yPos && yPos - imageSize/2 < b.yPos + b.ySize; 
    return xCollision && yCollision; 
} 
  
} 
