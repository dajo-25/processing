ChangingColor red = new ChangingColor(0.5, 100, 200);
ChangingColor green = new ChangingColor(0.5, 100, 200);
ChangingColor blue = new ChangingColor(0.5, 100, 200);

void setup(){
  fullScreen();
  background(0);
  frameRate(24);
}

void draw(){
    background(red.updatedColor(), green.updatedColor(), blue.updatedColor());
}
