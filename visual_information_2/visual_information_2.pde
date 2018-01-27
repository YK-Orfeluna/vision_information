PrintWriter output;

//int base = 140;
int[] arr = new int[140];

void setup(){
  size(1200, 800);
  colorMode(RGB, 256);
  background(255, 255, 255);
  
  
  // To make a random array
  int j = 0;
  int[] temp = new int[7];
  
  float[] arr_rand = new float[7];
  
  for(int s=0; s<20; s++){
    for(int i=0; i<7; i++){
      arr_rand[i] = random(7);
    }
    float arr_rand2[] = sort(arr_rand);
    
    for(int i=0; i<7; i++){
      for(int k=0; k<7; k++){
        if(arr_rand2[i] == arr_rand[k]){
          int index = k;
          temp[i] = index;
        }
      }
    }
    for(int i=0; i<7; i++){
      arr[j] = 100 + temp[i] * 5;
      j += 1;
    }
  }
  //println(arr);
  
  // Configuration to write the results to the csv-file
  String filename = "rslt.csv";
  output = createWriter(filename);
}

int cnt = 0;

int upper = 150;
int rad = 100;
int rad2 ;

int circle_x = 750;
int circle_y = 700;


void draw(){
  rad2 = arr[cnt];
  
  //Drawing the backgrond
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
  
  // base circle (not move)
  ellipse(538, 220, rad, rad);
  
  // situmilation circle (moving)
  ellipse(circle_x, circle_y, rad2, rad2); 
}

int flag = -1;
void keyPressed(){
  if(key==ENTER){
    if(cnt<139){
      if(flag!=-1){
        cnt += 1;
        rad2 = arr[cnt];
        println(cnt, rad2);
        output.println(rad2+","+flag);
        flag = -1;
      }
    }
    else{
      output.flush();
      output.close();
      println("Saved your results: rslt.csv");
      exit();
    }
  }
  else if(keyCode==LEFT){
    flag = 1;
  }
  else if(keyCode==RIGHT){
    flag = 0;
  }
  else if(key=='q'){
    output.flush();
    output.close();
    println("Saved your results: rslt.csv");
    exit();
  }
  
  /*
  if(key==CODED){
    if(keyCode==UP){
      rad2 += 5;
      //println(rad2);
      //circle_x -= 6;
      //circle_y -= 80;
      //println(circle_x, circle_y);
    }
    else if(keyCode==DOWN){
      rad2 -= 5;
      //println(rad2);
    }
  }
  if(key==ENTER){
    rad2 = rad;
    //println(rad);
  }
  */
}