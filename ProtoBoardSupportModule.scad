ProtoBoardSupport();

module ProtoBoardSupport(
	boardSizeX		= 44,		// 50.82 actual
	boardSizeY		= 51,		// 43.18 actual
	boardThickness	= 2,			// 1.59 actual
	railDepth		= 2,
	railHeightOffset	= 5
)
{
	nozzleDiameter		= 0.4;
	targetWallThickness	= 2;
	headroom				= 1;

	// correct the wall thickness to make it a multiple of the nozzle diameter
	wallThickness = floor(targetWallThickness / nozzleDiameter) * nozzleDiameter;
	if( targetWallThickness != wallThickness ){
		echo(str("Wall thickness corrected to multiple of nozzle diameter: ", wallThickness));
	}

	boxSize	= [	boardSizeX + wallThickness * 2,
				boardSizeY + wallThickness * 2,
				railHeightOffset + boardThickness + headroom];

	translate([0, 0, boxSize[2]/2])
		difference(){
			// Create the shell of the board support box
			cube(boxSize, center=true);
			// hollow out the box
			translate([wallThickness, 0, 0])
				cube([	boardSizeX - railDepth + wallThickness * 2, 
						boardSizeY - railDepth, 
						(railHeightOffset + boardThickness + headroom) * 2], center=true);
			// make the rails
			translate([wallThickness, 0, railHeightOffset/2])
				cube([boardSizeX + wallThickness * 2, boardSizeY, boardThickness], center=true);
		} // difference

} // ProtoBoardSupport module