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
  
  
  
  //Cards are in Main as of now, will move to Card. 
  
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
    image(image, xPos, yPos(), 300, 200);     
  } 
  
  /*
  public void drawCards() {
     //Setup for Cards
    fill(255);
    stroke(255,0,0);
    strokeWeight(4);
     
    //New Format of 3 - 2
    
    rect(width/2-200,100,cardXSize,cardYSize,50); 
    image(chem, width/2-25, 225, 300, 200); 
  
    rect(width/2- 800,100,cardXSize,cardYSize,50);
    image(comp, width/2-625, 225, 300,200); 
    
    rect(width/2 + 400,100,cardXSize,cardYSize,50);
    image(trig, width/2+575, 225, 300, 200); 
    
    rect(width/2+100, 600, cardXSize, cardYSize,50); 
    image(gameDev, width/2+275,725, 300,200); 
    
    rect(width/2-500,600,cardXSize,cardYSize,50); 
    image(ai, width/2-325, 725, 300,200); 
  } 
  */
  //Mouse Hover Over Card Overlay Effect 
  public boolean underCursor() {
    if(mouseX < xPos + cardXSize/2 && mouseX > xPos - cardXSize/2 
      && mouseY < yPos() + cardYSize/2 && mouseY > yPos() - cardYSize/2){
        return true;
      }
      return false;
  } 
  
  
} 
