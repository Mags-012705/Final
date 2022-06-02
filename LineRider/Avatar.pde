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
  PImage myImage;
  
  public Avatar(float xcor, float ycor, float wi, float hi, PImage myImage_){
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
    myImage = myImage_;
  }
 
  
  // change all phsyics variables and move the avatar=====================
  public void move (){
    force = abs(force);
    if (this.getSegment(lines) != null){
      text("Angle : " + angle, 20, 50);
      platform = getSegment(lines);
      calcNormAng();
      beforePhys();
      friction();
      forceProcessing();
      xAcceleration += 3 * xForce/mass;
      yAcceleration = yForce/(7*mass);      
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
      angle = atan((platform.getSlope()));
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
  
  private void beforePhys(){
    if (angle >= 0){
      normalForce = (mass * GRAVITY) - (force * sin(angle));
    }else{
      normalForce = (mass * GRAVITY) + (force * sin(angle));
    }
  }
  
  private void forceProcessing(){
    if (angle >=0){
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
      if (current.endX > current.startX) {
        if ((abs(current.A*x + current.B*(y+5) + current.C))/sqrt(current.A*current.A + current.B*current.B) < 20
        && (x <= current.endX && x >= current.startX)) {
          return true;
        }
      } else if (current.endX < current.startX) {
        if ((abs(current.A*x + current.B*(y+5) + current.C))/sqrt(current.A*current.A + current.B*current.B) < 20
        && (x >= current.endX && x <= current.startX)) {
          return true;
        }
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
      if (current.endX > current.startX) {
        if ((abs(current.A*x + current.B*(y+5) + current.C))/sqrt(current.A*current.A + current.B*current.B) < 20
        && (x <= current.endX && x >= current.startX)) {
          return current;
        }
      } else if (current.endX < current.startX) {
        if ((abs(current.A*x + current.B*(y+5) + current.C))/sqrt(current.A*current.A + current.B*current.B) < 20
        && (x >= current.endX && x <= current.startX)) {
          return current;
        }
      }
      current = current.next;
    }
    return null;
  }
  
    public void display(){
      text(myImage.height + "   " + myImage.width, 50, 100);
    //myImage.resize((myImage.width*100)/500, (myImage.height*100)/500);
    image(myImage, x, y);
  }
}
