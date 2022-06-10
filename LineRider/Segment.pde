public class Segment {
  int startX;
  int startY;
  int endX;
  int endY;
  float b;
  color myColor;
  float weight;
  float frictionalCoeff;
  float A, B, C;
  float slope;
  Segment prev, next;

  Segment(int x, int y, int x2, int y2, color Color, float thickness) {
    startX = x;
    startY = y;
    endX = x2;
    endY = y2;
    myColor = Color;
    weight = thickness;
    slope = (float)(endY-startY)/(endX-startX);
    b = (float)y - (slope)*x;
    A = -1*((float)(endY-startY));
    B = (float)(endX-startX);
    C = -1 * b * (endX-startX);
    if (endX-startX == 0) {
      C = 0;
    }
  }

  float getCoeff() {
    //if (red(myColor) == 230 && green(myColor) == 11) {
    //  return 0.001;
    //} else if (red(myColor) == 230) {
    //  return 0.0001;
    //}
    //return (float)myColor * 0.1;
    return 0.01;
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
    return 5 * slope;
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

  float getAngle() {
    return atan(slope);
  }
  
  float getDistance(float x, float y) {
    return abs((A*x + B*(y+5) + C)/sqrt(A*A + B*B));
  }
}
