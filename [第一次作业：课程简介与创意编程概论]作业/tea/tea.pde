void setup(){
size(1600,1200);
}
void draw(){
  
  background(2,180,180);
  fill(255);
  ellipse(800,600,1300,1300);
  //杯盖
  stroke(0,0,0,150);
  strokeWeight(5); 
  fill(125,200,225,60);
  ellipse(width/2, 300, 500,180);
  //杯身
  strokeWeight(3);
  ellipse(width/2, 900, 300,180);
  line(width/2+250,300,width/2+150,900);
  line(width/2-250,300,width/2-150,900);
  //吸管
  line(900,100,820,800);
  line(960,150,880,810);
  line(820,800,880,810);
  line(900,100,1100,50);
  line(960,150,1120,110);
  line(1100,50,1120,110);
  fill(200,200,200);
  //X:675~925,Y:800~920
  //珍珠
  ellipse(width/2+(mouseX-width/2)/7,900+(mouseY-900)/8,60,60);
  ellipse(width*4.5/8+(mouseX-width/2)/14,850+(mouseY-900)/8,60,60);
  ellipse(width*4/9+(mouseX-width/2)/14,850+(mouseY-900)/11,60,60);
  ellipse(width*5/9+(mouseX-width/2)/14,820+(mouseY-900)/8.2,60,60);
  ellipse(width*4.5/10+(mouseX-width/2)/20.5,870+(mouseY-900)/9,60,60);
}
