// Craik-O'Brien-Cornsweet illusion
  
void setup(){
  fullScreen();
  rectMode(CENTER);
}

void draw(){
  background(128);
  translate(width / 2, height / 2);
  int bw = 40;
  int fw = 200;
  int cw = 300;
  int gr = 5;
  
  noStroke();
  fill(192);
  rect(-(fw + cw) / 2, 0, fw - bw, 400);
  rect(0, 0, cw - 2 * bw, 400);
  rect((fw + cw) / 2, 0, fw - bw, 400);
  
  for(int x = 0; x <= bw; x++){
    stroke(map(x, 0, bw, 192, 192 - gr));
    line(-cw / 2 -bw + x, -200, -cw / 2 - bw + x, 200-1);
    line(cw / 2 + bw - x, -200, cw / 2 + bw - x, 200-1);
    stroke(map(x, 0, bw, 192, 192 + gr));
    line(-cw / 2 + bw - x, -200, -cw / 2 + bw - x, 200-1);
    line(cw / 2 - bw + x, -200, cw / 2 - bw + x, 200-1);
  }
}