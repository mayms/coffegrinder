$fn=50;

t=5;    // thickness
width=70;
depth=70;
heigth=60;

rotate([0, -90, 0]) {
    difference() {
        translate([0, -10, 0]) {
            cube(size=[width, depth + 20, t], center=false);
        }
        translate([10, -5, 0]) cylinder(d=3, h=10*t, center=true);
        translate([width - 10, -5, 0]) cylinder(d=3, h=10*t, center=true);
        translate([10, depth + 10 - 5, 0]) cylinder(d=3, h=10*t, center=true);
        translate([width - 10, depth + 10 - 5, 0]) cylinder(d=3, h=10*t, center=true);
    }

    difference() {
        union() {
            cube(size=[width, t, heigth], center=false);
            translate([0, depth - t, 0]) cube(size=[width, t, heigth], center=false);
        }
        translate([2*t, -10, t + 2]) cube(size=[t, depth + 20, 3], center=false);
        translate([width - 3*t, -10, t + 2]) cube(size=[t, depth + 20, 3], center=false);
    }
    difference() {
        cube(size=[t, depth, heigth], center=false);
        translate([-t, 10, heigth / 2]) cube(size=[3*t, 10, 5], center=false);
        translate([-t, width - 20, heigth / 2]) cube(size=[3*t, 10, 5], center=false);
    }
}
