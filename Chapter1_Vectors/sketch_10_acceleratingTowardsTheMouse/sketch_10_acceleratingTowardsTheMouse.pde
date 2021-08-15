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
  PVector acceleration; //加速度
  
  float topspeed;
  
  // 类构造方法
  // 构造实例, 初始化实例
  // Vt = Vo +at
  Mover(){
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(-0.001,0.01);
    
    topspeed = 10;
  }
  
  // 类方法
  void update(){
    // step1:compute direction
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);
    //step2:normalize
    dir.normalize();
    //step3:scale
    dir.mult(0.5);
    //step4:accelerate
    acceleration = dir;
    
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
