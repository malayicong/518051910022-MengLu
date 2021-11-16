class Lotus{

  PVector location;
  float d;
  
  Lotus(){
    location = new PVector(random(width),random(height));
    d = random(0,50);
  }
  
  void display(){
    fill(150);
    ellipse(location.x,location.y,d,d);
  }
  
}
