include <configuration.scad>;
use <frame_motor.scad>
use <frame_top.scad>
use <vertical_carriage_pup.scad>
use <glass_tab.scad>

echo("Base Height in mm:");
echo(base_height * extrusion);

//reference shapes
//rotate(60) cylinder(r = r, center=true, $fn=3);
//rotate(60) cylinder(r = r + 17, center=true, $fn=3);

module printer()
{

rotate([0,0,30])
for (theta = [0, 120, 240])
rotate([0,0,theta])
translate([0,-r,0])
union() {
    
    //sides extrusions
    for (z = [0, (base_height-1)*extrusion, vertical_h - extrusion])
    translate([0,-17,z])
    rotate([0,0,30])
    translate([-extrusion,50*sin(30) + 1,0])
    %cube([extrusion,rod_len,extrusion]);
    
    //corner pieces
    translate([0,0,extrusion * base_height/2])
    render() frame_motor(base_height);
    
    //vertical extrusions
    translate([0,0,vertical_h/2])
    %cube([extrusion,extrusion, vertical_h], center = true);
    
    //top corners
    translate([0,0,vertical_h - extrusion/2])
    render() frame_top();
    
    //cariages
    translate([0,10,vertical_h * 0.5])
    rotate([-90,0,0])
    union() {
        render() main_carriage();
        %wheels();
    }
    
    
    //Bed holders
    rotate(-60)
    translate([-rod_len/2, 0,base_height * extrusion])
    glass_tab2(15, 15, 15 + 4);
    
    //cross bracing
    if(theta != 0) {
        w= 20;
        rotate(-60)
        translate([-30,-10, 5]) 
        rotate([0,-atan(rod_len / vertical_h),0])
        translate([-w/2,-extrusion,0])
        %cube([w, 2, sqrt(pow(vertical_h,2) + pow(rod_len,2) )]);
    }

}

//bed
%translate([0,0,(base_height)*extrusion + 5]) cylinder(r = 250/2, h = 2, center=true);
}

translate([0,0,-vertical_h * 0])  printer();