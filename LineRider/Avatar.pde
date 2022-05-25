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
  
}
