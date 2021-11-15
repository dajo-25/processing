 
  
  
  int contador = 0;
  int cd = 0;
  int customframerate = 480;
  
  int sCount = 0;
  
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
