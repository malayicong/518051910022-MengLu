import java.util.Iterator;
class rainingSystem{
  ArrayList<Drop> rain; 
  PVector origin;

  rainingSystem(PVector location){
    rain = new ArrayList<Drop>();
    origin = location.get();
  }
  
  void adddrops(){
    rain.add(new Drop(origin));
  }
  
  void run(){
    Iterator<Drop> it = rain.iterator();
    while(it.hasNext()){
      Drop d = it.next();
      d.run();
      if(d.isDead()){
        it.remove();
      }
    }
  }
}
