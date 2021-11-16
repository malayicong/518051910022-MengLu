
PImage silhouettes;
rainingSystem rain;
ArrayList<rainingSystem> systems;
color c1;
color c2;//背景渐变
PVector wind;
Lightening lightening1;
Lightening lightening2;


void setup(){
  size(900,900);
  silhouettes = loadImage("silhouettes.png");

  
  systems = new ArrayList<rainingSystem>();
  for(int i=0; i<9;i++){
    float locationX = i*150;
    systems.add(new rainingSystem(new PVector(locationX,-150)));  
  }

}

void draw(){
  //渐变背景
  colorMode(HSB,360,100,100);
  c1=color(221,44,25);
  c2=color(184,77,56);
  
  for(int y=0; y<height;y++){
    float n  = map(y,0,height,0,1);
    color newc = lerpColor(c1,c2,n);
    stroke(newc);
    line(0,y,width,y);
  }
  
  //background(50,50,150);
  image(silhouettes,-200,390);
  //textSize(48);
  //text(silhouettes.width,50,50);
  //text(silhouettes.height,500,50);
  //下雨 
  
  wind = new PVector(mouseX,0);
  for(rainingSystem rs : systems){
    rs.run();
    rs.adddrops();
  }
}

void flash(){
  noStroke();
  fill(255,20);
  ellipse(width/2,0,width*2,width*2);
}

void mousePressed(){
  pushMatrix(); 
 
  lightening1 = new Lightening();
  translate(lightening1.position,0);
  lightening1.branch(random(width/15,width/10));
  popMatrix();
  
  float p = random(0,2);
  if(p>1){
    pushMatrix();
    lightening2 = new Lightening();
     translate(lightening2.position,0);
    lightening2.branch(random(width/20,width/10));
    popMatrix();
  }
  
  flash();
  //noLoop();
}
/*
void keyPressed(){
  if(key == 'r'){ boolean r = true; if(r==true){loop();}}
}
*/
