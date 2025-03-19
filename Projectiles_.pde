public class Projectiles{
  
   //ArrayList<PImage> images = new ArrayList<PImage>(); 
   float xPos, yPos; 
   float xSpd = 25, ySpd = -35; 
   float imageSize = 100; 
   PImage rocket, pot1; 
     float gravity = 0.75f; 
     float velocity; 

   
  //Projectile Constructor 
   public Projectiles(float xPos, float yPos, float imageSize) {
     this.xPos = xPos;
     this.yPos = yPos;
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
   } 
   
   public boolean caughtPlayer() { 
    if(dist(mouseX, mouseY, xPos, yPos) < ((imageSize/2) + 12)){
      return true;
    } 
      return false; 
  } 
  
  
} 
