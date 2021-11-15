class Shuriken{
  
  int xSize;
  int ySize;
  float angle = 0;
  float xTrans;
  float yTrans;
  
  float maxVelocity = 20;
  
  float xVel;
  float yVel;
  float xAcc;
  float yAcc;
  float fillingR;
  float fillingG;
  float fillingB;
  
  int boundariesState = 1;
  
  public Shuriken(int xPosition, int yPosition, int xSize, int ySize){
    
    this.xSize = xSize;
    this.ySize = ySize;
    xTrans = xPosition;
    yTrans = yPosition; 
        
    xVel = 0;
    yVel = 0;
    xAcc = 0;
    yAcc = 0;
    
    fillingR = random(100, 255);
    fillingG = random(100, 255);
    fillingB = random(100, 255);
    
  }
  
  void update(){
    
    angle += (PI/180)*2;
    
    xAcc = random(-1, 1);
    yAcc = random(-1, 1);
    
    //BOUNDS CORRECTION
    if(xTrans - (xSize/2) < 0){
      xAcc = (boundariesState) * abs(xAcc);
    }
    if(xTrans + (xSize/2) > width){
      xAcc = (boundariesState) * -abs(xAcc);
    }
    if(yTrans - (ySize/2) < 0){
      yAcc = (boundariesState) * abs(yAcc);
    }
    if(yTrans + (ySize/2) > height){
      yAcc = (boundariesState) * -abs(yAcc);
    }
    
    //VELOCITY CORRECTION
    
    if(xVel > maxVelocity){
      xAcc = -abs(xAcc);
    }
    if(xVel < -maxVelocity){
      xAcc = abs(xAcc);
    }
    if(yVel > maxVelocity){
      yAcc = -abs(yAcc);
    }
    if(yVel < -maxVelocity){
      yAcc = abs(yAcc);
    }
    
    xVel += xAcc;
    yVel += yAcc;
    
    xTrans += xVel;
    yTrans += yVel;
    
  }
  
  void changeColor(){
   
    fillingR = random(100, 255);
    fillingG = random(100, 255);
    fillingB = random(100, 255);
    
  }
  
  void display(){
    
    pushMatrix();    
    fill(fillingR, fillingG, fillingB);
    translate(xTrans, yTrans);
    rotate(angle);
    rect(-(xSize)/2, -(ySize)/2, xSize, ySize);
    popMatrix();

    
  }
  
  void flipBoundaries(){
    if(boundariesState == 1){
      boundariesState = -1;
    }else if(boundariesState == -1){
      boundariesState = 1;
    }
  }
  
  String info(){
    String info = "xTrans: " + xTrans + " yTrans: " + yTrans;
    return info;
  }
  
}
