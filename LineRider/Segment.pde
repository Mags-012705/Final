public class Segment {
  int startX;
  int startY;
  int endX;
  int endY;
  color myColor;
  float weight;
  float frictionalCoeff;
  
  Segment(int x, int y, int x2, int y2, color Color, int thickness) {
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
}
