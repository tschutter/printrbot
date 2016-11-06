// Various Z stop parts.

BottomNutCapture(19, 14, 8, 13, 7, 3, 2);

module BottomNutCapture(width, length, height, slotWidth, nutDiameter, nutHeight, screwDiameter) {
    // width = width in mm
    // length = length in mm
    // height = height in mm

    difference() {
        // body
        cube([width, length, height], center=true);

        // slot
        translate([0, -1, 10]) {
            cube([slotWidth, length + 3, 20], center=true);
        }

        // nut
        translate([0, 0, -nutHeight]) {
            cylinder(h = nutHeight + 1, d = nutDiameter, $fn=6, center=false);
        }

        // screw hole
        cylinder(h = height + 2, d = screwDiameter, $fn=30, center=true);
    }
}
