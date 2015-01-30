class SimpleButton {
  //Arguments
  int x, y, w, h;
  //Class Variables
  int l, t, r, b, c, m;
  color rolloverclr = color(30, 144, 255);
  color onclr = color(255, 234, 100);
  color blk = color(0);
  color clr = color(0);
  color strclr1 = color(153, 255, 0);
  color strclr = color(153, 255, 0);
  boolean on=false;
  boolean clkgate=false;
  //Constructor
  SimpleButton(int argx, int argy, int argw, int argh) {
    x = argx;
    y = argy;
    w = argw;
    h = argh;
    //Initialize Instance
    l = x;
    t = y;
    r = x+w;
    b = y+h;
    c = x+int(w/2.0);
    m = y+int(h/2.0);
  }

  void drw() {
    //Is Mouse over button
    if (mouseX>l && mouseX<r && mouseY>t && mouseY<b) {
      //Rollover  Behavior
      clr = rolloverclr;
      //Click Behavior
      if (on) {
        clr=onclr;
        strclr = blk;
        //Click Action
        if(clkgate){
          clickgate = false;
          println("clicked");
        }
      }
      //
      else strclr = strclr1;
    } 
    //
    else clr = blk;


    //Draw Button
    rectMode(CORNER);
    strokeWeight(3);
    stroke(strclr);
    fill(clr);
    rect(x, y, w, h);
  }

  void msprs() {
    on = true;
  }
  void msrel() {
    on = false;
    clkgate = true;
  }
  ///////////////////
} //End Class //////
///////////////////

