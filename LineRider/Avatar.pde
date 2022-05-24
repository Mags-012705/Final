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
  }
  
  public void move (){
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
  }
  
}
