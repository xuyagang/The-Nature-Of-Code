import gifAnimation.*;
GifMaker gifExport;

PVector location;
PVector velocity;
int r;

void setup(){
  size(640,360);
  smooth();
  location = new PVector(100,100);
  velocity = new PVector(2.5,5);
  // 调用生成gif部分的代码
  setup_();
}

void draw(){
  r = 16;
  noStroke();
  fill(15,96);
  rect(0,0,width,height);
  
  location.add(velocity);
  
  if ((location.x > width - r) || (location.x < r)){
    velocity.x = velocity.x * -1;
  }
  if ((location.y > height- r) || (location.y < r)){
    velocity.y = velocity.y * -1;
  }
  
  stroke(#f840fa);
  strokeWeight(3);
  fill(#02ca0c);
  ellipse(location.x,location.y,r,r);
  
  draw_();
}

void setup_(){
  println("gifAnimation " + Gif.version());
  gifExport = new GifMaker(this, "export.gif");
  gifExport.setRepeat(0); // make it an "endless" animation
  //gifExport.setTransparent(#02ca0c); // make black the transparent color. every black pixel in the animation will be transparent
  // GIF doesn't know have alpha values like processing. a pixel can only be totally transparent or totally opaque.
  // set the processing background and the transparent gif color to the same value as the gifs destination background color 
  // (e.g. the website bg-color). Like this you can have the antialiasing from processing in the gif.
}

void draw_(){
  
  gifExport.setDelay(40);
  gifExport.addFrame();
}

void mouseClicked() {
  gifExport.finish();
  println("gif saved");
}
