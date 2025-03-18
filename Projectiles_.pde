public class Projectiles{
  
   //ArrayList<PImage> images = new ArrayList<PImage>(); 
   float xPos, yPos; 
   float xSpd = 5, ySpd = 5; 
   float imageSize = 100; 
   PImage rocket; 
   
  //Projectile Constructor 
   public Projectiles(float xPos, float yPos, float imageSize) {
     this.xPos = xPos;
     this.yPos = yPos;
     this.imageSize = imageSize;
     
     imageMode(CENTER);
     rocket = loadImage("rocket.png");      
   } 
   
   public void chosenProjectile() {
   }
   
   public void drawProjectile() {
     image(rocket, xPos, yPos, imageSize, imageSize);
     moveProjectile(); 
   } 
   
   public void moveProjectile() {
     xPos += xSpd;
   } 
   
   public boolean caughtPlayer() { 
    if(dist(mouseX, mouseY, xPos, yPos) < ((imageSize/2) + 12)){
      return true;
    } 
      return false; 
  } 
  
  
} 
