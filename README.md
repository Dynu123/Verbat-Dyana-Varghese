This project prototype has been implemented with the help of UIview Animations
Two sub views are placed on top of the main view in white background. 
Shadow and corner radius is set all 3 views.
on ViewDidLoad, animation is set to start using animateWithDuration on calling the function rotate(). This is appplied to the top most uiview. 
The animation effect is given using CGAffineTransformMakeRotation(-M_PI/2) and changing the frames.
Animation delay is set to 2 min, after 2 min first view stops animating and the 2nd view starts animating. 
Once the second view finishes animation, the rotate() is called again which starts the animation again.
