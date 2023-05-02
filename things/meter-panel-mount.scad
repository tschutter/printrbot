// Surface-mount box for CGELE DC Multifunction Battery Monitor Meter
// https://www.amazon.com/gp/product/B08Y61CNLK
//
// Inspired by https://www.thingiverse.com/thing:5331402

use <roundedcube.scad>

// Dimensions of hole for meter.
hole_size_x = 87;
hole_size_y = 47;
hole_corner_radius = 3.5;

// Dimensions of body.
body_size_x = 110;
body_size_y = 70;
body_size_z = 30;
body_radius = 2;
body_thickness = 3;

// Dimensions of screw tabs.
tab_size_x = 25;
tab_size_y = 25;
tab_size_z = 6;  // due to a bug in roundedcube, must be >= 3 * body_radius

// Dimension of screw holes.
screw_hole_radius = 2.25;  // #8 wood screw

// Dimension of wire hole.
wire_hole_radius = 3;

$fs = 0.15;

difference() {
  difference() {
    union() {
      // body
      roundedcube([body_size_x, body_size_y, body_size_z], true, body_radius, "zmax");

      // all tabs
      tab_offset_y = body_size_y / 2 - tab_size_y / 2;
      tab_offset_z = -(body_size_z / 2 - tab_size_z / 2);

      // ymin tabs
      translate([0, -tab_offset_y, tab_offset_z])
        roundedcube([body_size_x + tab_size_x * 2, tab_size_y, tab_size_z], true, body_radius, "zmax");

      // ymax tabs
      translate([0, tab_offset_y, tab_offset_z])
        roundedcube([body_size_x + tab_size_x * 2, tab_size_y, tab_size_z], true, body_radius, "zmax");

      // all tabs
      wing_offset_x_0 = body_size_x / 2 - body_radius;
      wing_offset_x_1 = body_size_x / 2 + tab_size_x - body_radius;
      wing_offset_x_2 = wing_offset_x_0;
      wing_offset_y = body_size_y / 2 - body_radius;
      wing_offset_z_0 = -body_size_z / 2 + tab_size_z - body_radius;
      wing_offset_z_1 = wing_offset_z_0;
      wing_offset_z_2 = body_size_z / 2 - body_radius;

      // xmin, ymin wing
      hull() {
        translate(v = [-wing_offset_x_0, -wing_offset_y, wing_offset_z_0])
          sphere(r = body_radius);
        translate(v = [-wing_offset_x_1, -wing_offset_y, wing_offset_z_1])
          sphere(r = body_radius);
        translate(v = [-wing_offset_x_2, -wing_offset_y, wing_offset_z_2])
          sphere(r = body_radius);
      };

      // xmin, ymax wing
      hull() {
        translate(v = [-wing_offset_x_0, wing_offset_y, wing_offset_z_0])
          sphere(r = body_radius);
        translate(v = [-wing_offset_x_1, wing_offset_y, wing_offset_z_1])
          sphere(r = body_radius);
        translate(v = [-wing_offset_x_2, wing_offset_y, wing_offset_z_2])
          sphere(r = body_radius);
      };

      // xmax, ymin wing
      hull() {
        translate(v = [wing_offset_x_0, -wing_offset_y, wing_offset_z_0])
          sphere(r = body_radius);
        translate(v = [wing_offset_x_1, -wing_offset_y, wing_offset_z_1])
          sphere(r = body_radius);
        translate(v = [wing_offset_x_2, -wing_offset_y, wing_offset_z_2])
          sphere(r = body_radius);
      };

      // xmax, ymax wing
      hull() {
        translate(v = [wing_offset_x_0, wing_offset_y, wing_offset_z_0])
          sphere(r = body_radius);
        translate(v = [wing_offset_x_1, wing_offset_y, wing_offset_z_1])
          sphere(r = body_radius);
        translate(v = [wing_offset_x_2, wing_offset_y, wing_offset_z_2])
          sphere(r = body_radius);
      };
    };
  };

  union() {
    // meter hole
    roundedcube([hole_size_x, hole_size_y, body_size_z + 10], true, hole_corner_radius);

    // screw holes
    hole_offset_x = body_size_x / 2 + tab_size_x / 2;
    hole_offset_y = body_size_y / 2 - tab_size_y / 2;
    hole_offset_z = -body_size_z / 2 + tab_size_z / 2;
    translate([-hole_offset_x, -hole_offset_y, hole_offset_z])
      cylinder(h = tab_size_z + 1, r = screw_hole_radius, center = true);
    translate([-hole_offset_x, hole_offset_y, hole_offset_z])
      cylinder(h = tab_size_z + 1, r = screw_hole_radius, center = true);
    translate([hole_offset_x, -hole_offset_y, hole_offset_z])
      cylinder(h = tab_size_z + 1, r = screw_hole_radius, center = true);
    translate([hole_offset_x, hole_offset_y, hole_offset_z])
      cylinder(h = tab_size_z + 1, r = screw_hole_radius, center = true);

    // wire hole
    translate([body_size_x / 2 - body_thickness / 2, 0, -body_size_z / 2])
      rotate([0, 90, 0])
        cylinder(h = body_thickness + 1, r = wire_hole_radius, center = true);

    // interior space
    interior_size_x = body_size_x - body_thickness * 2;
    interior_size_y = body_size_y - body_thickness * 2;
    translate([0, 0, -body_thickness])
      roundedcube([interior_size_x, interior_size_y, body_size_z], true, body_radius, "zmax");
  };
};
