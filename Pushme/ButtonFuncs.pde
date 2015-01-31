
interface ButtonAction {
  void doStuff(String id);
}

Mkmicin mkmicin = new Mkmicin();
class Mkmicin implements ButtonAction {
  void doStuff(String id) {
    osc.send("/mksoundin", new Object[] {"mic1", 0}, oscdest);
  }
}

Killmicin killmicin = new Killmicin();
class Killmicin implements ButtonAction {
  void doStuff(String id) {
    osc.send("/kill", new Object[] {"mic1"}, oscdest);
  }
}

Mkout mkout = new Mkout();
class Mkout implements ButtonAction {
  void doStuff(String id) {
    osc.send("/mksoundout", new Object[] {"out1", 0}, oscdest);
  }
}

Killout killout = new Killout();
class Killout implements ButtonAction {
  void doStuff(String id) {
    osc.send("/kill", new Object[] {"out1"}, oscdest);
  }
}

StartAction start = new StartAction();
class StartAction implements ButtonAction {
  void doStuff(String id) {
    setOPush.turnon("mic1");
    setOPush.turnon("out1");
    //osc.send("/kill", new Object[] {"out1"}, oscdest);
  }
}

StopAction stop = new StopAction();
class StopAction implements ButtonAction {
  void doStuff(String id) {
    setOPush.turnoff("mic1");
    setOPush.turnoff("out1");
    //osc.send("/kill", new Object[] {"out1"}, oscdest);
  }
}

DSPonAction dspon = new DSPonAction();
class DSPonAction implements ButtonAction {
  void doStuff(String id) {
    //osc.send("/kill", new Object[] {"out1"}, oscdest);
  }
}

DSPoffAction dspoff = new DSPoffAction();
class DSPoffAction implements ButtonAction {
  void doStuff(String id) {
    //osc.send("/kill", new Object[] {"out1"}, oscdest);
  }
}

