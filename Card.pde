class Card { 
  PImage chem, comp, gameDev, trig, ai; 

  //Card Info
  String title;
  String text; 
  
  
  float xPos, yPos;
  boolean selected;
  float scale = 1;
  float cardXSize = 350, cardYSize = 400;

  int buys;
  int draws;
  int actions;
  
  //Card Constructor 
  public Card(String title, String text, float xPos, float yPos) { 
    this.title = title;
    this.text = text;
    this.xPos = xPos;
    this.yPos = yPos; 
    
    //yPos = height-cardYSize/2;
    selected = false;
    
    imageMode(CENTER); 
    chem = loadImage("chem.jpg");
    comp = loadImage("comp.jpg");
    gameDev = loadImage("gamedev.jpg");
    trig = loadImage("trig.jpg");
    ai = loadImage("ai.jpg");
  } 
  
  
  //#2 Card Constructor 
  public Card() {
    imageMode(CENTER); 
    chem = loadImage("chem.jpg");
    comp = loadImage("comp.jpg");
    gameDev = loadImage("gamedev.jpg");
    trig = loadImage("trig.jpg");
    ai = loadImage("ai.jpg");
  } 
  
  
  //yPosition
  
  //Mehtod that returns yPostition
  public float yPos() {
    if(selected) {
      return yPos - cardYSize/3;
    } 
    
    return yPos;
  }
  
  public void drawsCard(PImage image){
     //Setup for Cards
    fill(255);
    stroke(255,0,0);
    strokeWeight(4);
    
    rect(xPos - cardXSize / 2, yPos() - cardYSize / 2, cardXSize, cardYSize, 50);
    image(image, xPos-175, yPos()-200, 300, 200);     
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
