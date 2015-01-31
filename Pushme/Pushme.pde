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
PFont liGothicMed10;

void setup() {
  size(500, 500);
  osc = new OscP5(this, 12321);
  oscdest = new NetAddress("127.0.0.1", 57120);
  liGothicMed10 = loadFont("LiGothicMed-10.vlw");
  setOPush.mk("init", 4, 4, width-8, 25, start, stop, true, "INITIALIZE", "QUIT");
  setOPush.mk("mic1", 20, 40, 460, 40, mkmicin, killmicin, true, "Mic1", "Mic1");
  setOPush.mk("out1", 20, height-60, 460, 40, mkout, killout, true, "Out1", "Out1");
  
  pb = new PushBank(numdsp, dsplbls, 250);
}

void draw() {
  background(0);
  setOPush.drw();
}

void mousePressed() {
  setOPush.msprs();
}
void mouseReleased() {
  setOPush.msrel();
}
void mouseClicked() {
  setOPush.msclk();
}

