CountersunkScrewHole();

module CountersunkScrewHole(
	screwRadius		= 2,
	headRadius		= 3,
	headDepth		= 2,
	holeDepth		= 10,
	countersinkDepth	= 10
)
{
	translate([0, 0, -holeDepth/2])
	union(){
		// countersink
		translate([0, 0, holeDepth/2 + countersinkDepth/2]) 
			cylinder(h=countersinkDepth, r=headRadius, center=true, $fn=60);
		// beveled head
		translate([0, 0, holeDepth/2 - headDepth/2])
			cylinder(h=headDepth, r1=screwRadius, r2=headRadius, center=true, $fn=60);
		// screw shaft
		cylinder(h=holeDepth, r=screwRadius, center=true, $fn=60);
	} // union
} // CountersunkScrewHole module