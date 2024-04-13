/*
Parameterized IKEA Samla Wedge NG
Copyright (C) 2024  nomike[AT]nomike[DOT]com

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS “AS IS” AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

// Parameterized IKEA Samla Wedge NG
// created by nomike
// originally created by iggy who remixed
// https://www.thingiverse.com/thing:479007 by Dvogonen


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