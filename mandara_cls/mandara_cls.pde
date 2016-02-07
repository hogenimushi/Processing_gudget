float th1, th2;
float dth1, dth2;
float r1, r2;
float ix,iy;
PGraphics pg;

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
  smooth();
  background(0);
  p = new obj[2];
  p[0] = new obj(width/2,height/2,0,2*PI/365*2,141, 8);
  p[1] = new obj(width/2,height/2,0,2*PI/206*2,200,10);
  pg = createGraphics(width,height);
  pg.smooth();
}


void draw(){
   float x1, y1;
   float x2, y2;
   
  // elase screen
  background(0);
  // for background lines
  pg.beginDraw();
//  pg.fill(0,1);
//  pg.rect(0,0,width,height);
  pg.stroke(255,255,255,20);
  pg.line(p[0].x, p[0].y,
          p[1].x, p[1].y);
  pg.endDraw();
  image(pg,0,0);

  // for forground line;
  stroke(255,255,255);
  strokeWeight(3);
  line(p[0].x, p[0].y,
        p[1].x, p[1].y);
  // for forground circles
  ellipseMode(RADIUS);
  strokeWeight(1);
  stroke(30,64,64);
  noFill();
  ellipse(width/2,height/2,p[0].r,p[0].r);
  fill(70,128,128);
  ellipse(p[0].x, p[0].y, p[0].size, p[0].size);

  // show line
  stroke(64,64,30);
  noFill();
  ellipse(width/2,height/2,p[1].r,p[1].r);
  fill(128,128,70);
  ellipse(p[1].x, p[1].y, p[1].size, p[1].size);
  
  // draw indicator;
  fill(128,128,128);
  rect(0,0,width/6,width/6);
  fill(128,64,65);
  ellipse(1/p[0].dth*PI,1/p[1].dth*PI,3,3);
  for(int i=0; i<2; i++){
    p[i].step();
  }
}

void mouseReleased(){
  ix=mouseX;
  iy=mouseY;
  if(mouseButton==RIGHT) {
    pg.beginDraw();
    pg.background(0);
    pg.endDraw();
  }
  if(ix<width/6 && iy<width/6){
    p[0].dth = PI/(float)ix;
    p[1].dth = PI/(float)iy;
  }
}