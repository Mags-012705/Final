int MODE;
final float GRAVITY = 0.5;
float GRAVITY_ACC;
color currentCol;
float curWeight;
SegmentList lines;
int Gpoints;
Avatar current;

/*
  NOTES:
 modes go [0,1,2] -> draw, play, erase
 */

void setup() {
  size(1000, 1000);
  background(255);
  current = new Avatar(40, 40, 5, 5);
  currentCol = 0;
  curWeight = 1;
  lines = new SegmentList();
}

void draw() {
  background(255);
  if (MODE == 0) {
    if (mousePressed == true) {
      lines.add(new Segment(mouseX, mouseY, pmouseX, pmouseY, currentCol, curWeight));
    }
  } else if (MODE == 1) {
    if (current.isOnSegment(lines) != true) {
      current.move();
    }
    current.display();
  }
  lines.display();

  String mo = "Mode : ";
  if (MODE == 0) {
    mo += "Draw Mode";
  } else if (MODE == 1) {
    mo += "Playing";
  } else if (MODE == 2) {
    mo += "Erase Mode";
  }
  fill(0);
  text(mo, 20, 20);
  text("Weight: " + curWeight, 20, 30);
  lines.testing();
}


void keyPressed() {
  if (key == ' ') {
    if (MODE == 2) {
      MODE = 0;
    } else {
      MODE++;
    }
    if (MODE == 1) {
      current = new Avatar(40, 40, 5, 5);
    }
  }

  if (MODE == 0) {
  }

  if (keyCode >= 49 && keyCode <= 57) {
    curWeight = keyCode - 48;
  }
}

void erase() {
}
