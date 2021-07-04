FunctionGrapher grapher;
Approximator app1;
Approximator app2;
Approximator app3;
Approximator app4;
Maximazer maxim;
Maximazer minim;
float deltaX = 0.01;

void setup() {
  size(800, 400);
  grapher = new FunctionGrapher(-8, 8);
  maxim = new Maximazer(grapher);
  minim = new Maximazer(grapher);

  float max = maxim.maximaze(100, 0.1);
  float min = minim.maximaze(100, -0.1);
  app1 = new Approximator(grapher, max+deltaX);
  app2 = new Approximator(grapher, max-deltaX);
  app3 = new Approximator(grapher, min+deltaX);
  app4 = new Approximator(grapher, min-deltaX);
}

void draw() {
  frameRate(30);
  background(255);
  grapher.graph(true);
  app1.display();
  app1.nextStep(0.1);

  app2.display();
  app2.nextStep(0.1);

  app3.display();
  app3.nextStep(0.1);

  app4.display();
  app4.nextStep(0.1);

  maxim.display();
  minim.display();
}
