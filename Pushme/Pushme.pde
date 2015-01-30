/*
4 DSP banks with all available dsp
      toggles that shut off the others in the bank - one effect at a time
A thru button in each bank on by default
Adapt this to the more robust dsp framework
     get rid of the bullshit controlp5
     presets look at timelines
 
 */

import oscP5.*;
import netP5.*;

OscP5 osc;
NetAddress oscdest;
Push b1, b2;
Mkmicin mkmicin;
Mkout mkout;
Killmicin killmicin;
Killout killout;
PFont liGothicMed10;

void setup() {
  size(500, 500);
  osc = new OscP5(this, 12321);
  oscdest = new NetAddress("127.0.0.1", 57120);
  liGothicMed10 = loadFont("LiGothicMed-10.vlw");
  mkmicin = new Mkmicin();
  mkout = new Mkout();
  killmicin = new Killmicin();
  killout = new Killout();
  b1 = new Push(20, 20, 460, 40, mkmicin, killmicin, true, "Mic1");
  b2 = new Push(20, height-60, 460, 40, mkout, killout, true, "Out1");
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
void mouseClicked(){
  b1.msclk();
  b2.msclk();
}

