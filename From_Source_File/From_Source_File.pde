//Simple Vertical Slit-Scan Program from source file
//Written for Processing Version 2.1.2
//Tyler Paige, May 2014
//Based off Golan Levin's "Simple Real-Time Slit-Scan Program"

import processing.video.*; 
Movie srcVid;

boolean newFrame  = false;  // fresh-frame flag

void setup() {
  srcVid = new Movie(this, "source.mov");
  srcVid.loop();
  
  size(srcVid.width, srcVid.height);
  background(0, 0, 0);
}
void movieEvent(Movie m) {
  m.read();
  newFrame = true; //Make a new frame 
}

void draw(){
  if (newFrame) { //For every new frame
    loadPixels();
    int sliceMask = (width*height/2)-width;
    for (int i = sliceMask; i<(width*height)/2; i++) {
      int sliceTgt = i - sliceMask;
      pixels[sliceTgt] = srcVid.pixels[i];
    }
    arrayCopy(pixels, 0, pixels, width, (height-1)*width);
    updatePixels();
  }
    
}
