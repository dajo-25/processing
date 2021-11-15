boolean wDown;
boolean aDown;
boolean sDown;
boolean dDown;

boolean wTyped;
boolean aTyped;
boolean sTyped;
boolean dTyped;

boolean wPressable = true;
boolean aPressable = true;
boolean sPressable = true;
boolean dPressable = true;

int aTemp = 0;
int sTemp = 0;
int dTemp = 0;

void readInput(){
  
  if(wDown){
    
    if(wPressable){
      wTyped = true;
    }else{
      wTyped = false; 
    }
    
    if(wTyped){
      wPressable = false;
    }
    
  }
  
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
    wPressable = true;
  }
  if(key == 'a' || keyCode == LEFT){
    aDown = false;
    aPressable = true;

  }
  if(key == 's' || keyCode == DOWN){
    sDown = false;
    sPressable = true;

  }
  if(key == 'd' || keyCode == RIGHT){
    dDown = false;
    dPressable = true;

  }
}
