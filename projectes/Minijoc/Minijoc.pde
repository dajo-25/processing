void setup(){
  
  size(400, 400);
  background(10, 20, 30);
  
}

Entity player = new Entity(200, 200, 100, 40);

void draw(){
  
  player.update();
  player.display();
  
}
