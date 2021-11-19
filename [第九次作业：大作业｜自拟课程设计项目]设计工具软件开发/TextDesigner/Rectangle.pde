class Rectangle{
//一个方块，可以移动，与另一方块相遇时二者交换颜色
  float centerX, centerY, radWidth, radHeight,StrokeColor,Color,speedX,speedY;
     
    
  
  Rectangle(float a,float b,float c,float d,float strokeColor){
    //stroke(strokeColor);
   // strokeWeight(8);
   // fill(random(255));
    //rectMode(RADIUS);
    centerX = a;
    centerY = b;
    radWidth = c;
    radHeight = d;
    StrokeColor = strokeColor; 
    Color = random(255);
    speedX = random(-0.8,0.8);
    speedY = random(-0.8,0.8);
    //rect(centerX, centerY, radWidth, radHeight);
   
  }
  void display(){
   stroke(StrokeColor);
    strokeWeight(8);
    fill(Color);
    rectMode(RADIUS);
     rect(centerX, centerY, radWidth, radHeight);
  }
  //检测重叠并调整位置
  void OverLap(){
    float dis;
    float mindis;
    for(Rectangle r : Recta){
      if(r!=this){
        dis = sqrt((r.centerX-this.centerX)*(r.centerX-this.centerX)+(r.centerY-this.centerY)*(r.centerY-this.centerY));
        mindis = min(r.radHeight+this.radHeight,r.radWidth+this.radWidth);
        if(dis <= mindis){
          this.centerX += dis*1.5;
          this.centerY += dis*1.5;
          this.OverLap();
        }
      }  
    }
  }
//移动  
  void move(){
    centerX += speedX;
    centerY += speedY;
    if (centerX > width-radWidth){
      centerX = centerX-width-radWidth;
    }
     if (centerY>height-radHeight){
      centerY = centerY-height-radHeight;
    }
  }
  
}
