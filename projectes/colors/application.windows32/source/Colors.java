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

public class Colors extends PApplet {

ChangingColor red = new ChangingColor(0.5f, 100, 200);
ChangingColor green = new ChangingColor(0.5f, 100, 200);
ChangingColor blue = new ChangingColor(0.5f, 100, 200);

public void setup(){
  
  background(0);
  frameRate(24);
}

public void draw(){
    background(red.updatedColor(), green.updatedColor(), blue.updatedColor());
}
public class ChangingColor{
    
  float valorColor;
  float velocitatColor;
  float parametreAcceleracio;
  float minim;
  float maxim;
  
    public ChangingColor(){
      
      minim = 0;
      maxim = 255;
      
      valorColor = random(minim, maxim);
      velocitatColor = 0;
      parametreAcceleracio = 0.5f;
      
    }
    
    public ChangingColor(float acceleracio){
      
      minim = 0;
      maxim = 255;
      
      valorColor = random(minim, maxim);
      velocitatColor = 0;
      parametreAcceleracio = acceleracio;
    }
    
    public ChangingColor(float min, float max){
      
      minim = min;
      maxim = max;
      
      valorColor = random(minim, maxim);
      velocitatColor = 0;
      parametreAcceleracio = 1;
    }
    
    public ChangingColor(float acceleracio, float min, float max){
      
      minim = min;
      maxim = max;
      
      valorColor = random(minim, maxim);
      velocitatColor = 0;
      parametreAcceleracio = acceleracio;
    }
    
    public float updatedColor(){
      valorColor += velocitatColor;
      velocitatColor += random(-parametreAcceleracio, parametreAcceleracio);
      
      corregirVelocitat();
      
      return valorColor;
    }
    
    public void corregirVelocitat(){
      if(valorColor <= minim){
        velocitatColor = 2;
      }
      if(valorColor >= maxim){
        velocitatColor = -2;
      }
    }
    
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Colors" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
