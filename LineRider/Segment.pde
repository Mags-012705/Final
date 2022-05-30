public class Segment {
  int startX;
  int startY;
  int endX;
  int endY;
  float b;
  color myColor;
  float weight;
  float frictionalCoeff;
  float A,B,C;
  float slope;
  Segment prev,next;
  
  Segment(int x, int y, int x2, int y2, color Color, float thickness) {
    startX = x;
    startY = y;
    endX = x2;
    endY = y2;
    myColor = Color;
    weight = thickness;
    slope = (float)(endY-startY)/(endX-startX);
    b = (float)y - (slope)*x;
    A = ((float)(endY-startY));
    B = (float)(endX-startX);
    C = -1 * b * (endX-startX);
    if (endX-startX == 0) {
      C = 0;
    }
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
    return slope;
  }
  float getB() {
    return b;
  }
  
  void display() {
    stroke(myColor);
    strokeWeight(weight);
    line(startX, startY, endX, endY);
  }
  
  void testing(int x, int y) {
    text("equation: " + this.A +"x " + this.B+"y " + this.C, x, 40+y);
  }
}
