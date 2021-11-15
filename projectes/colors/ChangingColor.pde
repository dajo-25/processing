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
