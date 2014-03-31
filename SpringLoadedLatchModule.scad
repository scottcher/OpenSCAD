SpringLoadedLatch();

module SpringLoadedLatch(
	anchorLength		= 10,
	anchorHeight		= 3,
	springLength		= 25,
	springThickness	= 1,
	latchLength		= 2,
	latchHeight		= 4,
	width			= 2
)
{
	anchorSize	= [anchorLength, width, anchorHeight];
	springSize	= [springLength, width, springThickness];
	latchSize	= [latchLength, width, latchHeight];

	translate([0, 0, 0])
		union(){
			hull(){
				cube(anchorSize);
				translate([anchorSize[0], 0, anchorSize[2] - springSize[2]]) 
					cube([springSize[0] * 0.5, springSize[1], springSize[2]]);
			}
			translate([anchorSize[0] + springSize[0] * 0.5, 0, anchorSize[2] - springSize[2]]) 
					cube([springSize[0] * 0.5, springSize[1], springSize[2]]);
			translate([	anchorSize[0] + springSize[0] - latchSize[0], 0, 
						anchorSize[2] - springSize[2] - latchSize[2]]) 
				cube(latchSize);
		}


} // SpringLoadedLatch module