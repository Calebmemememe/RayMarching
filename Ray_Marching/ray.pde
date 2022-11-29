class Ray {
  float x;
  float y;
  float angle;
  PVector pos;
  
  Ray(float xtemp, float ytemp, float angletemp) {
    x = xtemp;
    y = ytemp;
    pos = new PVector(x, y);
    angle = angletemp;
  }
  
  void rotate(float offset) {
    this.angle += offset;
  }
  
  float d;
  void march(Boundry[] stuff) {

    PVector current = this.pos.copy();
    while (true) {
    float record = 1000000000;
    for (Boundry circle : stuff) {

      if (circle.s == 0){
      d = signedDistance(current, circle);
      }
      else if (circle.r == 0) {
      d = signedDistanceSquare(current, circle);
      }
      if (d < record) {
        record = d;
      }
    }
    if (record < 1) {
      glow = (PVector[]) append(glow, current);
      break;
    }
  
    
    PVector v = PVector.fromAngle(this.angle);
    v.setMag(record);

    
    push();
    stroke(255, 0, 200);
    noFill();
    translate(current.x, current.y);
    ellipse(0, 0, record * 2, record * 2);
    //line(0, 0, v.x, v.y);
    pop();
    current.add(v);
    
    if (offScreen(current)) {
      break;
    }
    }
    stroke(0,0,255);
    line(this.pos.x, this.pos.y, current.x, current.y);
  }
  
  
  boolean offScreen(PVector v) {
    return (v.x < 0 || v.x > width || v.y < 0 || v.y > height);
  }
  
}
