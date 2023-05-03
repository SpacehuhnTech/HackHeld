/* [Case] */
// Case Length in mm
length = 67.1;
// Case Width in mm
width = 50.5;
// Case Height in mm
height = 10;
// Case Wall Width
wall = 2;
// Screw Size
scew = 2.5; // [2.5, 3]

/* [D1 Mini] */
// D1 Mini Width in mm
wemos_length = 34.8;
// D1 Mini Width in mm
wemos_width = 26.2;
// D1 Mini Y-Position
wemos_y = 5.8;
// USB Cutout Height in mm
wemos_cutout_height = 4.4;

/* [OLED Pin Cutout] */
// OLED Pin Row Length in mm
oled_length = 3.7;
// OLED Pin Row Width in mm
oled_width = 10;

/* [General] */
// Higher definition curves
$fs=0.01;
$fn=50;

// Source: https://gist.github.com/groovenectar/92174cb1c98c1089347e
module roundedcube(size = [1, 1, 1], center = false, radius = 0.5, apply_to = "all") {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	module build_point(type = "sphere", rotate = [0, 0, 0]) {
		if (type == "sphere") {
			sphere(r = radius);
		} else if (type == "cylinder") {
			rotate(a = rotate)
			cylinder(h = diameter, r = radius, center = true);
		}
	}

	obj_translate = (center == false) ?
		[0, 0, 0] : [
			-(size[0] / 2),
			-(size[1] / 2),
			-(size[2] / 2)
		];

	translate(v = obj_translate) {
		hull() {
			for (translate_x = [translate_min, translate_xmax]) {
				x_at = (translate_x == translate_min) ? "min" : "max";
				for (translate_y = [translate_min, translate_ymax]) {
					y_at = (translate_y == translate_min) ? "min" : "max";
					for (translate_z = [translate_min, translate_zmax]) {
						z_at = (translate_z == translate_min) ? "min" : "max";

						translate(v = [translate_x, translate_y, translate_z])
						if (
							(apply_to == "all") ||
							(apply_to == "xmin" && x_at == "min") || (apply_to == "xmax" && x_at == "max") ||
							(apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max") ||
							(apply_to == "zmin" && z_at == "min") || (apply_to == "zmax" && z_at == "max")
						) {
							build_point("sphere");
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							build_point("cylinder", rotate);
						}
					}
				}
			}
		}
	}
}

module draw_base() {
    difference() {
        roundedcube([width, length, height], false, 3, "zmin");
        
        translate([wall, wall, wall])
            cube([width-(wall*2), (length-wall*2), height+0.01-wall]);
    }
}

module draw_screw_holes() {
    _height = height-wall;
    _diameter = scew-0.2;
    _diameter_big = 4.8;
    
    _x = 3.75;
    _y = 3.75;
    _z = _height/2 + wall;
    
        difference() {
            translate([_x, _y, _z])
                cylinder(h=_height, d=_diameter_big, center=true);
            
            translate([_x, _y, _z])
                cylinder(h=_height, d=_diameter, center=true);
        }
        
        difference() {
            translate([width-_x, _y, _z])
                cylinder(h=_height, d=_diameter_big, center=true);
            
            translate([width-_x, _y, _z])
                cylinder(h=_height, d=_diameter, center=true);
        }
        
        difference() {
            translate([_x, length-_y, _z])
                cylinder(h=_height, d=_diameter_big, center=true);
            
            translate([_x, length-_y, _z])
                cylinder(h=_height, d=_diameter, center=true);
        }
        
        difference() {
            translate([width-_x, length-_y, _z])
                cylinder(h=_height, d=_diameter_big, center=true);
            
            translate([width-_x, length-_y, _z])
                cylinder(h=_height, d=_diameter, center=true);
        }
}

module draw_wemos_cutout() {
    #translate([wall, wemos_y, wall])
        cube([/*wall*/wemos_length-wall, wemos_width, height-wall]);
    
    #translate([0, wemos_y, height-wemos_cutout_height])
        cube([/*wall*/wall, wemos_width, wemos_cutout_height]);
}

module draw_oled_cutout() {
    #translate([width/2-oled_width/2, 1, wall])
        cube([oled_width, oled_length, height+0.01-wall]);
}

difference() {
    union() {
        difference() {
            draw_base();
            draw_oled_cutout();
        }
        draw_screw_holes();
    }
    draw_wemos_cutout();
}
