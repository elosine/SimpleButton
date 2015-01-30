
interface ButtonAction{
  void doStuff();
}

class Mkmicin implements ButtonAction{
  void doStuff(){
    osc.send("/mksoundin", new Object[]{"mic1", 0}, oscdest);
  }
}

class Killmicin implements ButtonAction{
  void doStuff(){
    osc.send("/kill", new Object[]{"mic1"}, oscdest);
  }
}

class Mkout implements ButtonAction{
  void doStuff(){
    osc.send("/mksoundout", new Object[]{"out1", 0}, oscdest);
  }
}

class Killout implements ButtonAction{
  void doStuff(){
    osc.send("/kill", new Object[]{"out1"}, oscdest);
  }
}


