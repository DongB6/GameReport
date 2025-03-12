public class Player { 
  
  
  //Test
  float xPos = width/2;
  float yPos = height/2; 
  float pSize = 100; 
  float xSpd = 25;
  float ySpd = 25; 
  float gravity = 0.75f; 
  float jumpHeight = -25; 
  boolean jumping = false; 
  
  boolean up, down, left, right, jumpKey; 
  public Player(float xPos, float yPos) {
    
    this.xPos = xPos;
    this.yPos = yPos; 
    
    
  } 
  
  public void drawPlayer() { 
    fill(0,0,255);
    circle(xPos, yPos, pSize); 
    movePlayer();
    gravity(); 
  } 
  
  
  public void blockIndicator() {
  } 
 //Next Task 
 //Implement Gravity 
 
 public void gravity() {
   if(yPos < height - pSize/2){
     ySpd += gravity; 
     yPos += ySpd; 
     jumping = true; 
     //println("Gravity"); 
   }else {
     ySpd = 0; 
     yPos = height - pSize/2;
     jumping = false;
   } 
 } 
 
 public void jump () { 
   if(!jumping) {
     ySpd = jumpHeight;
     yPos -= 10;
  //System.out.println("Test"); 
     jumping = true; 
   } 
 } 
 public void movePlayer() { 
   //These conditionals ensure that the player positions are within the size/boundary 
    if(up && yPos > 0 + pSize/2) { 
      yPos -= ySpd; 
    } 
    if(left && xPos > 0 + pSize/2) {
      xPos -= xSpd;
    } 
    
    //Needs fixing 
    if(down && yPos < height - pSize/2) { 
      yPos += ySpd; 
    } 
    
    if(right && xPos < width - pSize/2) { 
      xPos += xSpd; 
    } 
  } 
  
 
 public void pressedKey() {
    
    if(key == 'w' || key == 'W') {
      //if(key == 32) {
      up = true; 
      //yPos += ySpd;
    } 
    
    if(key == 'a' || key == 'A') {
      left = true; 
      //xPos += xSpd; 
    }
    
    if(key == 's' || key == 'S') {
      down = true; 
      //yPos -= ySpd; 
    } 
    
    if(key == 'd' || key == 'D'){
      right = true; 
      //xPos -= xSpd; 
    } 
    
    if(key == 32) { 
      jumpKey = true; 
      jump(); 
    } 
  } 
  public void releaseKey() { 
       
    if(key == 'w' || key == 'W') {
      up = false; 
      //yPos += ySpd;
    } 
    
    if(key == 'a' || key == 'A') {
      left = false; 
      //xPos += xSpd; 
    }
    
    if(key == 's' || key == 'S') {
      down = false; 
      //yPos -= ySpd; 
    } 
    
    if(key == 'd' || key == 'D'){
      right = false; 
      //xPos -= xSpd; 
    } 
  } 
 
  
} 
