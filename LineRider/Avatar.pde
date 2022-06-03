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
  float prevAngle = 0;
  boolean wasOnSeg = false;
  Segment prevPlat;
  
  public Avatar(float xcor, float ycor, float wi, float hi, PImage myImage_){
    x = xcor;
    y = ycor;
    wide = wi;
    high = hi;
    mass = 300;
    angle = radians(-90);
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

      text("Angle : " + degrees(angle) + " : " + angle, 20, 50);
      text("Cos : " + cos(angle) + " || Sin : " + sin(angle), 20, 160);
      text("yForce : " + yForce, 20, 70);
      text("xForce : " + xForce, 20, 90);
      text("Force : " + force, 20, 110);
      platform = getSegment(lines);
      text(QUARTER_PI + " ; " + platform.getSlope(), 20, 140);
      calcNormAng();
      beforePhys();
      //friction();
      acceleration();
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
  
  public void acceleration(){
    if (angle < 0){
      force = (mass * GRAVITY * sin(angle)  * 2) - (platform.getCoeff()* mass * GRAVITY * cos(angle) * 2);
    }else if (angle > 0){
      force = (mass * GRAVITY * sin(angle)  * 2) + (platform.getCoeff()* mass * GRAVITY * cos(angle) * 2);
    }else{
    }
  }

 //Detect wall and decrease bounce. work on opposite slope

  //PHYSICS CAlCULATIONS FOR SEPERATE X AND Y FORCES================================
  public void calcNormAng(){
    if (platform.startY != platform.endY){
      angle = atan((platform.getSlope()));
      float ave = abs((platform.startY - platform.endY/2));
      if (this.y > ave){
        angle = - angle;
      }
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
        if ((abs(current.A*x + current.B*(y) + current.C))/sqrt(current.A*current.A + current.B*current.B) < high
        && (x <= current.endX && x >= current.startX)) {
          return true;
        }
      } else if (current.endX < current.startX) {
        if ((abs(current.A*x + current.B*(y) + current.C))/sqrt(current.A*current.A + current.B*current.B) < high
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
        if ((abs(current.A*x + current.B*(y) + current.C))/sqrt(current.A*current.A + current.B*current.B) < high
        && (x <= current.endX && x >= current.startX)) {
          return current;
        }
      } else if (current.endX < current.startX) {
        if ((abs(current.A*x + current.B*(y) + current.C))/sqrt(current.A*current.A + current.B*current.B) < high
        && (x >= current.endX && x <= current.startX)) {
          return current;
        }
      }
      current = current.next;
    }
    return null;
  }
  
  //void display() {
  //  ellipse(x, y, 5, 5);
  //}
  
    public void display(){
    pushMatrix();
    translate(x,y);
    int count = 0;
    if (isOnSegment(lines) == true) {
      platform = getSegment(lines);
      rotate(platform.getAngle());
      wasOnSeg = true;
      prevAngle = platform.getAngle();
      prevPlat = platform;
      count++;
    } else if (wasOnSeg == true && count <= 2) {
      rotate(prevPlat.getAngle());
      count++;
    } else if (wasOnSeg == true && count > 2) {
      wasOnSeg = false;
      count = 0;
    }
    image(myImage, 0, 0);
    translate(-x,-y);
    popMatrix();
    //ellipse(x, y, 5, 5);
  }
  
}
