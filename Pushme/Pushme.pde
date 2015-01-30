/*
Add Label
 Make a toggle possibility
 
 */

import oscP5.*;
import netP5.*;

OscP5 osc;
NetAddress oscdest;
Push b1, b2;
Mkmicin mkmicin;
Mkout mkout;

void setup() {
  size(500, 500);

  osc = new OscP5(this, 12321);
  oscdest = new NetAddress("127.0.0.1", 57120);
  mkmicin = new Mkmicin();
  mkout = new Mkout();
  b1 = new Push(100, 100, 50, 50, mkmicin);
  b2 = new Push(250, 150, 30, 30, mkout);
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
}

