float th1, th2;
float dth1, dth2;
float r1, r2;

// object class
public class obj {
  public float cx,cy;
  public float x,y;
  public float th;
  public float dth;
  public float r;
  
  public obj(float incx, float incy, 
             float inth, float indth,
             float inr){
    cx = incx; cy = incy;
    th = inth; dth = indth;
    r = inr;
  }

  public obj(float in[]){
    cx = in[0]; cy = in[1];
    th = in[2]; dth =in[3];
    r = in[4];
  }
  
  public void step(){
    calcCoord();
    th+=dth;
  }
  void calcCoord(){
    x = cx + r*sin(th);
    y = cy - r*cos(th);
  }
}

void setup(){
  size(800,600);
  th1 = 0; th2 = 0;
  dth1 = 2*PI/100;
  dth2 = 2*PI/40;
  r1  = 100;
  r2 = 200;
}


void draw(){
   float x1, y1;
   float x2, y2;
   
  // elase screen
  fill(128,10);
  rect(0,0,width,height);
  
  x1 = r1*cos(th1);
  y1 = r1*sin(th1);
  x2 = r2*cos(th2);
  y2 = r2*sin(th2);

  ellipseMode(RADIUS);
  ellipse(x1 + width/2, -y1 +height/2, 5, 5);
  ellipse(x2 + width/2, -y2 +height/2, 10, 10);
  
  line(x1+width/2,-y1+height/2,
       x2+width/2,-y2+height/2);
  th1 += dth1;
  th2 += dth2;
}