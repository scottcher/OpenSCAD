FastenerHoleMounts();

module FastenerHoleMounts(
	baseSize		= [10,10,10],
	mountSize	= [7,7,3],
	offsetX		= 5,
	offsetY		= 5,
	offsetZ		= 0,
	holeRadius	= 1.7,
	holeDepth	= 3
)
{
	xPos = baseSize[0]/2 - mountSize[0]/2 - offsetX;
	yPos = baseSize[1]/2 - mountSize[1]/2 - offsetY;
	zPos = baseSize[2]/2 + mountSize[2]/2 + offsetZ;

	// create four mounts, one at each corner of the plate
	for( x=[-1,1], y=[-1,1])
	{
		translate([	xPos * x, yPos * y, zPos])
			difference(){
				cube(mountSize,center=true);
				#translate([0, 0, -mountSize[2]/2 + holeDepth/2 - 0.1])
					cylinder(h=holeDepth * 2, r=holeRadius, center=true, $fn=60);
			} // difference
	} // for loop
}