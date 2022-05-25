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
    
    yAcceleration += 0.98;
  }
  
  public void friction(Segment platform){
  }
  
  public void gravity(){
  }
  
  public void airResistance(){
  }
  
  public int getForce(){
    return 0;
  }
  
  public void display(){
    ellipse(x,y,wide*2,high*2);
  }
  
}
