// TODO: implement weight usage of transitions

class ValueAnimator {
  private float startValue;
  private float endValue;
  private float value;
  private int duration;
  private int progress;
  private boolean isRun;
  private weight = 0.5f; // weight (0f-1f) of duration from startValue to endValue
  private String  animationType;
  
  ValueAnimator (float start, float end) {
    startValue = start;
    endValue   = end;
    value      = start;
    duration   = 50;
    progress   = 0;
    isRun      = false;
    animationType = "linear";
  }
  
  public void setDuration     (int miliSec) { duration = miliSec;   }
 
  public void setAnimationType(String type) { animationType = type; }
 
  public void setEndValue     (float n)     { endValue = n;         }
 
  public void start() { isRun = true;  }
 
  public void stop () { isRun = false; }
  
  public boolean isPlay() { return isRun; }
 
  public float getVal() /* throws Exception */ {
    if (isRun) {
      switch (animationType) {
        case ("linear"): linear(); break;
        case ("smooth"): smooth(); break;
        default: println("Unsupported animation type: " + animationType);
          //throw new Exception("Unsupported animation type:" + animationType);
      }
      if (++progress >= duration) isRun = false;
    }
    return value;
  }
  
  private void linear() {
    value  = (duration - progress) * startValue;
    value += progress * endValue;
    value /= duration;
  }
  
  private void smooth() {
    value  = -cos((float)progress / (float)duration * PI);
    value  = (value + 1f) / 2f;
    value *= (endValue - startValue);
    value += startValue;
  }
}
