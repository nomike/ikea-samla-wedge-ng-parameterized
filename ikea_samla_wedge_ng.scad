/*
Parameterized IKEA Samla Wedge NG
Copyright (C) 2024  nomike[AT]nomike[DOT]com

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

// Parameterized IKEA Samla Wedge NG
// created by nomike
// licensed under GPLv3
// created by iggy 
// licensed under CC BY-SA (https://creativecommons.org/licenses/by-sa/4.0/)
// remixed from https://www.thingiverse.com/thing:479007 by Dvogonen


total_height = 87;
bottom_x = 37;
bottom_y = 10;
top_x = 25;
top_y = 26.5;
// Holes for putting zip-ties through
hole_diameter = 5;
// gap between the top/bottom surface and the rim of the oval cutout
oval_z_offset = 25;
// gap between the sides and the oval cutout; Set to something big to remove the cutout completely
oval_y_offset = 10;

/* [Hidden] */
x = 12;

_calculated_height = total_height - 1;
_bottom_oval_z_offset = oval_z_offset;
_top_oval_z_offset_from_top = _calculated_height - oval_z_offset;
_wide_z_offset = _calculated_height;
_oval_top_diameter = bottom_x - (((_wide_z_offset - oval_z_offset)/_calculated_height)*(bottom_x - top_x)) - oval_y_offset;
_oval_bottom_diameter = bottom_x - ((oval_z_offset/_calculated_height)*(bottom_x - top_x)) - oval_y_offset;

_bottom_hole_offset = (_bottom_oval_z_offset - (_oval_bottom_diameter / 2)) / 2;
_top_hole_offset = _top_oval_z_offset_from_top + ((_calculated_height  
- _top_oval_z_offset_from_top) / 2) + (_oval_top_diameter / 4);

difference (){
    color("green") hull(){
        cube([bottom_x,bottom_y,1],center=true);
        translate([0,0,_wide_z_offset]) cube([top_x,top_y,1],center=true);
    }

    color("red") translate([0,0,_bottom_hole_offset]) rotate([90,0,0]) cylinder(d=hole_diameter,h=top_y,center=true,$fn=32);
    color("blue") translate([0,0,_top_hole_offset]) rotate([90,0,0]) cylinder(d=hole_diameter,h=top_y+10,center=true,$fn=32);
    color("magenta") hull(){
        translate([0,0, _bottom_oval_z_offset]) rotate([90,0,0]) cylinder(d=_oval_bottom_diameter,h=top_y,center=true,$fn=32);
        translate([0,0, _top_oval_z_offset_from_top]) rotate([90,0,0]) cylinder(d=_oval_top_diameter,h=top_y,center=true,$fn=32);
    }
}