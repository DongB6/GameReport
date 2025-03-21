abstract class CollidableObject
{
  float xPos, yPos;
  float xSpd, ySpd;
  float pSize;
  
  int behavior; //how it bounces  :  0-stop, 1-bounce, 2-destroyed
  
  boolean removed;
  
  boolean canJump;             //mostly for players
  boolean leftGrip, rightGrip; //mostly for players
  Block grabbedBlock = null;   //for player to track the block it's gripping
  
  public void bounce( int side, Block b ) //side from which it bounces  :  0-left  1-top  2-right  3-bottom
  {
    //No bounce
    if( side == -1 ) return;
    
    //Snap to side
    if( side == 0 ) while( xPos+pSize/2 >= b.xPos-b.xSize/2 ) xPos--;
    if( side == 1 ) while( yPos+pSize/2 >= b.yPos-b.ySize/2 ) yPos--;
    if( side == 2 ) while( xPos-pSize/2 <= b.xPos+b.xSize/2 ) xPos++;
    if( side == 3 ) while( yPos-pSize/2 <= b.yPos+b.ySize/2 ) yPos++;
    
    //Can jump after landing on top
    if( side == 1 ) canJump = true;
    
    switch( behavior )
    {
      case 0: //stop
        if( side == 0 || side == 2 ) //hit side (can grab)
        {
          xSpd = 0;
          if( left && side == 2 )
            leftGrip = true;
          if( right && side == 0 )
            rightGrip = true;
          if( leftGrip || rightGrip )
          {
            canJump = true;
            grabbedBlock = b;
          }
        }
        if( side == 1 || side == 3 ) //hit top/bottom
        {
          ySpd = 0;
        }
        break;
      
      case 1: //bounce (not fully elastic)
        if( side == 0 || side == 2 ) xSpd = -xSpd*0.9;
        if( side == 1 || side == 3 ) ySpd = -ySpd*0.9;
        break;
        
      case 2: //removed
        removed = true;
        break;
        
    }
  }
  
  //This brings objects back to the edge of the block
  void backUp()
  {
    xPos -= xSpd/10;
    yPos -= ySpd/10;
  }
}
