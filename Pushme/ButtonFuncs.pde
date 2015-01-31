
interface ButtonAction {
  void doStuff(String id);
}

Mkmicin mkmicin = new Mkmicin();
class Mkmicin implements ButtonAction {
  void doStuff(String id) {
    osc.send("/mksoundin", new Object[] {"mic1", 0}, oscdest);
    dspbank[0] = "mic1";
  }
}

Killmicin killmicin = new Killmicin();
class Killmicin implements ButtonAction {
  void doStuff(String id) {
    osc.send("/kill", new Object[] {"mic1"}, oscdest);
    dspbank[0] = null;
  }
}

Mkout mkout = new Mkout();
class Mkout implements ButtonAction {
  void doStuff(String id) {
    osc.send("/mksoundout", new Object[] {"out1", 0}, oscdest);
    dspbank[dspbank.length-1] = "out1";
    for(int i=dspbank.length-2;i>=0;i--){
      if(dspbank[i]!=null){
        osc.send("/route", new Object[] {dspbank[i], "out1"}, oscdest);
        break;
      }
    }
  }
}

Killout killout = new Killout();
class Killout implements ButtonAction {
  void doStuff(String id) {
    osc.send("/kill", new Object[] {"out1"}, oscdest);
    dspbank[dspbank.length-1] = null;
  }
}

StartAction start = new StartAction();
class StartAction implements ButtonAction {
  void doStuff(String id) {
    osc.send("/init", new Object[] {osc.ip(), myport}, oscdest);
  }
}

StopAction stop = new StopAction();
class StopAction implements ButtonAction {
  void doStuff(String id) {
    setOPush.turnoff("mic1");
    setOPush.turnoff("out1");
    osc.send("/exit", new Object[] {}, oscdest);
  }
}

DSPonAction dspon = new DSPonAction();
class DSPonAction implements ButtonAction {
  void doStuff(String id) {
    String defname = "";
    if(!id.equals("dsp0")){
    for(int i=0;i<dsplbls.length;i++){
      if(("dsp"+i).equals(id)){
        defname = dsplbls[i];
        break;
      }
    }
    osc.send("/mkdsp", new Object[] {id, defname, 1}, oscdest);
    osc.send("/route", new Object[] {"mic1", id}, oscdest);
    osc.send("/route", new Object[] {id, "out1"}, oscdest);

    for(int i=0;i<dsplbls.length;i++){
      String lbltemp = "dsp"+i;
      if(!lbltemp.equals(id)) setOPush.turnoff(lbltemp);
    }
    }
    //
    else{
      for(int i=0;i<dsplbls.length;i++){
      String lbltemp = "dsp"+i;
      if(!lbltemp.equals("dsp0")){
        setOPush.turnoff(lbltemp);
      }
    }
    
    
     osc.send("/route", new Object[] {"mic1", "out1"}, oscdest);
    }
  }
}

DSPoffAction dspoff = new DSPoffAction();
class DSPoffAction implements ButtonAction {
  void doStuff(String id) {
    osc.send("/kill", new Object[] {id}, oscdest);
  }
}

