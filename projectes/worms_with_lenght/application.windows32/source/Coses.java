import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Coses extends PApplet {

 
  
  int contador = 0;
  int cd = 0;
  int customframerate = 480;
  
  worm[] worms = new worm[100];
  
  //worm pepito = new worm(1366/2, 768/2);

  
public void setup(){
  background(0);
  
  frameRate(customframerate);

}

public void draw(){
  
  cd--;
  
  if(mousePressed && contador < 99 && cd <= 0){
   worm pepito = new worm(mouseX, mouseY);
   pepito.updateWorm();
   worms[contador] = pepito;
   contador ++;
   cd = customframerate/6;
  }
  
   for(int i = 0; i < contador; i++){
     if(worms[i] != null){
           worms[i].updateWorm();
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
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Coses" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
