public class Avatar{
  float xVelocity;
  float yVelocity;
  float mass;
  float xAcceleration;
  float yAcceleration;
  float wide;
  float high;
  float x;
  float y;
  float angle;
  
  public Avatar(float xcor, float ycor, float wi, float hi){
    x = xcor;
    y = ycor;
    wide = wi;
    high = hi;
    mass = 30;
    
    xAcceleration = 0.75;
  }
  
  public void move (){
    x += xAcceleration;
    y += yAcceleration;
    
    //Apply grav here for now (for testing)
    
    yAcceleration += GRAVITY;
  }
  
  public void friction(Segment platform){
    if (platform.startX == platform.endX){
      float force = mass * GRAVITY;
    }
  }
  
  public void gravity(){
  }
  
  public void airResistance(){
  }
  
  public int getForce(){
    return 0;
  }
  
  private void calcAngle(Segment platform){
    if (platform.startY != platform.endY){
      angle = atan(platform.getSlope());
    }
  }
    
  
  public void display(){
    ellipse(x,y,wide*2,high*2);
  }
  /* Should return whether or not there is a segment under 
  the avatar. Will utilize he distance between a line and a 
  point as well as the x coordinate of the avatar and see 
  if the distance is < 1 and if the x cor is between the start 
  and end x cors of the line.
  */
  boolean isOnSegment(SegmentList segments) {
    Segment current = segments.start;
    while (current != null) {
      if ((abs(current.A*x + current.B*y + current.C))/sqrt(current.A*current.A + current.B*current.B) < 20
      && (x <= current.endX && x >= current.startX)) {
        return true;
      }
      current = current.next;
    }
    return false;
  }
  
  /*should return the segment that the avatar is on 
  top of if it is on top of a segment. */
  Segment getSegment(SegmentList segments) {
    Segment current = segments.start;
    while (current != null) {
      if ((abs(current.A*x + current.B*(y+5) + current.C))/sqrt(current.A*current.A + current.B*current.B) < 20
      && (x <= current.endX && x >= current.startX)) {
        return current;
      }
      current = current.next;
    }
    return null;
  }
}
