Paddle left = new Paddle(30, 300, 20, 120);
Paddle right = new Paddle(770, 300, 20, 120);
Ball ball = new Ball(400, 300, 50, 50);

boolean wKey, sKey, upKey, downKey;

void setup(){
  size(800,600);
}

void draw(){
  background(0);
  
  left.display();
  right.display();
  ball.display();
  
  left.moveWS();
  right.moveArrow();
  ball.move();
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

class Ball {
  int x, y;
  int initialX, initialY;
  int ballWidth;
  int ballHeight;
  int xVelocity = 5;
  int yVelocity = 5;
  final int displacement = 15;
  
  Ball(int initialX, int initialY, int ballWidth, int ballHeight){
    this.initialX = initialX;
    this.initialY = initialY;
    this.ballWidth = ballWidth;
    this.ballHeight = ballHeight;
    x = initialX;
    y = initialY;
  }
  
  void display(){
    noStroke();
    fill(255);
    ellipseMode(CENTER);
    ellipse(x, y, ballWidth, ballHeight);
  }
  
  void move(){
    x += xVelocity;
    y += yVelocity;
    
    if(x > width - ballWidth + displacement || x < ballWidth - displacement){
      xVelocity *= -1;
    }
    if(y > height - ballHeight + displacement || y < ballHeight - displacement){
      yVelocity *= -1;
    }
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
