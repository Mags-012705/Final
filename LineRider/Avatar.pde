public class Avatar {
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

  public Avatar(float xcor, float ycor, float wi, float hi, PImage myImage_) {
    x = xcor;
    y = ycor;
    wide = wi;
    high = hi;
    mass = 30;
    angle = radians(-90);
    xAcceleration = 0.75;
    yForce = mass * GRAVITY;
    yAcceleration = yForce/mass;
    //yAcceleration = -GRAVITY * mass;
    force = mass * (sqrt(sq(xAcceleration) + sq(yAcceleration)));
    normalForce = -mass * GRAVITY;
    xForce = xAcceleration * mass;
    myImage = myImage_;
  }


  // change all phsyics variables and move the avatar=====================
  public void move () {
    force = abs(force);
    if (this.getSegment(lines) != null) {
      platform = getSegment(lines);
      calcNormAng();
      //beforePhys();
      if (angle != 0) {
        acceleration();
        forceProcessing();
        xAcceleration += xForce/mass;
      }else{
        yForce = 0;
        yAcceleration = 0;
      }
    } else {
      yAcceleration += GRAVITY;
    }
    x += xAcceleration;
    y += yAcceleration;

    //Apply grav here for now (for testing)
  }

  //THE PHYSICS FORCES IS APPLIED HERE=================================

  //Should apply friction to force
  public void friction() {
    float frictionF = platform.getCoeff() * normalForce;
    force -= frictionF;
  }


  public void airResistance() {
  }

  public void acceleration() {
    if (angle < 0) {
      force += (mass * GRAVITY * sin(angle)) + (platform.getCoeff()* mass * GRAVITY * cos(angle));
    } else if (angle > 0) {
      force += (mass * GRAVITY * sin(angle)) - (platform.getCoeff()* mass * GRAVITY * cos(angle));
    } else {
    }
  }

  //PHYSICS CAlCULATIONS FOR SEPERATE X AND Y FORCES================================
  public void calcNormAng() {
    if (platform.startY != platform.endY || platform.getSlope() == 0) {
      angle = atan((platform.getSlope()));
      float ave = abs((platform.startY - platform.endY/2));
      if (this.y > ave) {
        angle = - angle;
      }
      if (platform.getSlope() < 0) {
        angle = - angle;
        angle += PI + QUARTER_PI;
      }
      if (this.y > ave) {
        normalForce = (mass*GRAVITY) - (force * sin(angle));
      } else {
        normalForce = (mass * GRAVITY) + (force * sin(angle));
      }
    } else {
      angle = 0;
      normalForce = mass * GRAVITY;
    }
  }

  /*private void beforePhys(){
   if (angle >= 0){
   normalForce = (mass * GRAVITY) - (force * sin(angle));
   }else{
   normalForce = (mass * GRAVITY) + (force * sin(angle));
   }
   }*/


  //REDO X AND Y FORCE CALCS TO FIT NEW ANGLES
  private void forceProcessing() {
    if (angle >=0) {
      xForce = cos(angle) * force;
      yForce = sin(angle ) * force;
    } else {
      yForce = cos(angle) * force;
      xForce = sin(angle) * force;
    }
    if (angle > PI) {
      xForce = 0;
    }
    xAcceleration += xForce/ (2 *mass);
    yAcceleration = yForce/mass;
    yAcceleration += (abs(platform.startY - platform.endY)/abs(platform.startX-platform.endX)/GRAVITY);
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

  public void display() {
    pushMatrix();
    translate(x, y);
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
    translate(-x, -y);
    popMatrix();
    //ellipse(x, y, 5, 5);
  }
}
