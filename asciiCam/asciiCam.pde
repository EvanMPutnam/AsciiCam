import processing.video.*;

/**
* Size of the ascii font charachters
*/
int fontSize = 14;

/**
* Size of individual cells
*/
int videoScale = 10;

/**
* Total columns/rows.
*/
int cols, rows;

/**
* Capture object to capture video
*/
Capture video;

/**
* Setup sets screen size, black background, calculates cols/rows,
* and starts video capture.
*/
void setup() {  
  size(640, 480);
  background(0);
  cols = width/videoScale;  
  rows = height/videoScale;  
  video = new Capture(this, cols, rows);
  video.start();
}


void captureEvent(Capture video) {  
  video.read();
}

/**
* Draw to the screen each charachter
*/
void draw() {
  //Load in the pixels
  video.loadPixels();  
  for (int x = 0; x < cols; x++) {       
    for (int y = 0; y < rows; y++) {      
      //Get actual x/y location
      int x1 = x*videoScale;      
      int y1 = y*videoScale;
      //Draw text
      color c = video.pixels[x + y*video.width];
      fill(c);
      textSize(14);
      stroke(0);      
      text("@", x1, y1);
    }  
  }
}