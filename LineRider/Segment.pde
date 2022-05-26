public class Segment {
  int startX;
  int startY;
  int endX;
  int endY;
  color myColor;
  float weight;
  float frictionalCoeff;
  Segment prev,next;
  
  Segment(int x, int y, int x2, int y2, color Color, float thickness) {
    startX = x;
    startY = y;
    endX = x2;
    endY = y2;
    myColor = Color;
    weight = thickness;
    
  }
  
  float getCoeff() {
    return (float)this.myColor*this.weight*.001;
  }
  
  int getStartX() {
    return startX;
  }
  
  int getStartY() {
    return startY;
  }
  int getEndX() {
    return endX;
  }
  
  int getEndY() {
    return endY;
  }
  
  float getSlope() {
    return (float)(endY-startY)/(endX-startX);
  }
  void display() {
    stroke(myColor);
    strokeWeight(weight);
    line(startX, startY, endX, endY);
  }
}
