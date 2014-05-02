//Simple Vertical Slit-Scan Program from Live Video
//Written for Processing Version 2.1.2
//Tyler Paige, May 2014
//Based off Golan Levin's "Simple Real-Time Slit-Scan Program"

import processing.video.*; //Import processing video library
Capture cam; //Init a camera capture

int width = 640; //Adjust for canvas/video scaling
int height = 480; //Adjust for canvas/video scaling

boolean newFrame  = false;  // fresh-frame flag

String[] cameras = Capture.list(); //Get list of all available cameras
void setup() {
  if (cameras.length == 0) { //If no cameras are available...
    println("There are no cameras available for capture.");
    exit();
  } else { //Otherwise
    cam = new Capture(this, width, height); //Declare a capture with the same dimensions as the canvas
    cam.start(); //Start the camera
  }
  size(width, height);
  background(0, 0, 0);
}

void captureEvent(Capture c) { //Make a new event for every frame captured
  c.read(); //Display the frame
  newFrame = true; //Declare a new frame 
}

void draw(){ 
  if (newFrame) { //For every new frame
    loadPixels(); //Open up the pixels so they can be edited
    int sliceMask = (width*height/2)-width; //Mask out every row of pixels about the exact center row
    for (int i = sliceMask; i<(width*height)/2; i++) { //Go through every pixel from the end of the mask to the end of the middle row.
      int sliceTgt = i - sliceMask; //Declare pixels should be moved to top row, save that target as a selection  
      pixels[sliceTgt] = cam.pixels[i]; //Move that pixel to the top row
    }
    arrayCopy(pixels, 0, pixels, width, (height-1)*width); //Move all everything down one row
    updatePixels(); //Save the new frame
  }
    
}
