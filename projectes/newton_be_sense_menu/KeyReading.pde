boolean aDown;
boolean dDown;

void keyPressed(){
  if(key == 'a' || keyCode == LEFT){
    aDown = true;
  }
  if(key == 'd' || keyCode == RIGHT){
    dDown = true;
  }
}

void keyReleased(){
  if(key == 'a' || keyCode == LEFT){
    aDown = false;
  }
  if(key == 'd' || keyCode == RIGHT){
    dDown = false;
  }
}
