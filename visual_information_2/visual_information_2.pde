void setup(){
  size(1200, 800);
  colorMode(RGB, 256);
  background(255, 255, 255);
}

int upper = 150;
int rad = 100;
int rad2 = rad;

int circle_x = 750;
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
  ellipse(538, 220, rad, rad);

  ellipse(circle_x, circle_y, rad2, rad2); 
}

void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){
      rad2 += 5;
      println(rad2);
      //circle_x -= 6;
      //circle_y -= 80;
      //println(circle_x, circle_y);
    }
    else if(keyCode==DOWN){
      rad2 -= 5;
      println(rad2);
    }
  }
  if(key==ENTER){
    rad2 = rad;
    println(rad);
  }
}