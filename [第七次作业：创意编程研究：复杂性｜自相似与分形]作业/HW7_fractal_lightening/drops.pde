class Drop{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float len;
  float alpha;
  float m;
 
  Drop(PVector l) {
//For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0.4);
    velocity = new PVector(random(0,2),random(-5,0));
    location = l.get();
    lifespan = 255.0;
    len = random(10,60);
    alpha = random(0.4,1); 
    m = len*0.1;
  }
 
//Sometimes it’s convenient to have a “run” function that calls all the other functions we need.
  void run() {
    update();
    //force(f);
    display();
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.5;
    //acceleration.mult(0);
  }
 
  void display() {
    strokeWeight(1);
    stroke(255,lifespan*alpha);
    fill(255,lifespan*alpha);
    ellipse(location.x,location.y,1,len);
  }
  
  void force(PVector f){
    PVector force = f.div(m);
    acceleration.add(force);
  }
 
 
//Is the Particle alive or dead?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
