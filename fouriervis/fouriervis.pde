import java.util.Vector;

public class Pair {
  public float fst, snd;
  Pair(float a, float b) {
    fst=a;
    snd=b;
  }
}

Vector<Pair> ps;
Vector<Float> pos;

void setup() {
  size(640, 480);
  smooth();
  //load paramiters;
  ps=new Vector<Pair>();
  ps.addElement(new Pair(0.5, 0.7));
  ps.addElement(new Pair(0.2, 0.1));
  ps.addElement(new Pair(0.3, 0.4));
  // prepare for graph;
  pos = new Vector<Float>();
  for (int i=0; i<width/2; ++i)
    pos.addElement(new Float((float)height/4));
  //sort ps by radius;
}


float th = 0;
void draw() {
  float dth = PI/100;
  float curX, curY, preX, preY;
  float r;
  float scale = 100;
  float cx = width/4, cy=height/4;
  background(255);
  ellipseMode(RADIUS);
  curX = preX = cx;
  curY = preX = cx;    
  fill(255, 128, 128);
  noStroke();
  ellipse(curX, curY, 3, 3);
  for (int i=0; i<ps.size(); ++i) {
    // read coeff
    float ai = scale*ps.get(i).fst;
    float bi = scale*ps.get(i).snd;
    preX = curX;
    preY = curY;
    curX+= ai* cos((i+1)*th);
    curY+= bi* sin((i+1)*th);

    //draw line
    strokeWeight(3);
    stroke(128, 128, 255, 90);
    line(preX, preY, curX, curY);
    // draw ellipse()
    stroke(128, 255, 128);
    noFill();
    ellipse(preX, preY, ai, bi);
    // calc position()
    fill(255, 128, 128);
    noStroke();
    ellipse(curX, curY, 3, 3);
  }
  th += dth;
  pos.remove(0);
  pos.addElement(new Float(curY));

  // draw graph
  stroke(255, 255, 128);
  line (width/2, 0, width/2, height);
  stroke(128, 128, 255);
  line (curX, curY, width/2, curY);
  stroke(255, 128, 255);
  ellipse(width/2, curY, 4, 4);
  //
  for (int x= width-2, i=0; x>=width/2; --x, ++i)
    line((float)x  , pos.get(i+1).floatValue(), 
         (float)x+1, pos.get(i  ).floatValue());
}