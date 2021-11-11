class Mover {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float G =0.1;
  float r;
  float red=random(255),green=random(200,255),blue=random(255);
 
  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
 
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
 
  void display() {
    noStroke();
    fill(red,green,blue,100);
    r = mass*8;
    ellipse(location.x,location.y,r*2,r*2);
    checkEdges();
  }
  
   void repel(){
    for(Mover m : movers){
    PVector rforce = PVector.sub(m.location,location);
    float dis = rforce.mag();
    dis = constrain(dis,5.0,25.0);
    rforce.normalize();
    float strength = (G * mass) / (dis * dis);
    rforce.mult(-0.1*strength);
    acceleration.add(rforce);
    }
  }
  void attraction(){
    for(Attractor a : attractors){
      PVector rr = PVector.sub(a.location,location);
      PVector dir = rr.normalize();
      float dis = rr.mag();
      dis = constrain(dis,5.0,25.0);
      PVector Rf = dir.mult(3*a.mass*G/(dis*dis)); 
      acceleration.add(Rf);
    }
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
