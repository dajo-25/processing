int fps = 100;

void setup(){
  size(600, 400);
  frameRate(fps);
}

String timerScore = "caca";
String morseOutput = "";
String charOutput = "";
String currentMorseChar = "";

int temps = 0;
boolean wDown;
boolean aDown;
boolean sDown;
boolean dDown;

String prova = "TT";

int sCount;

int blankTimer = 0;
int pressedTimer = 0;

void draw(){
    
  if(sDown){
    sCount++;
  }else{
    sCount = 0;
  } 
  
  prova.isEmpty();
  
  background(20);
  
  if(dDown){
    morseOutput = "";
  }
  if(wDown){
    charOutput = "";
  }
  if(!charOutput.isEmpty() && sDown && sCount < 2){
    charOutput = charOutput.substring(0, (charOutput.length()-1));
  }
  
  //CONTADORS
  if(aDown){
    pressedTimer++;
  }else{
    blankTimer++; 
    if(pressedTimer != 0){
      morseOutput += calcularSigne();
    }
  }
  
  if(blankTimer > 40 && blankTimer < 80 && !currentMorseChar.isEmpty()){
    charOutput += calcularChar();
    currentMorseChar = "";
  }
  
  if(blankTimer == 80 && !charOutput.isEmpty()){
    charOutput += " ";
  }
  
  //LIMITADOR
  if(blankTimer >= 500){
     blankTimer = 500; 
  }
  if(pressedTimer >= 500){
     pressedTimer = 500; 
  }
  
  timerScore = blankTimer + " " + pressedTimer;
  
  displayUI();
  
}


String calcularSigne(){
  
  String signe = "";
  
  if(blankTimer > 40 && !morseOutput.isEmpty()){
    currentMorseChar = "";
    signe += " ";   
  }
  
  if(pressedTimer < 15){
    signe += ".";
  }else{
    signe += "-";
  }
  
  currentMorseChar += signe;
  
  blankTimer = 0;
  pressedTimer = 0;
  
  return signe;
  
}

String calcularChar(){
  String character = "";
  
  String morseAlph[] = {".-","-...","-.-.","-..",".","..-.","--.","....","..",
  ".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",
  ".--","-..-","-.--","--..",".----","..---","...--","....-",".....","-....",
  "--...","---..","----.","-----"};
  
  currentMorseChar = currentMorseChar.trim();
  
  for(int i = 0; i < 36; i++){
    
    if(currentMorseChar.equals(morseAlph[i])){
      if((i + 65) > 90){
        character += (char) (i + 23);
      }else{
        character += (char) (i + 65);
      }
    }
  }
  
  return character;
}
