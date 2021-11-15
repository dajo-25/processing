boolean wDown;
boolean aDown;
boolean sDown;
boolean dDown;


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
