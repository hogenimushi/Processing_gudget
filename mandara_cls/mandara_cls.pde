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
  public float size;
  
  public obj(float incx, float incy, 
             float inth, float indth,
             float inr,  float insiz){
    cx = incx; cy = incy;
    th = inth; dth = indth;
    r = inr; size = insiz;
  }

  public obj(float in[]){
    cx = in[0]; cy = in[1];
    th = in[2]; dth =in[3];
    r = in[4];  size = in[5];
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

obj p[];

void setup(){
  size(800,600);
  p = new obj[2];
  p[0] = new obj(width/2,height/2,0,2*PI/170,100,3);
  p[1] = new obj(width/2,height/2,0,2*PI/100,200,7);
}


void draw(){
   float x1, y1;
   float x2, y2;
   
  // elase screen
  fill(128,10);
  rect(0,0,width,height);
  
  ellipseMode(RADIUS);
  for(int i=0; i<2; i++){
    ellipse(p[i].x, p[i].y, p[i].size, p[i].size);
    p[i].step();
  }
  line(p[0].x, p[0].y,
       p[1].x, p[1].y);
}