
class Push {
  //Arguments
  String id;
  int x, y, w, h;
  ButtonAction onaction, offaction;
  boolean toggle;
  String onlbl, offlbl;
  //Class Variables
  int l, t, r, b, c, m;
  color rolloverclr = color(30, 144, 255);
  color onclr = color(255, 234, 100);
  color blk = color(0);
  color clr = color(0);
  color strclr1 = color(153, 255, 0);
  color strclr = color(153, 255, 0);
  int on=0;

  //Constructor
  Push(String argid, int argx, int argy, int argw, int argh, ButtonAction argonaction, 
  ButtonAction argoffaction, boolean argtoggle, String argonlbl, String argofflbl) {
    id = argid;
    x = argx;
    y = argy;
    w = argw;
    h = argh;
    onaction = argonaction;
    offaction = argoffaction;
    toggle = argtoggle;
    onlbl = argonlbl;
    offlbl = argofflbl;

    //Initialize Instance
    l = x;
    t = y;
    r = x+w;
    b = y+h;
    c = x+int(w/2.0);
    m = y+int(h/2.0);
  }

  void drw() {
    //Toggle Off
    if (!toggle) {
      if (mouseX>l && mouseX<r && mouseY>t && mouseY<b) {
        //Rollover Behavior
        clr = rolloverclr;
        //Click Behavior
        if (on==1) {
          clr=onclr;
          strclr = blk;
        }
        //
        else { 
          strclr = strclr1;
        }
      }
      //
      else clr = blk;
    }
    //Toggle On
    else {
      if (on==1) {
        clr=onclr;
        strclr = blk;
      }
      //
      else {
        if (mouseX>l && mouseX<r && mouseY>t && mouseY<b) {
          //Rollover Behavior
          clr = rolloverclr;
        } 
        //
        else {
          strclr = strclr1;
          clr = blk;
        }
      }
    }

    //Draw Button
    rectMode(CORNER);
    strokeWeight(3);
    stroke(strclr);
    fill(clr);
    rect(x, y, w, h, 9);
    //Draw Label
    textAlign(CENTER, CENTER);
    fill(208, 32, 144);
    if (toggle) {
      if (on==0) text(onlbl, c, m);
      else text(offlbl, c, m);
    }
  }

  void msprs() {
    if (!toggle) {
      if (mouseX>l && mouseX<r && mouseY>t && mouseY<b) {
        clkonaction();
        on = 1;
      }
    }
  }

  void msrel() {
    if (!toggle) {
      if (mouseX>l && mouseX<r && mouseY>t && mouseY<b) on = 0;
    }
  }

  void msclk() {
    if (mouseX>l && mouseX<r && mouseY>t && mouseY<b) {
      if (toggle) {
        if (on==0) clkonaction();
        if (on==1) clkoffaction();
        on = (on+1)%2;
      }
    }
  }

  void clkonaction() {
    onaction.doStuff(id);
  }

  void clkoffaction() {
    offaction.doStuff(id);
  }

  void turnon() {
    clkonaction();
    on = 1;
  }

  void turnoff() {
    clkoffaction();
    on = 0;
  }


  ///////////////////
} //End Class //////
///////////////////


// DECLARE/INITIALIZE CLASS SET
PushSet setOPush = new PushSet();

//// CLASS SET CLASS ////
class PushSet {
  ArrayList<Push> cset = new ArrayList<Push>();

  // Make Instance Method //
  void mk(String argid, int argx, int argy, int argw, int argh, ButtonAction argonaction, 
  ButtonAction argoffaction, boolean argtoggle, String argonlbl, String argofflbl) {
    cset.add( new Push(argid, argx, argy, argw, argh, argonaction, 
    argoffaction, argtoggle, argonlbl, argofflbl) );
  } //end mk method

  // Draw Set Method //
  void drw() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Push inst = cset.get(i);
      inst.drw();
    }
  } //end dr method

  // Remove Instance Method //
  void rmv(String id) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Push inst = cset.get(i);
      if (inst.id.equals(id)) {
        cset.remove(i);
        break;
      }
    }
  } //End rmv method

  // msprs Set Method //
  void msprs() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Push inst = cset.get(i);
      inst.msprs();
    }
  } //end msprs method

  // msrel Set Method //
  void msrel() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Push inst = cset.get(i);
      inst.msrel();
    }
  } //end msrel method

  // msclk Set Method //
  void msclk() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Push inst = cset.get(i);
      inst.msclk();
    }
  } //end msclk method

  // turnon Set Method //
  void turnon(String id) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Push inst = cset.get(i);
      if ( inst.id.equals(id) ) inst.turnon();
    }
  } //end turnon method

  // turnoff Set Method //
  void turnoff(String id) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Push inst = cset.get(i);
      if ( inst.id.equals(id) ) inst.turnoff();
    }
  } //end turnoff method

  
  /////////////////////////
} //end class set class///
/////////////////////////


// DECLARE/INITIALIZE CLASS SET
int numdsp = 5;
PushBank pb1;
String[] dsplbls = new String[0];
class PushBank {
  int amt, orientation, coord;
  String[] lbl;
  int w;
  PushBank(int argamt, String[] arglbl, int argcoord) {
    amt = argamt;
    lbl = arglbl;
    coord = argcoord;
    w = round(width/amt)-8 ;
    println(w);
    for (int i=0; i<amt; i++) {
      setOPush.mk("dsp"+i, 6 +((w+7)*i), coord, w, 25, dspon, dspoff, true, lbl[i], lbl[i]);
    }
  }

  /////////////////////////
} //end class ////////////
/////////////////////////


