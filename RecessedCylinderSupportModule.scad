RecessedCylinderSupport();

module RecessedCylinderSupport(
	height		= 10,
	outerRadius	= 6,
	innerRadius	= 5,
	shelfHeight	= 1,
	shelfWidth	= 0.3
)
{
	shelfInnerRadius = innerRadius - shelfWidth * 2;

	difference(){
		// Sleeve
		cylinder(h=height,r=outerRadius,$fn=60);
		// Countersunk hole
		translate([0, 0, -height + shelfHeight/2])
			union(){
				translate([0, 0, height + shelfHeight/2]) 
					cylinder(h=height,r=innerRadius,$fn=60);
				translate([0, 0, height]) 
					cylinder(h=shelfHeight/2,r1=shelfInnerRadius,r2=innerRadius,$fn=60);
				cylinder(h=height,r=shelfInnerRadius,$fn=60);
			}
	}
} // RecessedCylinderSupport