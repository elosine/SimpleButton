SimpleButton b1, b2;

void setup() {
  size(500, 500);
  b1 = new SimpleButton(100, 100, 50, 50);
  b2 = new SimpleButton(250, 100, 30, 30);
}

void draw() {
  background(0);

  b1.drw();
  b2.drw();
}

void mousePressed() {
  b1.msprs();
  b2.msprs();
}
void mouseReleased() {
  b1.msrel();
  b2.msrel();
  ;
}


