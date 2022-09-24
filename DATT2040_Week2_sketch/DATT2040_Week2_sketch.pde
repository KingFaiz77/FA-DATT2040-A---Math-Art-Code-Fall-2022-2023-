int total = 200;
Fly[] flies = new Fly[total];

void setup(){
  size(900,900);
  background(53,170,153, 97);
  for (int i = 0; i< total; i++){
    flies[i] = new Fly();
  }
}
void draw(){
  //background(153,170,153); //for a different effect, unhide or hide this line (12)
  for (int i = 0; i< total; i++){
    flies[i].run();
  }
}


class Fly{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float flyminborder;
  float flymaxborder;
  float flyspeed;
  
  Fly(){
    location = new PVector (random(width), random(height));
    velocity = new PVector (0,0);
    acceleration = new PVector (0,0);
    
    flyminborder = 90;
    flymaxborder = 100;
    
    flyspeed = 5;
  }
void runAway(){
    PVector mouse = new PVector (mouseX, mouseY);
    PVector approach = PVector.sub(mouse, location);
    float distance = abs(approach.mag());
    
    if (distance <flyminborder){
      approach.normalize();
      approach.mult(flyspeed);
      
      acceleration = approach.mult(random(-1,1));
    }
    
    if (distance > flymaxborder){
      acceleration.mult(0);
      velocity.mult(0);
    }
  }
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(10);
  }
  
  void displayFly(){
  ellipse(location.x, location.y, 40,40);
  fill(89,117,125);
  stroke (185,140,98);
  
}

void checkEdges(){
  PVector edge = new PVector (-450,-450);
  
  if (location.x> width){
    edge = new PVector (width, location.y);
  }
  else if (location.x< 0){
    edge = new PVector (0, location.y);
  }
  if (location.y> height){
    edge = new PVector (location.x, height);
  }
  else if (location.y<0){
    edge = new PVector (location.x, 0);
  }
  
  
  PVector approach = PVector.sub(edge, location);
  float distance = abs(approach.mag());
  
  
  if (distance < flyminborder){
    approach.normalize();
    approach.mult(flyspeed);
    acceleration = approach;
  }
}
  
  void run(){
    displayFly();
    update();
    runAway();
    checkEdges();
  }
}
