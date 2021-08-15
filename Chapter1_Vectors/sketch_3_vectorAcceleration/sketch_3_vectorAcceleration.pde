Mover mover;

void setup(){
  size(320,180);
  mover = new Mover();
}

void draw(){
  background(15);
  mover.update();
  mover.checkEdges();
  mover.display();
}


class Mover { //类名是Mover
  PVector location;
  PVector velocity; //速率
  PVector acceleration;
  
  float topspeed;
  
  // 类构造方法
  // 构造实例, 初始化实例
  Mover(){
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-9,9),random(-9,9));
    acceleration = new PVector(-0.001,0.01);
    topspeed = 10;
  }
  
  // 类方法
  void update(){
    velocity.add(acceleration);
    velocity.limit(topspeed);
    
    location.add(velocity);
  }
  void display(){
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,16,16);
  }
  void checkEdges(){
    if (location.x > width){
      location.x = 0;
    } else if(location.x < 0){
      //velocity = velocity * -1;
      location.x = width;
    }
    if (location.y > height){
      location.y = 0;
    }else if (location.y < 0){
      location.y = height;
    }
  }
} // 类定义结束
