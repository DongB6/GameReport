class Card { 
  
  //Card Info
  String title;
  String text; 
  
  
  float xPos, yPos;
  boolean selected;
  float scale = 1;
  
  int buys;
  int draws;
  int actions;
  
  //Card Constructor 
  public Card(String title, String text) { 
    this.title = title;
    this.text = text;
    
    yPos = height-cardYSize/2;
    selected = false;
  } 
  
  
  //yPosition
  
  //Mehtod that returns yPostition
  public float yPos() {
    if(selected) {
      return yPos - cardYSize/3;
    } 
    
    return yPos;
  }
  
  //Mouse Hover Over Card Overlay Effect 
  public boolean underCursor() {
    if(mouseX < xPos + cardXSize/2 && mouseX > xPos - cardXSize/2 
      && mouseY < yPos() + cardYSize/2 && mouseY > yPos() - cardYSize/2){
        return true;
      }
      return false;
  } 
  
  
} 
