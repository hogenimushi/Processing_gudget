// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 1-1: stroke and fill


var fcoef=[];
var posX=[];
var posY=[];
var th=0.0;

function setup() {
    createCanvas(640, 480);
    // setup coefficient
    //fcoef.push([0.5, 0.7]);
    //fcoef.push([0.2, 0.1]);
    //fcoef.push([0.3, 0.4]);
    for(var i=0; i<10; ++i){
	if(i&1) fcoef.push([0.0,0.0]);
	else    fcoef.push([1/(i+1),1/(i+1)]);
    }
    // for drawing graphs
    for(var i=0; i<640; i++) {
	posX.push(0);
	posY.push(0);
    }
}

function draw() {
    var dth = PI/100;
    var curX, curY, preX, preY;
    var r;
    var scale = 100;
    var cx = width/4, cy=height/4;

    // initialize drawing
    background(240);

    //////////////////////
    // drawing ellipse
    //////////////////////
    ellipseMode(RADIUS);
    curX = preX = cx;
    curY = preX = cy;    
    // center point
    fill(255, 128, 128);
    noStroke();
    ellipse(curX, curY, 3, 3);

    for (var i=0; i<fcoef.length; ++i) {
	// read coeff
	var ai = scale*fcoef[i][0];
	var bi = scale*fcoef[i][1];
	preX = curX;
	preY = curY;
	curX+= ai* Math.cos((i+1)*th);
	curY+= bi* Math.sin((i+1)*th);

	//draw line
	strokeWeight(3);
	stroke(128, 128, 255, 90);
	line(preX, preY, curX, curY);
	// draw ellipse(in green)
	stroke(128, 255, 128);
	noFill();
	ellipse(preX, preY, ai, bi);
	// calc position(in red)
	fill(255, 128, 128);
	noStroke();
	ellipse(curX, curY, 3, 3);
    }
    th+=dth;

    //////////////////////
    // drawing horisontal graph
    //////////////////////

    // update elements
    posX.pop();
    posX.unshift(curX);
    posY.pop();
    posY.unshift(curY);

    // drawing indicators
    stroke(255, 255, 128);
    line (width/2, 0, width/2, height);
    stroke(128, 128, 255);
    line (curX, curY, width/2, curY);
    stroke(255, 128, 255);
    ellipse(width/2, curY, 4, 4);

    // drawing graphs
    for(var x= width/2,i=0; x <width-1; ++x,++i)
	line(x  , posY[i], x+1, posY[i+1]);
    
}
