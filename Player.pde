public class Player { 
  
  
  //Test
  float xPos, yPos;
  float pSize = 100; 
  
  public Player(float xPos, float yPos) {
    
    this.xPos = xPos;
    this.yPos = yPos; 
    
    
  } 
  
  public void drawPlayer() { 
    fill(255);
    circle(xPos, yPos, pSize); 
  } 
  
  
  
} 
