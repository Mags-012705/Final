public class colorBlock {
  int size = 20;
  int red, green, blue;
  int x, y;
  
  colorBlock(int x1, int y1, int r, int g, int b) {
    x = x1;
    y = y1;
    red = r;
    green = g;
    blue = b;
  }
  
  void display() {
    fill(red, green, blue);
    square(x, y, size);
  }
  
  color getCol() {
    return color(red,green,blue);
  }
}
