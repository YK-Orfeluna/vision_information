float[] input = new float[100];
float[] percept = input;

int sgn = 1;

void setPlateau(){
  for(int i=30; i<70; i++){
    input[i] = 70;
  }
}

// set input-value
void setCOCE(){
  for(int i=0; i<100; i++){
    if((10<=i) && (i<20)){
      input[i] = input[i-1] - 3 * sgn;
    }
    else if(i==20){
      input[i] = 30 * sgn;
    }
    else if((21<=i) && (i<31)){
      input[i] = input[i-1] - 3 * sgn;
    }
    else if((70<=i) && (i<80)){
      input[i] = input[i-1] + 3 * sgn;
    }
    else if(i==80){
      input[i] = -30 * sgn;
    }
    else if((80<i) && (i<91)){
      input[i] = input[i-1] + 3 * sgn;
    }
  }
  percept = input;
}

void setup(){
  fullScreen();
  
  for(int i=0; i<100; i++){
    input[i] = float(0);
  }
  //input[50] = 5;
  //setPlateau();
}

void draw(){
  background(192);
  setCOCE();
  for(int i=0; i<100; i++){
    ellipse(i * 8 + 50, 200 - input[i], 5, 5);
  }  
}

void keyPressed(){
  if(keyCode==ENTER){
    sgn *= -1;
  }
  else if((key=='q') || (key=='Q')){
    exit();
  }
}