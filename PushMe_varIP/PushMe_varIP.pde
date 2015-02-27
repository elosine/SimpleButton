/*
Way to get variable IP
Series of random number generators

*/

import oscP5.*;
import netP5.*;

OscP5 osc;
ArrayList <NetAddress> ips;
int myport = 12321;

String path, ippath;
File file, ipfile;

PFont monaco13;


void setup() {
  size(520, 200);
  osc = new OscP5(this, myport);
  ips = new ArrayList<NetAddress>();
 // sc = new NetAddress("143.117.78.123", 1231);
  monaco13 = loadFont("Monaco-13.vlw");
  textFont(monaco13);

  path = sketchPath("guidata.txt");
  file = new File(path);
  ippath = sketchPath("ips.txt");
  ipfile = new File(ippath);
  
  

if (ipfile.exists()) {
    String[] d1 = loadStrings("ips.txt");
    for (int i=0; i<d1.length; i++) {
      String[]d2 = split(d1[i], "\t");
        ips.add( new NetAddress( d2[0], int(d2[1]) ) );
    }
  }
  
  if (file.exists()) {
    String[] d1 = loadStrings("guidata.txt");
    for (int i=0; i<d1.length; i++) {
      String[]d2 = split(d1[i], "\t");
      if (d2.length == 13) {
        String[]d3 = split(d2[9], "#");
        String[]d4 = split(d2[10], "#");
        pmos.mk(d2[0], int(d2[1]), int(d2[2]), int(d2[3]), 
        int(d2[4]), int(d2[5]), d2[6], d2[7], d2[8], d3, d4, int(d2[11]), d2[12]);
      }
    }
  }
}

void draw() {
  background(0); 
  pmos.drw();
}

void mouseDragged() {
  pmos.msdrg();
}
void mousePressed() {
  pmos.msprs();
}
void mouseReleased() {
  pmos.msrel();
}

void keyPressed() {
  pmos.keyprs();
}

