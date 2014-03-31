Tube();

module Tube(
	height			= 70,
	outerRadius		= 6,
	wallThickness	= 0.4
)
{
	innerRadius = outerRadius - wallThickness;
	difference(){
		cylinder(h=height,r=outerRadius, $fn=60);
		translate([0, 0, -0.5]) cylinder(h=height + 1, r=innerRadius, $fn=60);
	} // difference
}