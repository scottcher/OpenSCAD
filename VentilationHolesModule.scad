VentilationHoles();

module VentilationHoles(
	ringCount	= 3,
	loopCount	= 5,
	height		= 1,
	holeRadius	= 0.25,
	distance		= 2
)
{
	for( j = [1:loopCount]){
		for( i = [1:ringCount - 1]){
			rotate( i * 45 + j * 75, [ 1, 0, 0])
			translate([0, i * distance, 0])
			rotate([0, 90, 0]) cylinder(h=height, r=holeRadius, center=true, $fn=60);
		}
	}

} // VentilationHoles module