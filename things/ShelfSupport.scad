// A shelf support that prevents the normal support from pivoting out
// of the pin hole.

// number of faces on each cylinder
$fn=120;

ShelfSupport(10, 6, 18, 19, 15);

module ShelfSupport(pinLength, pinDiameter, supportOffset, width, depth) {
    // pinLength = length of pin in mm
    // pinDiameter = diameter of pin in mm
    // supportOffset = distance from pin centerline to shelf support surface in mm
    // width = width in mm
    // depth = depth in mm

    union() {
        // pin
        rotate(a=-90, v=[1, 0, 0]) {
            translate([0, 0, -1]) {
                cylinder(h=pinLength + 1, r=pinDiameter / 2);
            }
        }

        // body
        difference() {
            polyhedron(
                points=[
                    [-width / 2, 0, -(supportOffset / 2 + 3)],
                    [-width / 2, 0, supportOffset + 2],
                    [-width / 2, -(depth + 3), supportOffset + 2],
                    [width / 2, 0, -(supportOffset / 2 + 3)],
                    [width / 2, 0, supportOffset + 2],
                    [width / 2, -(depth + 3), supportOffset + 2]
                ],
                triangles=[
                    [0, 1, 2],
                    [3, 5, 4],
                    [3, 2, 5],
                    [2, 3, 0],
                    [2, 4, 5],
                    [4, 2, 1],
                    [0, 4, 1],
                    [4, 0, 3]
                ]
            );
            // cut shelf support surface
            translate([0, 0, supportOffset + 2]) {
                #cube(size=[width - 4, depth * 3, 4], center=true);
            }
            // cut front
            translate([0, -(depth + 5), supportOffset]) {
                #cube(size=[width + 2, 10, 10], center=true);
            }
            // cut bottom
            translate([0, 0, -(supportOffset / 2 + 5)]) {
                #cube(size=[width + 2, 10, 10], center=true);
            }
        }
    }
}
