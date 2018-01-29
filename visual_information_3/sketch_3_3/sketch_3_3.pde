float[] input = new float[100];
float[] percept = new float[100];

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
}

void perceve(){
  for(int i=0; i<100; i++){
    percept[i] = input[i];
  }
}

void updatePersept(){
  for(int i=1; i<99; i++){
    if(i==0){
      percept[i] = (percept[i] + percept[i+1]) / 2;
    }
    else if(i==99){
      percept[i] = (percept[i-1] + percept[i]) / 2;
    }
    else if((abs(percept[i]-percept[i+1]) < 15) && (abs(percept[i-1] - percept[i]) < 15)){
      percept[i] = (percept[i-1] + percept[i] + percept[i+1]) / 3;
    }
  }
}

void setup(){
  fullScreen();
  textSize(30);
  
  for(int i=0; i<100; i++){
    input[i] = float(0);
    percept[i] = float(0);
  }
  //input[50] = 5;
  //setPlateau();
  
  setCOCE();
  perceve();
}

void draw(){
  background(192);
  for(int i=0; i<100; i++){
    
    fill(0);
    text("input lightness", 10, 100);
    text("perception lightness", 10, 400);
    text("Enter: swithing lightness pattern", 10, 650);
    text("Space: smoothing perseption lightness", 10, 700);
    
    // drawing input
    fill(255);
    ellipse(i * 8 + 50, 200 - input[i], 5, 5);
    
    // drawing percept
    ellipse(i * 8 + 50, 500 - percept[i], 5, 5);
  }  
}

void keyPressed(){
  if(keyCode==ENTER){
    sgn *= -1;
    setCOCE();
    perceve();
  }
  else if(key==' '){
    updatePersept();
  }
  else if((key=='q') || (key=='Q')){
    exit();
  }
}