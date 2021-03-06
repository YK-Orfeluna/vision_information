// confirm the blind spot

// right-click: circle becomes smaller
// left-click: circle becomes bigger

// up-key: circle moves upper
// down-key: circle moves downer

// right-key: circle moves to righter
// left-key: circle moves to lefter

// enter-key: reset circle's position and size

void setup(){
  size(600, 600);
  colorMode(RGB, 256);
  background(255, 255, 255);
  fill(255, 0, 0);
}

int rad = 100;        // radius of circle
int circle_x = 450;   // x-axis of circle
int circle_y = 300;   // y-axis of circle

void draw(){
  background(255, 255, 255);
  
  //draw circle
  strokeWeight(0);
  ellipse(circle_x, circle_y, rad, rad);
  
  //draw cross by line
  strokeWeight(2);
  line(150, 250, 150, 350);
  line(100, 300, 200, 300);
  
  //Determine mouse click
  if(mousePressed){
    if(mouseButton==LEFT){
      //left-click
      rad += 1;
    }
    else if(mouseButton==RIGHT){
      //right-click
      if(rad > 0){
        rad -= 1;
      }
    }
    print("radius = ");
    println(rad);
  }
}


// circle moves by cross-keys
void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){
      if(circle_y < 600){
        circle_y -= 1;
        print("y-axis = ");
        println(circle_y);
      }
    }
    else if(keyCode==DOWN){
      if(circle_y > 0){
        circle_y += 1;
        print("y-axis = ");
        println(circle_y);
      }
    }
    else if(keyCode==RIGHT){
      circle_x += 1;
      print("x-axis = ");
      println(circle_x);
    }
    else if(keyCode==LEFT){
      circle_x -= 1;
      print("x-axis = ");
      println(circle_x);
    }
  }
  if(key==ENTER){
      //reset the circle
      rad = 100;
      circle_x = 450;
      circle_y = 300;
      println("reset circle");
  }
}