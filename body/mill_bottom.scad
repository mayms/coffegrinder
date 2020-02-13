t=5;    // thickness
width=70;
depth=60;
heigth=50;

translate([0, -10, 0]) {
    cube(size=[width, depth + 20, t], center=false);
}
cube(size=[width, t, heigth], center=false);
translate([0, depth - t, 0]) cube(size=[width, t, heigth], center=false);
cube(size=[t, depth, heigth], center=false);