Paddle left = new Paddle(30, 300, 20, 120);
Paddle right = new Paddle(770, 300, 20, 120);

boolean wKey, sKey, upKey, downKey;

void setup(){
  size(800,600);
}

void draw(){
  background(0);
  
  left.display();
  right.display();
  
  left.moveWS();
  right.moveArrow();
}

void keyPressed(){
  if(key == 'w' || key == 'W'){
    wKey = true;
  }
  if(key == 's' || key == 'S'){
    sKey = true;
  }
  if(keyCode == UP){
    upKey = true;
  }
  if(keyCode == DOWN){
    downKey = true;
  }
}

void keyReleased(){
  if(key == 'w' || key == 'W'){
    wKey = false;
  }
  if(key == 's' || key == 'S'){
    sKey = false;
  }
  if(keyCode == UP){
    upKey = false;
  }
  if(keyCode == DOWN){
    downKey = false;
  }
}

class Paddle {
  int x;
  int y;
  int paddleWidth;
  int paddleHeight;
  final int velocity = 5;
  
  Paddle(int x, int y, int paddleWidth, int paddleHeight){
    this.x = x;
    this.y = y;
    this.paddleWidth = paddleWidth;
    this.paddleHeight = paddleHeight;
  }
  
  void display(){
    fill(255);
    rectMode(CENTER);
    rect(x, y, paddleWidth, paddleHeight);
  }
  
  void moveWS(){
    if(wKey){
      if(y > 80){
        y -= velocity;
      }
    }
    if(sKey){
      if(y < 520){
        y += velocity;
      }
    }
  }
  
  void moveArrow(){
    if(upKey){
      if(y > 80){
        y -= velocity;
      }
    }
    if(downKey){
      if(y < 520){
        y += velocity;
      }
    }
  }
}
