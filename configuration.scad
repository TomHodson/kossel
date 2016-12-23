// Increase this if your slicer or printer make holes too tight.
extra_radius = 0.0;

// OD = outside diameter, corner to corner.
m3_nut_od = 6.1;
m3_nut_radius = m3_nut_od/2 + 0.2 + extra_radius;
m3_washer_radius = 3.5 + extra_radius;

// Major diameter of metric 3mm thread.
m3_major = 2.85;
m3_radius = m3_major/2 + extra_radius;
m3_wide_radius = m3_major/2 + extra_radius + 0.2;

// NEMA17 stepper motors.
motor_shaft_diameter = 5;
motor_shaft_radius = motor_shaft_diameter/2 + extra_radius;

// Frame brackets. M3x8mm screws work best with 3.6 mm brackets.
thickness = 3.6;

// OpenBeam or Misumi. Currently only 15x15 mm, but there is a plan
// to make models more parametric and allow 20x20 mm in the future.
extrusion = 15;

// Placement for the NEMA17 stepper motors.
motor_offset = 44;
motor_length = 47;
motor_z_offset = 30;

// My addtions
rod_len = 380; // length of horizontal rods
base_height = 7; //measured in multiples of extrusion = 15mm
vertical_h = 800; // length of vertical rods

//ad hoc formula to get radius from horizontal length
// radius is geometric center to center of vertical rods 
r = (rod_len + 100*sin(30) + 2) / (2*cos(30)) - 17;
//r + 17 is the radius of the triangle defined by the inner edges of of the horizontal rods
//where the radius of a an equilateral triangle is the dist from center to the center of one of the edges.
