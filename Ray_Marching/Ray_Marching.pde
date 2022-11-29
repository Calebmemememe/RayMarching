
Boundry[] stuff;

PVector[] glow = new PVector[0];
Ray ray;

void setup() {
size(1920, 1080);
stuff = new Boundry[10];

ray = new Ray(width/2, height/2, 0);
for (int i = 0; i < 5; i++) {
  float r = random(15, 60);
  float x = random(r, width - r);
  float y = random(r, height - r);
  float s = 0;
  stuff[i] = new Boundry(x, y, r, s);
}
for (int i = 5; i < 10; i++) {
  float r = 0;
  float x = random(r, width - r);
  float y = random(r, height - r);
  float s = random(15, 60);
  stuff[i] = new Boundry(x, y, r, s);
  
  }

}


void draw() {
  background(0);

  for (Boundry s : stuff) {
  s.Display();
  }

  ray.march(stuff);
  ray.rotate(0.0025);
  
  for (PVector v : glow) {
    stroke(255);
    strokeWeight(2);
    point(v.x, v.y);
  }
}

float signedDistance(PVector a, Boundry b) {
  float d = dist(a.x, a.y, b.pos.x, b.pos.y);
  return d - b.r;
}

float signedDistanceSquare(PVector a, Boundry b) { //

  float offsetx = abs(b.x - a.x) - b.s;
  float offsety = abs(b.y - a.y) - b.s;
  PVector offset = new PVector(offsetx, offsety);
  PVector max = new PVector(max(offset.x, 0), max(offset.y, 0));
  float unsigned = length(max);
  
  PVector min = new PVector(min(offset.x, 0), min(offset.y, 0));

  float Insidex = max(min.x, 0);
  float Insidey = max(min.y, 0);
  float inside = (Insidex + Insidey);

  return unsigned + inside;

}
float length(PVector v) {
  return sqrt(v.x * v.x + v.y * v.y);
}
