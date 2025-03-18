class Deck { 
  
  //Card Data 
  
  ArrayList<Card> cards = new ArrayList<>();
  boolean info; 
  boolean face;
  float xPos, yPos; 
  int type; 
  float scale;
    float cardXSize = 350, cardYSize = 400;

  //Deck Constructor
  public Deck(float xPos, float yPos, int type) {
    this.xPos = xPos;
    this.yPos = yPos; 
    this.type = type; 
    
    
  }
    //Cards to be added 
   //public void addCard(Card c, boolean chosen) { 
   //  c.selected = false;
   //  c.scale = 1; 
   //  c.yPos = height-cardYSize/2;
   //  cards.add(c);
     
   //  //if(chosen) { 
   //  //} 
   //} 
   
   public Card drawCard() { 
     return cards.remove(0); 
   }
   
   public void shuffle() { 
     ArrayList<Card> shuffledList =new  ArrayList<>();
     
     while(cards.size() > 0) {
       shuffledList.add(cards.remove(int(random(cards.size()))));
     } 
     
     cards = shuffledList; 
   } 
   
   //public void drawDeck() {
   //} 
   
   
   //public void showCardInfo() {
   //} 
   
   //public void showCardCOunt() {
   //} 
   
   public boolean underCursor() {
     if( mouseX < xPos + cardXSize/2*scale
     && mouseX > xPos - cardXSize/2*scale
     && mouseY < yPos + cardYSize/2*scale
     && mouseY > yPos - cardYSize/2*scale )
    {
      return true;
    }
    return false;
  }
    
} 
