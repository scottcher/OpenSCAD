Ear();
//cubeEars();

module Ear(x=0, y=0, z=0, r=6, t=0.3)
{
	translate([x, y, z - (z == 0 ? 0 : t)])
		color("orange") cylinder(h=t,r=r, $fn=60);
}

module cubeEars(size = [20, 20, 0])
{
	// bed adhession helpers
	for( x=[-1,1], y=[-1,1]){
		Ear(size[0]/2 * x, size[1]/2 *y, size[2]);
	}
}