 
  
  
  int contador = 0;
  int cd = 0;
  int customframerate = 480;
  
  int wCount = 0;
  
  Shuriken[] shurikens = new Shuriken[100];
  

  
void setup(){
  background(255);
  fullScreen();
  frameRate(customframerate);

}

void draw(){
  
  println(frameRate);
  
  readInput();
    
  cd--;
  
  if(wTyped){
    for(int i = 0; i < contador; i++){
      shurikens[i].flipBoundaries();
    }
  }
  
  if(mousePressed && contador < 99 && cd <= 0){
   Shuriken pepito = new Shuriken(mouseX, mouseY, 100, 100);
   pepito.update();
   pepito.display();
   shurikens[contador] = pepito;
   contador ++;
   cd = customframerate/6;
  }
  
   for(int i = 0; i < contador; i++){
     if(shurikens[i] != null){
           shurikens[i].update();
           shurikens[i].display();
     }
  }
  
}

class worm{
  float wormX;
  float wormY;
  float xvel;
  float yvel;
  float r = 40;
  float g = 40;
  float b = 40;
  int dirr = 1;
  int dirg = 1;
  int dirb = 1;
  float activador = 0;
  
 public worm(float x, float y){
   wormX = x;
   wormY = y;
   xvel = 0;
   yvel = 0;
 }
 public void updateWorm(){
   xvel += random(-1, 1);
   yvel += random(-1, 1);
   
   activador = random(3);
  
  if(activador < 1){
    r += dirr * random(5);
  }
  
  if(activador > 1 && activador < 2){
    g += dirg * random(5);
  }
  
  if(activador > 2){
    b += dirb * random(5);
  }
  
  
  if(r > 245){
    dirr = -1;
  }else{
    if(r < 10){
      dirr = 1;
    }
  }
  
  if(g > 245){
    dirg = -1;
  }else{
    if(g < 10){
      dirg = 1;
    }
  }
  
  if(b > 245){
    dirb = -1;
  }else{
    if(b < 10){
      dirb = 1;
    }
  }
   
   if(wormX <= 0){
     xvel = abs(xvel/2);
   }
   if(wormX >= 1366){
     xvel = -abs(xvel/2);
   }
   if(wormY <= 0){
      yvel = abs(yvel/2);
   }
   if(wormY >= 768){
     yvel = -abs(yvel/2); 
   }
   
     wormX += xvel;
  wormY += yvel;
  
   fill(r, g, b);
   noStroke();
   ellipse(wormX, wormY, 80 + r, 80 + r);
 }
}
