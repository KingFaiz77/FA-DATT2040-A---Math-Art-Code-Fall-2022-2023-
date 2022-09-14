float t;
float CELL_SIZE = 20;

void setup() {
  size(800, 600);
}

void draw() {
  t += 0.01;
  background(89,117,125);
  stroke(200,190,160,90);
  for (float x = CELL_SIZE / 2; x < width; x += CELL_SIZE) {
    for (float y = CELL_SIZE / 2; y < height; y += CELL_SIZE) {
      PVector p = new PVector(x, y);
      for (int i = 0; i < 10; i++) {
        float oldX = p.x;
        float oldY = p.y;
        float angle = noise (p.x / 800.0 + t, p.y / 1200.0) * PI * 2;
        float vx = cos (angle) * 10;
        float vy = sin(angle) * 10;
        p. x += vx;
        p.y += vy;
        
        line (oldX, oldY, p.x, p.y);
      }
    }
  }
}
