public class Avatar{
  float wide;
  float high;
  float x;
  float y;
  Segment platform;
  float mass;
  
  float angle;
  float normalForce;
  float force;
  float yForce;
  float xForce;
  float xAcceleration;
  float yAcceleration;
  
  public Avatar(float xcor, float ycor, float wi, float hi){
    x = xcor;
    y = ycor;
    wide = wi;
    high = hi;
    mass = 10;
    
    angle = -90;
    xAcceleration = 0.75;
    force = mass * (sqrt(sq(xAcceleration) + sq(yAcceleration)));
    normalForce = -mass * GRAVITY;
    xForce = xAcceleration * mass;
    yForce = mass * GRAVITY;
    yAcceleration = yForce/mass;
  }
 
  
  // change all phsyics variables and move the avatar=====================
  public void move (){
    if (this.getSegment(lines) != null){
      calcNormAng();
      friction();
      forceProcessing();
      xAcceleration += xForce/mass;
      yAcceleration = yForce/mass;
    }else{
      yAcceleration += GRAVITY;
    }
    x += xAcceleration;
    y += yAcceleration;
    
    //Apply grav here for now (for testing)
  }
 
  //THE PHYSICS FORCES IS APPLIED HERE=================================
  
  //Should apply gravity to force
  public void friction(){
    float frictionF = platform.getCoeff() * normalForce;
    force -= frictionF;
  }
  
  
  public void airResistance(){
  }


  //PHYSICS CAlCULATIONS FOR SEPERATE X AND Y FORCES================================
  public void calcNormAng(){
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
  
  private void forceProcessing(){
    if (angle >=90){
      xForce = cos(angle) * force;
      yForce = sin(angle) * force;
    }else{
      yForce = cos(angle) * force;
      xForce = sin(angle) * force;
    }
    xAcceleration = xForce/mass;
    yAcceleration = yForce/mass;
  }
  
  
  
  //Lines stuff Here ================================= 
 
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
  
  public void setPlat(Segment on){
    platform = on;
  }
  
    public void display(){
    ellipse(x,y,wide*2,high*2);
  }
}
