boolean wDown = false;
boolean sDown = false;
boolean aDown = false;
boolean dDown = false;

Player player = new Player();

void setup(){
  size(600, 600);
  frameRate(40);
  background(25);
}

void draw(){
  
  background (25);
  
  if(wDown){
    player.playerMoveUp();
  }
  if(sDown){
    player.playerMoveDown();
  }
  if(aDown){
    player.playerMoveLeft();
  }
  if(dDown){
    player.playerMoveRight();
  }
  if(keyPressed && key == 'r'){
    player.returnHome();
  }
  
  player.drawPlayer();  
    
}

void keyPressed(){
  if(key == 'w' || keyCode == UP){
    wDown = true;
  }
  if(key == 'a' || keyCode == LEFT){
    aDown = true;
  }
  if(key == 's' || keyCode == DOWN){
    sDown = true;
  }
  if(key == 'd' || keyCode == RIGHT){
    dDown = true;
  }
}

void keyReleased(){
  if(key == 'w' || keyCode == UP){
    wDown = false;
  }
  if(key == 'a' || keyCode == LEFT){
    aDown = false;
  }
  if(key == 's' || keyCode == DOWN){
    sDown = false;
  }
  if(key == 'd' || keyCode == RIGHT){
    dDown = false;
  }
}

public class Player{
  int xPos;
  int yPos;
  int xVel = 5;
  int yVel = 5;
  int xHome;
  int yHome;
  int facing = 0;
  
  public Player(){
    xPos = width/2;
    yPos = height/2;
    xHome = xPos;
    yHome = yPos;
  }
  
  public Player(int xPos, int yPos){
    this.xPos = xPos;
    this.yPos = yPos;
    xHome = xPos;
    yHome = yPos;
  }
  
  void playerMoveRight(){
    xPos += xVel;
  }
  void playerMoveLeft(){
    xPos -= xVel;
  }
  void playerMoveUp(){
    yPos -= yVel;
  }
  void playerMoveDown(){
    yPos += yVel;
  }
  
  void returnHome(){
    if(xPos != xHome || yPos != yHome){
      if(xPos > xHome){
        playerMoveLeft();
      }else{
        playerMoveRight();
      }
      if(yPos > yHome){
        playerMoveUp();
      }else{
        playerMoveDown();
      }
    }
  }
  
  void drawPlayer(){
    fill(255,0,0);
    ellipse(xPos, yPos, 10, 10);
  }
  
}
