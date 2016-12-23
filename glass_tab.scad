include <configuration.scad>;

sticky_width = 30;
sticky_length = 25.4;
sticky_offset = 8;  // Distance from screw center to glass edge.
thickness2 = 5;
$fn = 70;

// Make the round edge line up with the outside of OpenBeam.
screw_offset = sticky_width/2 - 7.5;
cube_length = sticky_length + sticky_offset - screw_offset;

module glass_tab() {
  difference() {
    translate([0, screw_offset, 0]) union() {
      cylinder(r=sticky_width/2, h=thickness2, center=true);
      translate([-sticky_width/2, 0, -thickness2/2 - extrusion])
      intersection() {
        cube([sticky_width, cube_length, thickness2 + extrusion]);
        
        translate([0,0,thickness2 + extrusion + 10])
        rotate([0,90,0])
        cylinder(r = cube_length, h = sticky_width);
      }
    }
    cylinder(r=m3_wide_radius, h=20, center=true, $fn=12);
    
    translate([0,0,-thickness2/2 - extrusion/2])
    rotate([-90,0,0])
    cylinder(r = 3, h = 50);
  }
  // Scotch restickable tab for mounting.
  translate([0, sticky_length/2+sticky_offset, thickness2/2]) %
    cube([sticky_width, sticky_length, 0.7], center=true);
  // Horizontal OpenBeam.
  translate([0, 0, (15+thickness2)/-2]) %
    cube([100, 15, 15], center=true);
}

module glass_tab2(l, w, h) {
    difference() {
    intersection() {
    translate([0,0,-extrusion])
    union() {
        cylinder(r = w/2, h = h);
        translate([-w/2, 0, 0]) cube([w,l,h]);
        translate([0, l, 0]) cylinder(r = w/2, h = h);
    }
    translate([0,extrusion/2,h-extrusion])
    rotate([0,90,0]) 
    scale([h, (l + w - extrusion), 1])
    cylinder(r = 1, h = w + 2, center = true, $fn = 100);
    
    }
    translate([0, 0, -15/2])
    cube([100, 15, 15], center=true);
    
    
    cylinder(r=m3_wide_radius, h=20, center=true, $fn=12);
    
    translate([0,0,-thickness2/2 - extrusion/2])
    rotate([-90,0,0])
    union() {
        translate([0,0,l]) cylinder(r = m3_washer_radius, h = 50);
        cylinder(r = m3_wide_radius, h = 50);
    }
    }
}
glass_tab2(15, 15, 15 + 4);

  // Horizontal OpenBeam.
  translate([0, 0, -15/2]) %
    cube([100, 15, 15], center=true);
