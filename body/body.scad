x=120;  // height
y=90;   // width
t=2;    // thickness

difference() {
    cube(size=[x, y, t], center=false);
    // upper bound
    rotate([0, -1*45, 0]) {
        translate([0, 0, 0]) {
            cube(size=[x, y, t], center=false);
        }
    }
    // left bound
    rotate([45, 0, 0]) {
        translate([-0.5, 0, 0]) {
            cube(size=[x+1, y, t], center=false);
        }
    }
    // right bound
    translate([0, y, 0]) {
        rotate([1*45, 0, 0]) {
            translate([-0.5, 0, 0]) {
                cube(size=[x+1, y, 3*t], center=false);
            }
        }
    }
}
