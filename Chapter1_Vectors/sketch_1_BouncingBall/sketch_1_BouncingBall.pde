// variables for loaction and speed of ball
float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 3.3;

// setup() is execute once when the skecth starts and draw() loops forever and ever (until you quit)
void setup(){
  size(640,360);
  background(0);
}

void draw(){
  background(0);
  // move the ball according to its speed
  x = x + xspeed;
  y = y + yspeed;
  // check for bouncing
  if ((x > width)||(x < 0)){
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 0)){
    yspeed = yspeed * -1;
  }
  
  // display the ball at the location(x,y)
  stroke(0);
  fill(175);
  ellipse(x,y,16,16);
}
