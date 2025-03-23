public class Player extends CollidableObject{ 
  
  float gravity = 0.44f; 
  float jumpHeight = -35; 
  
  float maxHealth = 100;
  float health = 100; 
  float healthPercent;
  
  //Player Constructor 
  public Player() {
    
   xPos = width/2;
   yPos = height/2; 
   pSize = 75; 
   this.xSpd = 5;
   this.ySpd = 0;
   this.removed = false;
   this.canJump = false;
   this.leftGrip = false;
   this.rightGrip = false;
      
   behavior = 0;
    
   objects.add( this ); 
    
  } 
  
  
  //Draws healthbar above the player 
  public void healthBar() {
    float barWidth = 100;
    float barHeight = 5; 
     healthPercent = health/maxHealth;
    float barX = xPos - barWidth/2 + 50;
    float barY = yPos - pSize/2 -10; 
    
    fill(255,0,0);
    rect(barX, barY, barWidth, barHeight); 
    
    fill(0,255,0); 
    rect(barX, barY, barWidth * healthPercent, barHeight);
  } 
  
  //Method that checks if the player is alive 
  public boolean alive() {
    //Simplifed boolean return for if Healthpercent is above 0 
   return healthPercent > 0; 
  } 
  
  //Draws player 
  public void drawPlayer() { 
    fill(0,0,255);
    circle(xPos, yPos, pSize); 
    movePlayer();
   // gravity(); 
    healthBar(); 
  } 
  
  //Damage methodd to player 
  public void damage(float damage) {
    health -= damage; 
    System.out.println("Damaged"); 
    if(health <= 0) {
        health = 0; 
    } 
  } 
  
  //Was suppose to have a block ability in order to deflect attacks and to have certain blocks 
  public void blockIndicator() {
  } 
 
  public void jump()
  {
    
    //Attemps at debugging jumping glitch 
    if( !canJump ) return;

    canJump = false;
    
    //Wall Jump
    if( leftGrip ) xSpd = 20;
    if( rightGrip ) xSpd = -20;
    leftGrip = rightGrip = false;
    
    ySpd = -30;
  }
   //Moves Player with the left, right, up, and down and wall grips
   public void movePlayer() {
    if( left ) xSpd-=1;
    if( right )xSpd+=1;
    
    //Gravity
    //if(!canJump) {
      ySpd += 1;
    //}
    
    //Friction
    xSpd *= 0.95;
    if( leftGrip || rightGrip ) ySpd *= 0.5;  //grip strength
    else                        ySpd *= 0.95;
    
    //Move
    xPos += xSpd;
    yPos += ySpd;
    
    //Check if still gripped (so that the player will fall of the edge and not grip air)
    if( leftGrip ) xPos--;  //Move toward gripped surface
    if( rightGrip) xPos++;  //Move toward gripped surface
    if( grabbedBlock != null && grabbedBlock.sideHitBy(this) == -1 )
      leftGrip=rightGrip=false;
    
    //A few frames of Coyote time
    if( abs(ySpd) > 5 ) canJump = leftGrip = rightGrip = false;
  }
 } 
