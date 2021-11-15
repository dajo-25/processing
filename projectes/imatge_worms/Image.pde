class Shuriken{
  
  int xSize;
  int ySize;
  float angle = 0;
  float xTrans;
  float yTrans;
  float xVel;
  float yVel;
  float xAcc;
  float yAcc;
  PImage img;
  
  public Shuriken(int xPosition, int yPosition, int xSize, int ySize, PImage img){
    
    this.xSize = xSize;
    this.ySize = ySize;
    xTrans = xPosition;
    yTrans = yPosition; 
    
    this.img = img;
    
    xVel = 0;
    yVel = 0;
    xAcc = 0;
    yAcc = 0;
    
  }
  
  void update(){
    
    angle += (PI/180)*2;
    
    xAcc = random(-1, 1);
    yAcc = random(-1, 1);
    
    //BOUNDS CORRECTION
    if(xTrans - (xSize/2) < 0){
      xAcc = abs(xAcc);
    }
    if(xTrans + (xSize/2) > width){
      xAcc = -abs(xAcc);
    }
    if(yTrans - (ySize/2) < 0){
      yAcc = abs(yAcc);
    }
    if(yTrans + (ySize/2) > height){
      yAcc = -abs(yAcc);
    }
    
    //VELOCITY CORRECTION
    
    if(xVel > 8){
      xAcc = -abs(xAcc);
    }
    if(xVel < -8){
      xAcc = abs(xAcc);
    }
    if(yVel > 8){
      yAcc = -abs(yAcc);
    }
    if(yVel < -8){
      yAcc = abs(yAcc);
    }
    
    xVel += xAcc;
    yVel += yAcc;
    
    xTrans += xVel;
    yTrans += yVel;
    
  }
  
  void display(){
    
    pushMatrix();    
    fill(220);
    translate(xTrans, yTrans);
    rotate(angle);
    image(img, -(xSize)/2, -(ySize)/2, xSize, ySize);
    //rect(-(xSize)/2, -(ySize)/2, xSize, ySize);
    popMatrix();

    
  }
  
  String info(){
    String info = "xTrans: " + xTrans + " yTrans: " + yTrans;
    return info;
  }
  
}
