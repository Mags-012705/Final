int MODE;
float GRAVITY;
float GRAVITY_ACC;
color currentCol;
float curWeight = 1;
ArrayList<Segment> lines;
int Gpoints;
Avatar current;

/*
  NOTES:
 modes go [0,1,2] -> draw, play, erase
 */

void setup() {
  size(1000, 1000);
  current = new Avatar(40, 40, 5, 5);
  currentCol = 255;
}

void draw() {
  background(255);
  if (MODE == 0) {
    if (mousePressed == true) {
      stroke(currentCol);
      strokeWeight(curWeight);
      Segment add = new Segment(mouseX, mouseY, pmouseX, pmouseY, currentCol, curWeight);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
  } else if (MODE == 1) {
    current.move();
    current.display();
  }
  
  String mo = "Mode : ";
  if (MODE == 0){
    mo += "Draw Mode";
  }else if (MODE == 1){
    mo += "Playing";
  }else if (MODE == 2){
    mo += "Erase Mode";
  }
  fill(0);
  text(mo,20,20);
  
}


void keyPressed() {
  if (key == ' ') {
    if (MODE == 2) {
      MODE = 0;
    } else {
      MODE++;
    }
    if (MODE == 1){
      current = new Avatar(40, 40, 5, 5);
    }
  }

  if (MODE == 0) {
  }
  
  if (keyCode >= 49 && keyCode <= 57) {
    curWeight = keyCode;
  }
}

void erase(){
}
