

class Boundry {
  float x;
  float y;
  float r;
  float s;
  PVector pos;
  
  
Boundry(float xtemp, float ytemp,float rtemp, float stemp) {
  x = xtemp;
  y = ytemp;
  r = rtemp;
  s = stemp;
  pos = new PVector(x, y);

}

void Display() {
  if (this.r == 0) {
  noFill();
  stroke(255, 20);
  rect(pos.x - s, pos.y - s, s+s, s+s);
  }else if (s == 0){
  noFill();
  stroke(255, 20);
  ellipse(pos.x, pos.y, r+r, r+r);
  }
}
}
