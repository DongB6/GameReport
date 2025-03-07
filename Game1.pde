//Game Choice 

ArrayList<Player> player = new ArrayList<>(); 

void setup() {
  
  size(800,800);
  
} 

void draw() { 
  //Change//Test
  background(0); 
  
  playerDraw(); 
  
  //Test
  //Change 
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
  
  for(int i = 0; i < 1; i++) {
    player.add(new Player(xPos, yPos));
  } 
} 
