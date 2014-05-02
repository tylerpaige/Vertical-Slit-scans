# Vertical Slit-scan sketches for Processing 2.1.2
This repo contains two Processing sketches made for 2.1.2 that create vertical slit-scans. These sketches are based off Golan Levin's "Simple Real-Time Slit-Scan Program," which works to create horizontal slit-scans.

## How it works
These sketches...
- Grab every frame of video and adds it to the `pixels` array so it can be edited.
2. Select the top half of the frame.
3. Deselect everything above the exact middle row
4. Move the middle row to the top of new frame
5. Move everything down 1 row
6. Repeat for every frame


## Still To-Do
- Ability to adjust video speed, framerate
- Flip live camera along y axis to be "natural" (like Photo Booth)
- Ability to choose from multiple live cameras
