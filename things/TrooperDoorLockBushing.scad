// Door lock bushing for unlock rod on a 1993 Isuzu Trooper.

// http://www.vehicross.info/modules.php?name=Content&file=viewarticle&id=22
// The manufacturer name for the part is "Holder; Rod, Door".
// The part number for right door is 8-97037-508-0.
// The part number for left door is 8-97037-509-0.

// The original version had notches at the end of the cylinder to
// allow it to flex in to put in the hole, and flex out to insert
// the rod.  But the cylinder wall thickness is so thin that it
// would break when flexing.

// number of faces on each cylinder
$fn=36;

difference() {
    union() {
        // base
        cylinder(h=2, r=5);
        translate([5, 0, 1]) {
            cube([8, 10, 2], center=true);
        }
        translate([8, 0, 0]) {
            cylinder(h=2, r=5);
        }

        // cylinder
        cylinder(h=16, r=3.7);
    }

    // through hole
    cylinder(h=20, r=2.75);

    // notches in base for ziptie
    translate([7, 5, 1]) {
        cube([4, 4, 4], center=true);
    }
    translate([7, -5, 1]) {
        cube([4, 4, 4], center=true);
    }
}
