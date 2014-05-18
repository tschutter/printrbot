// Door lock bushing for unlock rod on a 1993 Isuzu Trooper.

// need to verify dimensions!

// http://www.vehicross.info/modules.php?name=Content&file=viewarticle&id=22
// The manufacturer name for the part is "Holder; Rod, Door".
// The part number for right door is 8-97037-508-0.
// The part number for left door is 8-97037-509-0.

// number of faces on each cylinder
$fn=36;

difference() {
    union() {
        // base
        cylinder(h=2, r=5);
        translate([5, 0, 1]) {
            cube([10, 10, 2], center=true);
        }
        translate([10, 0, 0]) {
            cylinder(h=2, r=5);
        }

        // cylinder
        cylinder(h=17, r=3.7);

        // swell
        translate([0, 0, 14.1]) {
            sphere(r=4.0);
        }
    }

    // through hole
    cylinder(h=10.5, r=2.75);
    translate([0, 0, 10]) {
        cylinder(h=4, r=2.5);
    }
    translate([0, 0, 13]) {
        cylinder(h=4, r=2.75);
    }

    // hole through base for ziptie
    translate([10, 0, 0]) {
        cylinder(h=3, r=2.7);
    }

    // E/W notch
    translate([-5, -0.4, 11]) {
        cube([10, 0.8, 7]);
    }

    // N/S notch
    translate([-0.4, -5, 11]) {
        cube([0.8, 10, 7]);
    }

    // chop top
    translate([0, 0, 16]) {
        cylinder(h=10, r=10);
    }
}
