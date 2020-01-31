include <config.scad>

x=width;
y=width;
center=width/2;

difference() {
    cube(size=[x, y, t], center=false);
    // upper bound
    rotate([0, -1*45, 0]) {
        translate([0, -0.5, 0]) {
            cube(size=[x, y+1, t], center=false);
        }
    }
    // left bound
    rotate([45, 0, 0]) {
        translate([-0.5, 0, 0]) {
            cube(size=[x+1, y, t], center=false);
        }
    }
    // bottom bound
    translate([x, 0, 0]) {
        rotate([0, -45, 0]) {
            translate([0, -0.5, 0]) {
                cube(size=[x, y+1, 3*t], center=false);
            }
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
    // hole
    translate([center, center, -0.5]) {
        cylinder(d=10, h=t+1, center=false);
    }
}
