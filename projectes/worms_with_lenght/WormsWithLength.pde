 
  
  int contador = 0;
  int cd = 0;
  int customframerate = 480;
  
  worm[] worms = new worm[100];
  
  //worm pepito = new worm(1366/2, 768/2);

  
void setup(){
  background(0);
  fullScreen();
  frameRate(customframerate);

}

void draw(){
  
  cd--;
     // background(0);

  if(mousePressed && contador < 99 && cd <= 0){
   worm pepito = new worm(mouseX, mouseY);
   pepito.updateWorm();
   worms[contador] = pepito;
   contador ++;
   cd = customframerate/6;
  }
    background(0);


   for(int i = 0; i < contador; i++){
     if(worms[i] != null){
           worms[i].updateWorm();
     }
  }
}

public class cercle{
  float cercleX;
  float cercleY;
  float cercleR = 40;
  float cercleG = 40;
  float cercleB = 40;
  float radix;
  float radiy;
  
  public cercle(float r, float g, float b, float x, float y, float rx, float ry){
    cercleX = x;
    cercleY = y;
    cercleR = r;
    cercleG = g;
    cercleB = b;
    radix = rx;
    radiy = ry;
  }
}

public class worm{
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
  cercle cos [] = new cercle[10];
  
 public worm(float x, float y){
   wormX = x;
   wormY = y;
   xvel = 0;
   yvel = 0;
   for(int i = 0; i < 10; i++){
     cos[i] = new cercle(0f,0f,0f,0f,0f,0f,0f);
   }
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
    
    cos[0] = new cercle(r, g, b, wormX, wormY, 80 + r, 80 + r);

    for(int i = 9; i > 0; i--){
      cos[i] = cos [i-1];
    }
  
   fill(r, g, b);
   noStroke();
   ellipse(wormX, wormY, 80 + r, 80 + r);
   for(int i = 0; i < 10; i++){
     fill(cos[i].cercleR, cos[i].cercleG, cos[i].cercleB);
     noStroke();
     ellipse(cos[i].cercleX, cos[i].cercleY, cos[i].radix, cos[i].radiy);
   }
   
   println(cos[1].cercleX);
   
 }
}
