void setup() {
  size(1000,1000);
  background(255);
}

void draw() {
  stroke(0);
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}
