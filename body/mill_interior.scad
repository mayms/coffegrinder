$fn=50;

t=5;    // thickness
width=140;
depth=140;
heigth=140;

cube(size=[width, depth, t], center=false);

cube(size=[width, t, heigth], center=false);
translate([0, depth - t, 0]) cube(size=[width, t, heigth], center=false);
cube(size=[t, depth, heigth], center=false);