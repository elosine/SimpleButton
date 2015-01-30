import oscP5.*;
import netP5.*;

OscP5 osc;
NetAddress oscdest;
PushOSC b1;

void setup() {
  size(500, 500);
  
  osc = new OscP5(this, 12321);
  oscdest = new NetAddress("127.0.0.1", 57120);
   b1 = new PushOSC(100, 100, 50, 50, "/mksoundin", new Object[]{"mic1", 0}, oscdest);
}

void draw() {
  background(0);

  b1.drw();
 // b2.drw();
}

void mousePressed() {
  b1.msprs();
 // b2.msprs();
}
void mouseReleased() {
  b1.msrel();
  //b2.msrel();
}

