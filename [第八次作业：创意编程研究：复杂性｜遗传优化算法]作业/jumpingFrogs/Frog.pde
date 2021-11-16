class Frog{

  DNA dna;
  PVector location;
  PVector motion;
  
  float fitness;
  int geneCounter = 0;
  boolean hitTarget = false;
  int r;
  int colors;
  
  Frog(PVector I, DNA dna_, int c){
    location = I.get();
    r=6;
    dna = dna_;
    colors = c;
  
  }
  
  void fitness(){
    float d = PVector.dist(location,target);
    fitness = pow(1/d,2);
  }
  
  void checkTarget(){
     float d = dist(location.x, location.y, target.x, target.y);
     if (d < 12) {
     hitTarget = true;
    } 
  }
  
  void jump(){
    checkTarget();
    if(!hitTarget){
      location.add(dna.genes[geneCounter]);
      geneCounter = (geneCounter+1)% dna.genes.length;
    }
     display();
  }
 //////////////////////////////////////////////////////////////////////////////// 
  void display(){
    
    if(colors == 1) fill(120,120,120);
    else fill(10,200,200);
    
    float theta = dna.genes[geneCounter].heading2D();
    stroke(0);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    
    rectMode(CENTER);
    rect(0,0,2*r,2*r);
    line(r,r,2*r,2*r);
    line(-r,-r,-2*r,-2*r);
    line(r,-r,2*r,-2*r);
    line(-r,r,-2*r,2*r);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, -r);
    vertex(r, -r);
    endShape();

    popMatrix();
  //青蛙形状
  //"跳"的动作
  
  }
/////////////////////////////////////////////////////////////////////////////////  
  float getFitness(){
    return fitness;
  }
  
  DNA getDNA(){
    return dna;
  }

}
