
void setup(){
  fullScreen();
  frameRate(120);
}

float wRect = 300;
float hRect = 40;

int r;
int radiRect;
float parametre = 1;

ChangingColor rRect = new ChangingColor();
ChangingColor gRect = new ChangingColor();
ChangingColor bRect = new ChangingColor();

void draw(){
  
  if(radiRect > 1720){
    parametre = -abs(parametre);
  }
  if(radiRect < 1){
    parametre = abs(parametre);  
  }
  
  radiRect += parametre * rRect.updatedColor()/10;
  
  hRect = radiRect;
  wRect = radiRect;

  r += 1;
  translate((width)/2, (height)/2);
  noFill();
  stroke(rRect.updatedColor(), gRect.updatedColor(), bRect.updatedColor());
  strokeWeight(60);
  rotate(r);
  rect(-wRect/2, -hRect/2, wRect, hRect);
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
