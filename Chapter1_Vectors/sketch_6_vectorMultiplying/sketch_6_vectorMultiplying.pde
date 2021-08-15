void setup() {
  size(640,320);
}

void draw() {

  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width/2, height/2);
  
  fill(15,90);
  noStroke();
  rect(0,0,width,height);
  
  mouse.sub(center);
  mouse.mult(0.5);
  
  
  
  // 把原点移动到指定坐标
  translate(width/2,height/2); 
  stroke(#009BFF);
  line(0,0,mouse.x, mouse.y);
  stroke(#FF0000);
  line(0,0,mouseX, mouseY);
  stroke(#FFCD00);
  line(width/2,height/2,mouseX, mouseY);
  stroke(#1125F2);
  line(-width/2,-height/2,mouse.x, mouse.y);
}
