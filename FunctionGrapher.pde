class FunctionGrapher {

  float minX;
  float maxX;
  float minY;
  float maxY;

  FunctionGrapher(float minX, float maxX) {
    this.minX = minX;
    this.maxX = maxX;

    this.minY = minX * height/width;
    this.maxY = maxX * height/width;
  }

  float f(float x) {
    //return sin(x);
    //return x*x-2;
    return pow(x, 4)-2*pow(x,3)-pow(x, 2)+2*x;
  }

  float fPrime(float x) {
    //return cos(x);
    return 4*pow(x,3)-6*pow(x,2)-2*x+2;
  }

  void graph(boolean axis) {
    for (int i = 0; i < width; i++) {
      float x = this.pointToDomain(i);
      float y = this.f(x);
      PVector point = domainToPoint(x, y);
      noStroke();
      fill(0);
      ellipse(point.x, point.y, 1, 1);
    }
    if (axis) {
      stroke(0);
      PVector xAxis1 = domainToPoint(this.minX, 0);
      PVector xAxis2 = domainToPoint(this.maxX, 0);

      PVector yAxis1 = domainToPoint(0, this.minY);
      PVector yAxis2 = domainToPoint(0, this.maxY);

      line(xAxis1.x, xAxis1.y, xAxis2.x, xAxis2.y);
      line(yAxis1.x, yAxis1.y, yAxis2.x, yAxis2.y);
    }
  }

  PVector domainToPoint(float x, float y) {
    float mappedX = map(x, this.minX, this.maxX, 0, width);
    float mappedY = map(y, this.minY, this.maxY, height, 0);
    return new PVector(mappedX, mappedY);
  }

  float pointToDomain(float x) {
    float mappedX = map(x, 0, width, this.minX, this.maxX);
    return mappedX;
  }
}
