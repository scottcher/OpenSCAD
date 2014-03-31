use <Misc\CountersunkScrewHoleModule.scad>

FastenerScrewMounts();

module FastenerScrewMounts(
	baseSize		= [10,10,10],
	offsetX		= 5,
	offsetY		= 5,
	offsetZ		= 0,
	holeRadius	= 1.7
)
{
	xPos = baseSize[0]/2 - offsetX;
	yPos = baseSize[1]/2 - offsetY;
	zPos = baseSize[2]/2 + offsetZ;

	rotate([180, 0, 0])
	for (x=[1,-1], y=[1,-1])
		#translate([ xPos * x, yPos * y, zPos])
			CountersunkScrewHole(screwRadius=holeRadius);
}