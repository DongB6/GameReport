public class Block {
  
  //Block Variables 
  float xPos, yPos, xSize, ySize;
  int col; 
  
  //Constructor 
  public Block(float x, float y, float w, float h, int col) {
    this.xPos = x;
    this.yPos = y;
    this.xSize = w;
    this.ySize = h; 
    this.col = col; 
  } 
  
  
  //Draws Blocks 
  public void displayBlocks() {
    fill(col);
    stroke(255);
    strokeWeight(1);
    rect(xPos, yPos, xSize, ySize); 
  } 
  
  //Method that returns an int to decide on which state the player is in to wall jump 
  int sideHitBy( CollidableObject o )
  {
    //Is it within the block:
    if( o.xPos+o.pSize/2 > xPos-xSize/2 && o.xPos-o.pSize/2 < xPos+xSize/2
    &&  o.yPos+o.pSize/2 > yPos-ySize/2 && o.yPos-o.pSize/2 < yPos+ySize/2 )
    {
                //System.out.println( millis() ); 

      if( dist( 0, o.yPos, 0, yPos-ySize/2 ) < o.pSize && o.xPos > xPos-xSize/2 && o.xPos < xPos+xSize/2 ) return 1;
      if( dist( 0, o.yPos, 0, yPos+ySize/2 ) < o.pSize && o.xPos > xPos-xSize/2 && o.xPos < xPos+xSize/2 ) return 3;
      if( dist( o.xPos, 0, xPos-xSize/2, 0 ) < o.pSize && o.yPos > yPos-ySize/2 && o.yPos < yPos+ySize/2 ) return 0;
      if( dist( o.xPos, 0, xPos+xSize/2, 0 ) < o.pSize && o.yPos > yPos-ySize/2 && o.yPos < yPos+ySize/2 ) return 2;

      //Fully Inside
      //if( o.behavior == 1 ) // <- Brings shots back to the edge
      //{                     //    Causes error for player - traps on corner
      //  o.backUp();
      //  return(sideHitBy( o ) );
      //}
      o.canJump=false;
      return -1;
    }
    else
      return -1;
  }
} 
