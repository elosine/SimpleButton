void sendingdefs(){
  defs = new String[0];
    defs = append(defs, "OFF");
}

void getdefs(String def){
  defs = append(defs, def);
}

void finishdefs(int num){
  numdsp = num+1;
  dsplbls = defs;
  pb1 = new PushBank(numdsp, dsplbls, 250);
}

void finishinit(){
  setOPush.turnon("mic1");
  setOPush.turnon("out1");
 osc.send("/getdefs", new Object[]{osc.ip(), myport}, oscdest);
}
