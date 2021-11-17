class Entity{
  
  PImage sprites [] = new PImage[4];
  int xSize;
  int ySize;
  int xPos;
  int yPos;
  
  public Entity(int xPos, int yPos, int xSize, int ySize){
    this.xPos = xPos;
    this.yPos = yPos;
    this.xSize = xSize;
    this.ySize = ySize;
  }
  
  public void render(){
    if(sprites[0] != null){
      
    }else if(sprites[0] == null){
      strokeWeight(0);
      fill(255);
      rect(xPos, yPos, xSize, ySize);
    }
  }
  
  public void update(){
    
  }
  
  public void display(){
   
    this.render();
    
  }
  
}
