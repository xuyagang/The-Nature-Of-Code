// 创建移动元的数组
Mover[] movers = new Mover[20];

void setup(){
  size(640,360);
  background(255);
  //将数组中的元素实例化
  for (int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }
}

void draw(){
  background(255);
  // 给数组每个元素进行操作
  for (int i = 0; i < movers.length; i++){
    movers[i].update();
    movers[i].checkedge();
    movers[i].display();
  }
}



class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  // 构造函数
  Mover(){
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 7;
  }
  
  //方法函数
  void update(){
    //find the vector pointing towards the mouse
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);
    //  Normalize the vector to length 1
    dir.normalize();
    dir.mult(0.3);
    acceleration = dir;
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void display(){
    stroke(0);
    fill(125);
    ellipse(location.x, location.y,16,16);
  }
  
  void checkedge(){
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0){
      location.x = width;
    }
    
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}
