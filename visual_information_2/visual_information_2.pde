void setup(){
  size(1200, 800);
  colorMode(RGB, 256);
  background(255, 255, 255);
}

int upper = 150;
int rad = 85;

int circle_x = 700;
int circle_y = 700;

void draw(){
  background(157, 204, 224);
  
  strokeWeight(0);
  fill(144, 238, 144);
  rect(0, upper, 1200, 800);
  
  fill(128, 128, 128);
  //triangle(600, 200, 1150, 800, 50, 800);
  quad(525, upper, 675, upper, 1150, 800, 50, 800);
  
  fill(255, 255, 255);
  quad(597, upper, 603, upper, 650, 800, 550, 800);
  
  fill(0, 0, 0);
  rect(15, 500, 120, 180);
  rect(225, 275, 80, 120);
  rect(400, 100, 50, 75);
  
  rect(1200-120-15, 500, 120, 180);
  rect(1200-80-225, 275, 80, 120);
  rect(1200-50-400, 100, 50, 75);
  
  strokeWeight(2);
  fill(255, 0, 0);
  
  //base circle
  ellipse(545, 200, rad, rad);

  ellipse(circle_x, circle_y, rad, rad); 
}

void keyPressed(){
  if(key==ENTER){
    circle_x -= 4;
    circle_y -= 50;
  }
}