class Attractor {
  float mass;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float G = 0.1;
  float r;
  
 
  Attractor(float m, float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = m;
  }
 
  void display() {
    noStroke();
    fill(255,130,0,200);
    r = mass*8;
    ellipse(location.x,location.y,r*2,r*2);
    checkEdges();
  }
  
   void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void repel(){
    for(Attractor a : attractors){
      PVector rr = PVector.sub(a.location,location);
      PVector dir = rr.normalize();
      float dis = rr.mag();
      dis = constrain(dis,10,25.0);
      PVector Rf = dir.mult(-6*a.mass*G/(dis*dis)); //已经除去自身质量
      acceleration.add(Rf);
    }
   }
   
  void attraction(){
    for(Mover m : movers){
      PVector rr = PVector.sub(m.location,location);
      PVector dir = rr.normalize();
      float dis = rr.mag();
      dis = constrain(dis,5.0,25.0);
      PVector Rf = dir.mult(0.1*m.mass*G/(dis*dis)); //已经除去自身质量
      acceleration.add(Rf);
    }
   }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
 
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    } else if (location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    }
  }
}
