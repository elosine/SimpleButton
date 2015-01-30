int x = 200;
int y = 200;
int w = 50;
int h = 50;
int l, t, r, b, c, m;
color rolloverclr = color(30, 144, 255);
color onclr = color(255, 234, 100);
color blk = color(0);
color clr = color(0);
boolean on=false;

void setup() {
  size(500, 500);
  l = x;
  t = y;
  r = x+w;
  b = y+h;
  c = x+int(w/2.0);
  m = y+int(h/2.0);
}

void draw() {
  background(0);

  //Rollover  Behavior
  if (mouseX>l && mouseX<r && mouseY>t && mouseY<b)clr = rolloverclr;
  else clr = blk;
  //Click Behavior
  if(on){
    clr=onclr;
    noStroke();
  }
  //
  else stroke(153, 255, 0);

  //Draw Button
  rectMode(CORNER);
  strokeWeight(3);
  fill(clr);
  rect(x, y, w, h);
}

void mousePressed(){
  on = true;
}
void mouseReleased(){
  on = false;
}



