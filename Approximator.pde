int sign(float x) {
  if ( x== 0) return 0;
  return x>0 ? 1 : -1;
}

class Approximator {

  float x;
  float radius = 10;
  FunctionGrapher grapher;

  Approximator(FunctionGrapher grapher) {
    this.grapher = grapher;
    this.x = random(grapher.minX, grapher.maxX);
  }

  Approximator(FunctionGrapher grapher, float x) {
    this.grapher = grapher;
    this.x = x;
  }

  void nextStep(float lr) {
    float step = -this.grapher.f(x)/this.grapher.fPrime(x);
    this.x += step*lr;
  }

  void display() {
    float y = this.grapher.f(this.x);
    PVector point = this.grapher.domainToPoint(this.x, y);
    noStroke();
    fill(0, 255, 0);
    ellipse(point.x, point.y, this.radius, this.radius);
  }
}
