// Attachment pivot between the head strap and the earpiece on a set
// of iHome headphones.

// number of faces on each cylinder
$fn=120;

scale([25.4, 25.4, 25.4]) {
    union() {
        // cylinder base
        difference() {
            cylinder(h=0.125, r=0.1, center=false);
            translate([0, 0, -0.05]) {
                cylinder(h=0.225, r=0.05, center=false);
            }
        }
        // conical top
        intersection() {
            difference() {
                translate([0, 0, 0.125]) {
                    cylinder(h=0.125, r1=0.1, r2=0.225, center=false);
                }
                translate([0, 0, 0.124]) {
                    cylinder(h=0.126, r1=0.079, r2=0.155, center=false);
                }
            }
            // bevel
            cylinder(h=0.3, r=0.2, center=false);
        }
    }
}
