class Maximazer {

  float x;
  float radius = 10;
  FunctionGrapher grapher;

  Maximazer(FunctionGrapher grapher) {
    this.grapher = grapher;
    this.x = random(grapher.minX, grapher.maxX);
  }

  void nextStep(float lr) {
    float step = this.grapher.fPrime(x);
    if(x+step*lr>1000) return;
    this.x += step*lr;
  }

  void display() {
    float y = this.grapher.f(this.x);
    PVector point = this.grapher.domainToPoint(this.x, y);
    noStroke();
    fill(0, 0, 255);
    ellipse(point.x, point.y, this.radius, this.radius);
  }

  float maximaze(int steps, float lr) {
    this.x = random(grapher.minX, grapher.maxX);
    for (int i = 0; i < steps; i++) {
      this.nextStep(lr);
    }
    return this.x;
  }
}
