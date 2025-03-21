public class Player extends CollidableObject{ 
  
  
  //Test
  //float xPos;
  //float yPos; 
  //float pSize; 
  //float xSpd = 15;
  //float ySpd = 0; 
  float gravity = 0.44f; 
  float jumpHeight = -35; 
  
  float maxHealth = 100;
  float health = 100; 
  float healthPercent;
  
  //boolean jumping = false; 
  //boolean wallJumping = false; 
  //boolean leftWall = false;
  //boolean rightWall = false; 
  
  
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
  
  public boolean alive() {
    if(healthPercent == 0) {
      return false; 
    }else {
      return true; 
    } 
  } 
  public void drawPlayer() { 
    fill(0,0,255);
    circle(xPos, yPos, pSize); 
    movePlayer();
   // gravity(); 
    healthBar(); 
  } 
  
  public void damage(float damage) {
    health -= damage; 
    System.out.println("Damaged"); 
    if(health <= 0) {
        health = 0; 
    } 
  } 
  
  public void blockIndicator() {
  } 
 
  public void jump()
  {
    if( !canJump ) return;
    
    canJump = false;
    
    //Wall Jump
    if( leftGrip ) xSpd = 20;
    if( rightGrip ) xSpd = -20;
    leftGrip = rightGrip = false;
    
    ySpd = -30;
  }
 
   public void movePlayer() {
    if( left ) xSpd-=1;
    if( right )xSpd+=1;
    
    //Gravity
    if(!canJump) {
      ySpd += 1;
    }
    
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
 

  /*
  public void playerObst(ArrayList<Block> blocks) {
    leftWall = false; 
    rightWall = false; 

    for (Block block : blocks) { 
        boolean xCollision = xPos + pSize / 2 > block.xPos && xPos - pSize / 2 < block.xPos + block.w; 
        boolean yCollision = yPos + pSize / 2 > block.yPos && yPos - pSize / 2 < block.yPos + block.h; 

        if (xCollision && yCollision) {
            float overlapTop = yPos + pSize / 2 - block.y;
            float overlapBottom = block.y + block.h - (yPos - pSize / 2);
            float overlapLeft = xPos + pSize / 2 - block.x;
            float overlapRight = block.x + block.w - (xPos - pSize / 2);

            // Determine the smallest overlap to resolve collision properly
            if (overlapTop < overlapBottom && overlapTop < overlapLeft && overlapTop < overlapRight) {
                // Player landed on top of block
                yPos = block.y - pSize / 2;
                ySpd = 0;
                jumping = false;
            } else if (overlapBottom < overlapTop && overlapBottom < overlapLeft && overlapBottom < overlapRight) {
                // Player hit bottom of block
                yPos = block.y + block.h + pSize / 2;
                ySpd = 0;
            } else if (overlapLeft < overlapRight) {
                // Player hit left wall
                xPos = block.x - pSize / 2;
                leftWall = true;
                if (jumping) {
                    wallJumping = true; // Allow wall jumping only if jumping
                }
            } else {
                // Player hit right wall
                xPos = block.x + block.w + pSize / 2;
                rightWall = true;
                if (jumping) {
                    wallJumping = true;
                }
            }
        }
    }
    

}
*/ 

 
 } 
