int MODE;
final float GRAVITY = 0.5;
float GRAVITY_ACC;
color currentCol;
float curWeight;
SegmentList lines;
int Gpoints;
Avatar current;
ArrayList<colorBlock> colors;
/*
  NOTES:
 modes go [0,1,2] -> draw, play, erase
 */

void setup() {
  size(1500, 1000);
  background(255);
  currentCol = 0;
  curWeight = 1;
  lines = new SegmentList();
  colors = new ArrayList<colorBlock>();
  colors.add(new colorBlock(width-50, height/8, 230, 11, 11));
  colors.add(new colorBlock(width-50, 2*height/8, 230, 131, 11));
  colors.add(new colorBlock(width-50, 3*height/8, 226, 230, 11));
  colors.add(new colorBlock(width-50, 4*height/8, 11, 230, 99));
  colors.add(new colorBlock(width-50, 5*height/8, 26, 11, 230));
  colors.add(new colorBlock(width-50, 6*height/8, 164, 11, 230));
  colors.add(new colorBlock(width-50, 7*height/8, 0, 0, 0));
}

void draw() {
  background(255);
  if (MODE == 0) {    
    if (mousePressed == true) {
      lines.add(new Segment(mouseX, mouseY, pmouseX, pmouseY, currentCol, curWeight));
    }
  } else if (MODE == 1) {
    //if (current.isOnSegment(lines) != true) {
    current.move();
    //}
    current.display();
  } else if (MODE == 2) {
    if (mousePressed == true) {
      if (lines.getSegment(pmouseX, pmouseY) != null) {
        lines.delete(lines.getSegment(pmouseX, pmouseY));
      }
    }
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
  for (colorBlock a : colors) {
    a.display();
  }
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
      PImage image = loadImage("Avatar.png");
      current = new Avatar(40, 40, image.width, image.height, image);
    }
  }

  if (MODE == 0) {
  }

  if (keyCode >= 49 && keyCode <= 57) {
    curWeight = keyCode - 48;
  }

  if (key == BACKSPACE) {
    lines = new SegmentList();
  }
}

void erase() {
}

void mouseClicked() {
  for (colorBlock a : colors) {
    if (mouseX >= a.x-a.size && mouseX <= a.x+a.size &&
      mouseY >= a.y-a.size && mouseY <= a.y+a.size) {
      currentCol = a.getCol();
    }
  }
}
