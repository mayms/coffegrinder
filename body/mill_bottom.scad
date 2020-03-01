$fn=50;

t=5;    // thickness
width=70;
depth=60;
heigth=50;

difference() {
    translate([0, -10, 0]) {
        cube(size=[width, depth + 20, t], center=false);
    }
    translate([10, -5, 0]) cylinder(d=3, h=10*t, center=true);
    translate([width - 10, -5, 0]) cylinder(d=3, h=10*t, center=true);
    translate([10, depth + 10 - 5, 0]) cylinder(d=3, h=10*t, center=true);
    translate([width - 10, depth + 10 - 5, 0]) cylinder(d=3, h=10*t, center=true);
}

cube(size=[width, t, heigth], center=false);
translate([0, depth - t, 0]) cube(size=[width, t, heigth], center=false);
cube(size=[t, depth, heigth], center=false);