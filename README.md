# Final
It's the Final (Countdown).  
Initial Prototype: https://docs.google.com/document/d/19dUgJ65T11RnqAKPeEgb40M6vEFdX2ab7fQNVNGsIK0/edit?usp=sharing  
Final Prototype: https://docs.google.com/document/d/183SszBrw4eXy1GHYJfT3uPC-GJpeSoFm_8oi-gI_BB0/edit?usp=sharing

# Compile and Run Instructions
You will begin the game in paint mode where you are able to create the map for line rider. 

## Paint Mode
You can expand the map simply by dragging your mouse to the left or right on the screen while also pressing a key that is not one of the following: 1-9, Z, or spacebar. Pressing 1-9 will change the thickness of the line that you are drawing.  
From here, you can press the play button to change to playing mode, the erase button to change to erase mode, or C button to clear the screen.  
You can click on one of the colored boxed on the right of the screen to change the color of your pen.

## Play Mode
The avatar, the sled, will drop from the top of the screen. From here, the sled should follow the movement of the lines that it comes into contact with. You can toggle between whether or not you want to zoom in and follow the sled by pressing the Z key. Note that when zoomed in, you will not be able to view the buttons on the top right of the screen, so if you wish to access those buttons, you must toggle out of zooming. Also note that when you stop zooming in, you will no longer be following the sled's movement across the screen and will default back to where the screen was when you began play mode.  
While in this mode, you can press the play button again to pause the movement of the sled. Note that you cannot access any of draw or erase's functionality while in play mode, even if you are paused. You can click the black square button to reset the game back to draw mode. If you click the paint icon, you will exit play mode and go to paint mode while retaining all your current lines. If you click the erase icon, you will exit play mode and enter erase mode with your current lines.

## Erase Mode
While in erase mode, you will be able to erase lines either by clicking your mouse on top of a line or dragging it across the screen to erase all lines that make contact with your mouse. Note that you will be erasing entire line segments in this mode.  
You can click on the C button to clear all lines. You can click on the play button to go back into play mode with the current map. Clicking on the paint button will put you in paint mode with all the current lines as well. 

# Development Log

## May 21
Julia: Created Final Project document to jot down ideas. Outlined most of the ideas needed for prototype.

## May 22
Julia: Created prototype document and transferred relevant information from final project document onto it. Also created UML diagram.

## May 23
Julia: Worked on branching and merging and worked on line drawing for the project.

## May 24
Julia: Created Segment class and changed up variables as well as function names to operate as needed. Also created the SegmentList class to hold all visible segments. Should have basic functionality working so that it can be implemented as needed into the game.

## May 25
Julia: Drawing is working now and extra features such as weight of the line should work.

## May 26
Julia: Outlined functions for distance and began writing onSegment() to detect whether the avatar is on a segment.

## May 27
Julia: onSegment() boolean version has been renamed to isOnSegment() and onSegment() remains as is. Finished writing them for now.

## May 28
Julia: Testing distance functions and made changes to them to make sure they detect lines properly.

## May 29

## May 30
Julia: Fixed the constructor of line segment which calculated the segment's line equation.

## May 31
Julia: Added color selection and erase mode.

## June 1

## June 2
Julia: Fixed vertical line detection.

## June 3
Julia: Began working on using transformations in our code. Researched and determined how to make the avatar rotate. It should display for now.

## June 4
Julia: Avatar should display and rotate appropriately according to the slope of the line.

## June 5
Julia: The screen should zoom into the avatar and follow it as it moves. Toggling this is possible by pressing the Z key.

## June 6
Julia: Cleaned up code and added a getDistance() function for segment detection to make the code easier to read and change.

## June 7
Julia: Began working on fixing an issue on my collaborator's end, but aborted all changes after I was informed that she seemed to have fixed the problem.

## June 8
Julia: Began working on expanding the map by dragging the mouse across the screen while holding down a key.

## June 9
Julia: Expansion of map should now be possible.

## June 10
Julia: Made changes to segment detection so that they sled will detect a segment even the center of the sled is not directly on top of a line.

## June 11
Julia: Added buttons to the screen that will change modes.
