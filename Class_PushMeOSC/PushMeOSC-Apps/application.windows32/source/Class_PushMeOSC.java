import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import oscP5.*; 
import netP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Class_PushMeOSC extends PApplet {




OscP5 osc;
NetAddress sc;
int myport = 12321;

String path;
File file;

PFont monaco13;


public void setup() {
  size(500, 500);
  osc = new OscP5(this, myport);
  sc = new NetAddress("127.0.0.1", 57120);
  monaco13 = loadFont("Monaco-13.vlw");
  textFont(monaco13);

  path = sketchPath("guidata.txt");
  file = new File(path);
  


  if (file.exists()) {
    String[] d1 = loadStrings("guidata.txt");
    for (int i=0; i<d1.length; i++) {
      String[]d2 = split(d1[i], "\t");
      if (d2.length == 11) {
        String[]d3 = split(d2[9], "#");
        String[]d4 = split(d2[10], "#");
        pmos.mk(d2[0], PApplet.parseInt(d2[1]), PApplet.parseInt(d2[2]), PApplet.parseInt(d2[3]), 
        PApplet.parseInt(d2[4]), PApplet.parseInt(d2[5]), d2[6], d2[7], d2[8], d3, d4);
      }
    }
  }
}

public void draw() {
  background(0); 
  pmos.drw();
}

public void mouseDragged() {
  pmos.msdrg();
}
public void mousePressed() {
  pmos.msprs();
}
public void mouseReleased() {
  pmos.msrel();
}

public void keyPressed() {
  pmos.keyprs();
}

Colors clr = new Colors();

class Colors {
  StringDict clrs = new StringDict(); 

  Colors() {
    ////add colors
    clrs.set("Tranquil Blue", "25 33 47");
    clrs.set("orange", "255 128 0");
    clrs.set("red", "255 0 0");
    clrs.set("green", "0 255 0");
    clrs.set("blue", "0 0 255");
    clrs.set("black", "0 0 0");
    clrs.set("white", "255 255 255");
    clrs.set("violetred", "208 32 144");
    clrs.set("springgreen", "0 255 127");
    clrs.set("turquoiseblue", "0 199 140");
    clrs.set("seagreen", "67 205 128");
    clrs.set("mint", "189 252 201");
    clrs.set("yellow", "255 255 0");
    clrs.set("goldenrod", "218 165 32");
    clrs.set("darkorange", "238 118 0");
    clrs.set("chocolate", "139 69 19");
    clrs.set("slateblue", "113 113 198");
    clrs.set("indigo", "75 0 130");
    clrs.set("purple", "128 0 128");
    clrs.set("magenta", "255 0 255");
    clrs.set("plum", "221 160 221");
    clrs.set("maroon", "139 10 80");
    clrs.set("pink", "255 105 180");
    clrs.set("royalblue", "72 118 255");
    clrs.set("dodgerblue", "30 144 255");
    clrs.set("grey", "119 136 153");
    clrs.set("nicegreen", "138 216 20");
    clrs.set("pine", "64 129 64");
    clrs.set("papaya", "255 164 142");
    clrs.set("beet", "157 84 156");
    clrs.set("slate", "117 119 123");
    clrs.set("peacock", "0 130 137");
    clrs.set("fig", "128 84 98");
    clrs.set("sunshine", "255 234 100");
    clrs.set("limegreen", "153 255 0");
  } //End Constructor

  public int get(String clrname) {
    int cl; 
    String[] rgb = split(clrs.get(clrname), ' ');
    cl = color(PApplet.parseInt(rgb[0]), PApplet.parseInt(rgb[1]), PApplet.parseInt(rgb[2]));
    return cl;
  } //End get method

  public int getByIx(int ix) {
    int cl; 
    String[] rgb = clrs.valueArray();
    String[] rgbsplit = split(rgb[ix], ' ');
    cl = color(PApplet.parseInt(rgbsplit[0]), PApplet.parseInt(rgbsplit[1]), PApplet.parseInt(rgbsplit[2]));
    return cl;
  } //End get method

  public int getAlpha(String clrname, int alpha ) {
    int cl; 
    String[] rgb = split(clrs.get(clrname), ' ');
    cl = color(PApplet.parseInt(rgb[0]), PApplet.parseInt(rgb[1]), PApplet.parseInt(rgb[2]), alpha);
    return cl;
  } //End getAlpha method

 
  
  
} //End Class


PushMeOSCset pmos = new PushMeOSCset();
class PushMeOSC {
  //constructor args
  String id;
  int l, t, w, h;
  int toggle;
  String msgonadr, msgoffadr;
  String[] msgonargs, msgoffargs;
  String dclr;

  //class variables
  int r, b, m, c;
  int msxdist, msydist;
  int bclr = color(153, 255, 0);
  int bstkclr = color(255, 128, 0);
  int msovrclr = color(255, 255, 0);
  int violetred = color(208, 32, 144);
  int togswitch = 0;
  int edit = 0;

  PushMeOSC(String _id, int _l, int _t, int _w, int _h, 
  int _toggle, String _msgonadr, 
  String _msgoffadr, String _dclr, String[] _msgonargs, String[] _msgoffargs ) {
    id = _id;
    l = _l;
    t = _t;
    w = _w;
    h = _h;
    toggle = _toggle;
    msgonadr = _msgonadr;
    msgonargs = _msgonargs;
    msgoffadr = _msgoffadr;
    msgoffargs = _msgoffargs;
    dclr = _dclr;

    r = l+w;
    b = t+h;
    m = l + PApplet.parseInt(w/2);
    c = t + PApplet.parseInt(h/2);
    bclr = clr.get(dclr);
  }

  public void drw() {

    if (toggle==1) {
      if (togswitch==0)bclr = clr.get(dclr);
      if (togswitch==1)bclr = violetred;
    } 

    //DRAW BUTTON

    rectMode(CORNER);
    noStroke();
    fill(bclr);
    rect(l, t, w, h, 9);

    //DRAW LABEL
    textAlign(CENTER, CENTER);
    rectMode(CENTER);
    fill(0);
    text(id, m, c, w-6, h-6);

    if (edit==1) {
      //Resize box
      rectMode(CORNER);
      noStroke();
      fill(100);
      rect(r-2, b-2, 15, 15);
    }
  }

  public void msdrg() {
    if (edit==1) {
      //MOVE BUTTON
      if (mouseX>=l && mouseX<=r && mouseY>=t && mouseY<=b) {
        l = l + mouseX-pmouseX;
        t = t + mouseY-pmouseY;
        r = l+w;
        b = t+h;
        m = l + PApplet.parseInt(w/2);
        c = t + PApplet.parseInt(h/2);
        println(id+ " - " + "x:" + l + "  " + "y:" + t + "  " +"w:" + w + "  " + "h:" + h  );
      }
      //RESIZE BUTTON
      if (mouseX>=r && mouseX<=r+15 && mouseY>=b && mouseY<=b+15) {
        w = w + mouseX-pmouseX;
        h = h + mouseY-pmouseY;
        r = l+w;
        b = t+h;
        m = l + PApplet.parseInt(w/2);
        c = t + PApplet.parseInt(h/2);
        println(id+ " - " +"x:" + l + "  " + "y:" + t + "  " +"w:" + w + "  " + "h:" + h  );
      }
    }
  }

  public void msprs() {
    if (edit==0) {
      if (mouseX>=l && mouseX<=r && mouseY>=t && mouseY<=b) {
        if (toggle==1) {
          //action when turning toggle on
          if (togswitch==0) {
            onmsg();
          }
          //action when turning toggle off
          if (togswitch==1) {
            offmsg();
          }
          togswitch = (togswitch+1)%2;
        }
        //
        else {
          //Normal Button pressed action
          bclr = violetred;
          //Button pressed action when not toggle
          onmsg();
        }
      }
    }
  }

  public void msrel() {
    if (edit==0) {
      if (mouseX>=l && mouseX<=r && mouseY>=t && mouseY<=b) {
        if (toggle==0) {
          //Normal Button
          bclr = clr.get(dclr);
          offmsg();
        }
      }
    }
  }

  public void keyprs() {
    if (key == 'e') {
      edit = (edit +1)%2;
    }
  }

  public void onmsg() {
    OscMessage msgtemp = new OscMessage(msgonadr);
    for (int i=0; i<msgonargs.length; i++) {
      msgtemp.add(msgonargs[i]);
    }
    osc.send(msgtemp, sc);
  }

  public void offmsg() {
    OscMessage msgtemp2 = new OscMessage(msgoffadr);
    for (int i=0; i<msgoffargs.length; i++) {
      msgtemp2.add(msgoffargs[i]);
    }
    osc.send(msgtemp2, sc);
  }

  ////
  ///
  //end of class
}

class PushMeOSCset {
  ArrayList<PushMeOSC> cset = new ArrayList<PushMeOSC>();

  public void mk(String _id, int _l, int _t, int _w, int _h, 
  int _toggle, String _msgonadr, 
  String _msgoffadr, String dclr, String[] _msgonargs, String[] _msgoffargs) {
    cset.add( new PushMeOSC(_id, _l, _t, _w, _h, 
    _toggle, _msgonadr, 
    _msgoffadr, dclr, _msgonargs, _msgoffargs) );
  }

  public void drw() {
    for (int i=cset.size ()-1; i>=0; i--) {
      PushMeOSC inst = cset.get(i);
      inst.drw();
    }
  }

  public void msprs() {
    for (int i=cset.size ()-1; i>=0; i--) {
      PushMeOSC inst = cset.get(i);
      inst.msprs();
    }
  }

  public void msdrg() {
    for (int i=cset.size ()-1; i>=0; i--) {
      PushMeOSC inst = cset.get(i);
      inst.msdrg();
    }
  }

  public void msrel() {
    for (int i=cset.size ()-1; i>=0; i--) {
      PushMeOSC inst = cset.get(i);
      inst.msrel();
    }
  }

  public void keyprs() {
    for (int i=cset.size ()-1; i>=0; i--) {
      PushMeOSC inst = cset.get(i);
      inst.keyprs();
    }
  }

  //end class set
  //
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Class_PushMeOSC" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
