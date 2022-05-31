public class colorBlock {
  int size = 20;
  color pColor;
  int x, y;
  
  colorBlock(int x1, int y1, color myColor) {
    x = x1;
    y = y1;
    pColor = myColor;
  }
  
  void display() {
    fill(pColor);
    square(x, y, size);
  }
}
