public class Avatar{
  float wide;
  float high;
  float x;
  float y;
  
  float angle;
  float normalForce;
  float force;
  float mass;
  float xAcceleration;
  float yAcceleration;
  
  public Avatar(float xcor, float ycor, float wi, float hi){
    x = xcor;
    y = ycor;
    wide = wi;
    high = hi;
    mass = 10;
    
    xAcceleration = 0.75;
    force = mass * xAcceleration;
    normalForce = mass * yAcceleration;
  }
  
  public void move (){
    x += xAcceleration;
    y += yAcceleration;
    
    //Apply grav here for now (for testing)
    
    yAcceleration += GRAVITY;
  }
  
  public void friction(Segment platform){
    float frictionF = platform.getCoeff() * normalForce;
    force -= frictionF;
    xAcceleration = force/mass;
  }
  
  
  public void airResistance(){
  }

  
  private void calcNormAng(Segment platform){
    if (platform.startY != platform.endY){
      angle = atan(platform.getSlope());
      if (platform.startY > this.y || platform.endY > this.y){
        normalForce = (mass*GRAVITY) - (force * sin(angle));
      }else{
        normalForce = (mass * GRAVITY) + (force * sin(angle));
      }
    }else{
      angle = 0;
      normalForce = mass * xAcceleration;
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
  boolean onSegment(SegmentList segments) {
    Segment current = segments.start;
    while (current != null) {
      if ((abs(current.A*x + current.B*y + current.C))/sqrt(current.A*current.A + current.B*current.B) < 1) {
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
      if ((abs(current.A*x + current.B*y + current.C))/sqrt(current.A*current.A + current.B*current.B) < 1) {
        return current;
      }
      current = current.next;
    }
    return null;
  }
}
