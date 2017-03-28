Ball A;
Ball B;

float x, y;
int   counter = 0;

class Ball {
  private ValueAnimator animatorX;
  private ValueAnimator animatorY;
  private color  c;
  private String type;
  Ball(color colour, String animationType) { c = colour; type = animationType; }
  public void reset() {
    animatorX = new ValueAnimator (width / 4, width / 4);
    animatorX.setAnimationType(type);
    animatorY = new ValueAnimator (50, 350);
    animatorY.setAnimationType(type);
  }
  public void animate() {
    int x = (int)animatorX.getVal();
    int y = (int)animatorY.getVal();
    if (type == "smooth") x += width / 2;
    fill(c);
    ellipse(x-20, y-20, 40, 40);
  }
}

void setup(){
  size(640, 360);
  stroke(#FFFFFF);
  //noLoop();
  
  A = new Ball(#ff4400, "linear");
  B = new Ball(#0066ff, "smooth");
}

void draw(){
  background(#202020);
  if (counter ==   0) { A.reset(); B.reset(); }
  if (counter ==  50) { A.animatorY.start(); B.animatorY.start(); }
  counter++;
  if (counter == 200) { counter = 0; } 
  A.animate();
  B.animate();
}