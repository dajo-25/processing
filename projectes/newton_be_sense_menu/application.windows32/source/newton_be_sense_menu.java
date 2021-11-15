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

public class newton_be_sense_menu extends PApplet {

String[] imFiles = {"fondo.png", "manzana.png", "newtonfeliz.png", "newtontriste.png", "cartell.png", "jugar1.png", "jugar2.png","tauladepuntuacio.png", "tornaajugar1.png", "tornaajugar2.png","manzanadorada.png","manzanavelocidad.png"};
PImage[] im =new PImage[13];                                           //numero d'imatges

int duraciojoc=30;
int jugar=0;
int rectX=20; //mida rectangle x
int rectY=40; //mida rectangle Y
float nX=200-10;  //posició horitzontal newton
int nY=0;         //posició vertical newton
float aY=20;      //posició vertical poma
int aX=200;       //posició horitzontal poma
float nV=4.5f;     //velocitat newton
float agY=20;      //posició vertical poma groga
int agX=200;       //posició horitzontal poma groga
float abY=20;      //posició vertical poma blava
int abX=200;       //posició horitzontal poma blava
float aV=0;       //velocitat poma
float aA=0.05f;    //acceleració poma
float agV=0;       //velocitat poma groga
float agA=0.06f;    //acceleració poma groga
float abV=0;       //velocitat poma blava
float abA=0.08f;    //acceleració poma blava
int p=0;          //puntuació
boolean pC=true;  //contabilitat de punt
long t=0;
boolean ci=true;
int temporitzador=0;
int cebador=0;
int segons=0;
int temporitzador2=0;
int cebador2=0;
int segons2=0;
int factor=1;
int vaiven=1;
int coeficient=1;
int sdp=1;     //selecció de poma
float timer;

public void setup(){
  
 nY= height-(rectY+10);
 t= millis();
 
  for(int i = 0; i < 12; i = i + 1) {                                       //número d'imatges
    im[i] = loadImage(imFiles[i]);
  }
}

public void draw(){
  
  vaiven=vaiven+coeficient;
  if (vaiven>20){
    coeficient=-1;
  }
  if (vaiven<-20){
   coeficient=1;
  }
  if(jugar==0){
  image(im[0],0,0);  
  image(im[4],50,50);
  image(im[5],160,270);
  timer=0;
  p=0;
  
 if (mouseX>160 && mouseX<240 && mouseY>270 && mouseY<300){
   image(im[6],160,270);
 }
  if (mousePressed && mouseX>160 && mouseX<240 && mouseY>270 && mouseY<300){
   jugar=1;
   t= millis();
 }
  }

 if(jugar == 1){
 image(im[0],0,0);
 timer=(millis() -t)/1000; 
 
 if(factor==1 ||factor==4 ||factor==5 ||factor==6 ||factor==7 ||factor==8 ||factor==9){sdp=1;}
 if(factor==2){sdp=2;}
 if(factor==3){sdp=3;}
                                              //poma verda
                                              
 if(sdp==1){
 aV=aV+aA;
 aY=aY+aV;
 if(aY>height){
   
  factor=PApplet.parseInt(random(1,10));
  
  if(factor==1){
  aY=20;
  aX= PApplet.parseInt(random(25,(width-5)));
  aV=0;
  pC=true;
  }
}
  
 if((aY+10)>nY && (aY-10)<(nY+rectY)){
   if((aX+10)>nX && (aX-10)<(nX+20)){
     fill(255,0,0); 
     if(pC == true){
     p=p+1;
     pC=false;
     }
     
   }
   if((aY+10)>nY && (aY-10)<(nY+rectY)){
   if((aX+10)>nX && (aX-10)<(nX+20)){ 
     cebador=2;
    
   }  
   }
 }                                               //poma verda
 }                                               //poma groga
 if(sdp==2){
 agV=agV+agA;
 agY=agY+agV;
 if(agY>height){
  factor=PApplet.parseInt(random(1,10));
  
  if(factor==2){
  agY=20;
  agX= (PApplet.parseInt(random(25,(width-5)))+vaiven);
  agV=0;
  pC=true;
}
 }
  
 if((agY+10)>nY && (agY-10)<(nY+rectY)){
   if((agX+10)>nX && (agX-10)<(nX+20)){
     fill(255,0,0); 
     if(pC == true){
     p=p+5;
     pC=false;
     }
     
   }
   if((agY+10)>nY && (agY-10)<(nY+rectY)){
   if((agX+10)>nX && (agX-10)<(nX+20)){ 
     cebador=2;
   }  
   }
 }
 }                                                //pomagroga
 
                                                 //poma blava
 if(sdp==3){
 abV=abV+abA;
 abY=abY+abV;
 if(abY>height){
  factor=PApplet.parseInt(random(1,10));
  if(factor==3){
  abY=20;
  abX= PApplet.parseInt(random(25,(width-5)));
  abV=0;
  pC=true;
}
 }
  
 if((abY+10)>nY && (abY-10)<(nY+rectY)){
   if((abX+10)>nX && (abX-10)<(nX+20)){
     fill(255,0,0); 
     if(pC == true){
     p=p+0;
     pC=false;
     }
   if((abY+10)>nY && (abY-10)<(nY+rectY)){
   if((abX+10)>nX && (abX-10)<(nX+20)){ 
     cebador2=2;
   }
   }
 }
 }                                             //estat de velocitat
 temporitzador2=temporitzador2+segons2;                               
 }
    if(cebador2 ==2){
      //image(im[2],nX, nY);
      segons2=1;
 }     
 if(temporitzador2==0){
  temporitzador2=temporitzador2+segons2;
 }
 if(temporitzador2>0){
   temporitzador2=temporitzador2+segons2;
   nV=9;
 }
 if (temporitzador2>0 && temporitzador2<700){
   nV=9;
 }
 if (temporitzador2>700){            //duració de la velocitat
   segons2=0;
   temporitzador2=0;
   cebador2=0;
   nV=4.5f;
                                                   //estat de velocitat
   }

 }
                                               //pomablava
 
 
 if(sdp==1){image(im[1],aX,aY);}
 if(sdp==2){image(im[10],(agX+vaiven),agY);}
 if(sdp==3){image(im[11],abX,abY);}

 

 if(cebador == 0){
  image(im[3],nX, nY);
 }
 
 if(cebador ==2){
      //image(im[2],nX, nY);
      segons=1;
 }
 if(temporitzador==0){
  temporitzador=temporitzador+segons;
 }
 if(temporitzador>0){
   temporitzador=temporitzador+segons;
   image(im[2],nX, nY);
 }
 if (temporitzador>0 && temporitzador<50){
   image(im[2],nX, nY);
 }
 if (temporitzador>50){
   segons=0;
   temporitzador=0;
   cebador=0;
 }
 
                                                                          //duració joc
 if(timer>=duraciojoc){
   timer=duraciojoc;                                                                         
   image(im[0],0,0);
   image(im[7],50,50);
   image(im[8],100,270);
   textSize(18);
   fill(0);
   text(p,206,198);
   fill(255);
   text(p,205,196);
  if (mouseX>100 && mouseX<300 && mouseY>270 && mouseY<310){
   image(im[9],100,270);
 }
  if (mousePressed && mouseX>100 && mouseX<300 && mouseY>270 && mouseY<310){
    jugar=0;
    //exit();
 }
 }
 textSize(12);
 //fill(0);
 //text("Poma: " + factor, 10, 65);
 //fill(0);
 //text("selecció de poma: " + sdp, 10, 85);
 fill(0);
 text("Temps: " + (duraciojoc - timer), 10, 20);                          //duració joc
 
 //fill(0);
 //text("Segons: " + segons, 10, 60);
 
 //fill(0);
 //text("Temporitzador: " + temporitzador, 10, 40);

 if (temporitzador2>0 && temporitzador2<700){
   fill(0);
   textSize(15);
   text("BONUS DE VELOCITAT", 11, 51);
   fill(0,120,200);
   textSize(15);
   text("BONUS DE VELOCITAT", 10, 50);

 }
 textSize(12);
 fill(30);
 text("Puntuació: "+ p, 3* width/4, 20);
 }
 
public void keyPressed(){
  if(keyCode == RIGHT){
   nX=nX+nV;
  }
  if(keyCode == LEFT){
   nX=nX-nV; 
  }
  if(key=='d' || key== 'D'){
   nX=nX+nV;
  }
  if(key=='a' || key== 'A'){
   nX=nX-nV;
  }
  if(nX<0){
   nX=nV;
  }
  if(nX>width-rectX){
   nX=width-(rectX+3);
  }
}
  public void settings() {  size(400,400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "newton_be_sense_menu" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
