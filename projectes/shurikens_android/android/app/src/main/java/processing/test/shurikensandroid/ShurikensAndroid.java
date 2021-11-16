package processing.test.shurikensandroid;

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

public class ShurikensAndroid extends PApplet {

  
  int contador = 0;
  int cd = 0;
  int customframerate = 480;
  
  int sCount = 0;
  
  Shuriken[] shurikens = new Shuriken[100];
  

  
public void setup(){
  background(255);
  
  frameRate(customframerate);

}

public void draw(){
  
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
   cd = customframerate/100;
  }
  
   for(int i = 0; i < contador; i++){
     if(shurikens[i] != null){
       
         if(i%2 == 0){
           shurikens[i].changeColor();
         }
           shurikens[i].update();
           shurikens[i].display();
     }
  }
  
}
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

public void readInput(){
  
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

public void keyPressed(){
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

public void keyReleased(){
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
  
  public void update(){
    
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
  
  public void changeColor(){
   
    fillingR = random(100, 255);
    fillingG = random(100, 255);
    fillingB = random(100, 255);
    
  }
  
  public void display(){
    
    pushMatrix();    
    fill(fillingR, fillingG, fillingB);
    translate(xTrans, yTrans);
    rotate(angle);
    rect(-(xSize)/2, -(ySize)/2, xSize, ySize);
    popMatrix();

    
  }
  
  public void flipBoundaries(){
    if(boundariesState == 1){
      boundariesState = -1;
    }else if(boundariesState == -1){
      boundariesState = 1;
    }
  }
  
  public String info(){
    String info = "xTrans: " + xTrans + " yTrans: " + yTrans;
    return info;
  }
  
}
  public void settings() {  fullScreen(); }
}
