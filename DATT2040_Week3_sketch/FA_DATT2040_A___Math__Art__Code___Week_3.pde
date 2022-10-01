float t;

void setup() {
  //background(20);
  size(900, 900);
  speed = random(0.08, 0.05);
}
static final int line_size = 15;
float speed;
void draw() {
  background(0);
  fill(70, 20);
  stroke(50, 97, 210);
  strokeWeight(6);
  translate(width / 2, height / 2);
  for (int i=0; i<line_size; i++) {
    rect(x1(t + i), y1(t + i), x2(t + i), y2(t + i));
  }
  t += speed;
}

float x1(float t) {
  return sin(t / 10) * 500 + sin(t / 5) * 20;
}

float y1(float t) {
  return tan (t / 10) * 500 + cos(t / 12) * 20;
}

float x2(float t) {
  return sin(t / 10) * 500 + sin(t) * 2;
}

float y2(float t) {
  return cos(t / 20) * 300 + cos(t / 12) * 20 ;
}
