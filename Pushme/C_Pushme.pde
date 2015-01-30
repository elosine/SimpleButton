
class Push {
  //Arguments
  int x, y, w, h;
  ButtonAction onaction, offaction;
  boolean toggle;
  String lbl;
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
  Push(int argx, int argy, int argw, int argh, ButtonAction argonaction, 
  ButtonAction argoffaction, boolean argtoggle, String arglbl) {
    x = argx;
    y = argy;
    w = argw;
    h = argh;
    onaction = argonaction;
    offaction = argoffaction;
    toggle = argtoggle;
    lbl = arglbl;

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
    rect(x, y, w, h);
    //Draw Label
    textAlign(CENTER, CENTER);
    fill(208, 32, 144);
    text(lbl, c, m);
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
    onaction.doStuff();
  }

  void clkoffaction() {
    offaction.doStuff();
  }


  ///////////////////
} //End Class //////
///////////////////

