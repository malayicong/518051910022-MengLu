class Lightening{

  float position;

  
  Lightening(){
    position = random(width/5,width*4/5);
   
  }
  
void branch(float l){ 
    float weight  = map(l,0,150,0,6);
    strokeWeight(weight);
    stroke(255);
    line(0,0,0,l);
    translate(0,l);
    l*=0.86;
    
     if(l >10 ){
      int n = int(random(1,3));
      for(int i=0;i<n;i++){
        float theta = random(-PI/3,PI/3);
        pushMatrix();
        rotate(theta);
        branch(l);
        popMatrix();
      }
    }
  
  }
  

}
