public class Avatar{
  float mass;
  float xAcceleration;
  float yAcceleration;
  float wide;
  float high;
  float x;
  float y;
  float angle;
  float normalForce;
  float force;
  
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
  
}
