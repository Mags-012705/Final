int MODE;
float GRAVITY;
float GRAVITY_ACC;
color currentCol;
Segment[] lines;
int Gpoints;
boolean avaThere;
Avatar current;

/*
  NOTES:
 modes go [0,1,2] -> draw, play, erase
 */

void setup() {
  size(1000, 1000);
  background(255);
  avaThere = false;
  current = new Avatar(20, 20, 5, 5);
}

void draw() {
  if (MODE == 0) {
    stroke(0);
    if (mousePressed == true) {
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
  } else if (MODE == 1) {
    current.display();
  }
}

void display() {
}

void keyPressed() {
  if (key == ' ') {
    if (MODE == 2) {
      MODE = 0;
    } else {
      MODE++;
    }
    if (MODE != 1) {
      avaThere = false;
    }
  }

  if (MODE == 0) {
  }
}

void erase(){
}
