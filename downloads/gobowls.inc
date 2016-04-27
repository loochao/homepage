/* gobowls.inc
 * Copyright (C) 2003 Nicolas Rougier
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this software; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

// ********************************************************************
// How to use:
//  Include this file and then you can use following objects
//
//   - gobowl_black_open:   An empty open black go bowl
//   - gobowl_black_closed: An empty closed black go bowl
//   - gobowl_black_top:    A black go bowl top
//   - gobowl_white_open:   An empty open white go bowl
//   - gobowl_white_closed: An empty closed white go bowl
//   - gobowl_white_top:    A white go bowl top
//
// All objects are centered at origin & lying on floor.
// There is no real difference between black and white bowl, 
// the distinction is only made for varying texture a little bit.
//
// Bowl's size is roughly 1 pov unit so you need to scale them yourself.
//  (to match standard goban size, use <7,6,7>, 1 pov unit = 1cm)
//
// The macro fill_bowl allows to fill the bowl with some stones.
// Parameters are:
//  - bowl_size:    size fo the bowl
//  - level:        height of stones within bowl (should be between 0.2 and 0.8)
//  - stone_radius: radius of stone
//  - stone_color:  stone color (0 for black, 1 for white)
//
// ********************************************************************
#version 3.5;
#include "colors.inc"
#include "woods.inc"
#include "shapes.inc"
#include "gostones.inc"

#local a=4;
#local b=5;
#local c=2;
#local d=3;
#declare bowlwood_int_A = 
  color_map {
    [0.00 color rgb <0.80, 0.232, 0.115>/a]
    [0.10 color rgb <0.80, 0.232, 0.115>/a]
    [0.90 color rgb <0.45, 0.115, 0.060>/a]
  }
#declare bowlwood_int_B = 
  color_map {
    [0.00 color rgbt <0.70, 0.232, 0.115, 0.5>/b]
    [0.10 color rgbt <0.70, 0.232, 0.115, 0.7>/b]
    [0.15 color rgbt <0.70, 0.232, 0.115, 0.9>/b]
    [0.20 color rgbt <0.35, 0.115, 0.060, 0.7>/b]
  }

#declare bowlwood_ext_A = 
  color_map {
    [0.00 color rgb <0.80, 0.232, 0.115>/c]
    [0.10 color rgb <0.80, 0.232, 0.115>/c]
    [0.90 color rgb <0.45, 0.115, 0.060>/c]
  }
#declare bowlwood_ext_B = 
  color_map {
    [0.00 color rgbt <0.70, 0.232, 0.115, 0.5>/d]
    [0.10 color rgbt <0.70, 0.232, 0.115, 0.7>/d]
    [0.15 color rgbt <0.70, 0.232, 0.115, 0.9>/d]
    [0.20 color rgbt <0.35, 0.115, 0.060, 0.7>/d]
  }

#declare t_bowl_white_int = 
  texture { pigment { P_WoodGrain14A color_map { bowlwood_int_A } rotate z*85 translate z*2} finish {ambient .1}}
texture { pigment { P_WoodGrain14B color_map { bowlwood_int_B } rotate z*85 translate z*2} finish {ambient .1}}
#declare t_bowl_white_ext =
  texture { pigment { P_WoodGrain14A color_map { bowlwood_ext_A } rotate z*85 translate z*2} finish {ambient 0.25 phong 1 phong_size 90}}
texture { pigment { P_WoodGrain14B color_map { bowlwood_ext_B } rotate z*85 translate z*2} finish {ambient 0.25 phong 1 phong_size 90}} 

#declare t_bowl_black_int = 
  texture { pigment { P_WoodGrain14A color_map { bowlwood_int_A } rotate z*88 translate z*1} finish {ambient .1}}
texture { pigment { P_WoodGrain14B color_map { bowlwood_int_B } rotate z*88 translate z*1} finish {ambient .1}}
#declare t_bowl_black_ext =
  texture { pigment { P_WoodGrain14A color_map { bowlwood_ext_A } rotate z*88 translate z*1} finish {ambient 0.25 phong 1 phong_size 90}}
texture { pigment { P_WoodGrain14B color_map { bowlwood_ext_B } rotate z*88 translate z*1} finish {ambient 0.25 phong 1 phong_size 90}} 


#declare gobowl_black_open =
  union {
    difference {
      sphere {<0,1,0> 1  texture {t_bowl_black_ext}}
      plane {y,0.3}
      plane {y,1.5 inverse texture {t_bowl_black_ext}}
      cylinder {<0,.4,0>, <0,2.5,0>, 0.7 texture {t_bowl_black_int}}
      translate <0,-.3,0>
    }
    torus { sin(acos(0.5))/2 + 0.35  // Major radius
      sin(acos(0.5))/2 - 0.35  // Minor radius
      scale     <1,  .6, 1>
      translate <0, 1.2,  0>
      texture {t_bowl_black_ext}
    }
    cylinder {<0,0,0>, <0,0.05,0>, cos(asin(0.7)) texture {t_bowl_black_ext}}
  }
#declare gobowl_black_top=
  union {
    difference {
      sphere {<0,0,0> cos(asin(0.5))}
      plane {y,0}
      scale <1,.4,1>
      translate <0,.06,0>
    }
    cylinder {<0,0,0>, <0,0.06,0>, cos(asin(0.5))*0.8 }
    texture {t_bowl_black_ext}
  }

#declare gobowl_black_closed = 
  union {
    object {gobowl_black_open}
    object {gobowl_black_top rotate y*70 translate <0,1.22-.06,0>}
  }


#declare gobowl_white_open =
  union {
    difference {
      sphere {<0,1,0> 1  texture {t_bowl_white_ext}}
      plane {y,0.3}
      plane {y,1.5 inverse texture {t_bowl_white_ext}}
      cylinder {<0,.4,0>, <0,2.5,0>, 0.7 texture {t_bowl_white_int}}
      translate <0,-.3,0>
    }
    torus { sin(acos(0.5))/2 + 0.35  // Major radius
      sin(acos(0.5))/2 - 0.35  // Minor radius
      scale     <1,  .6, 1>
      translate <0, 1.2,  0>
      texture {t_bowl_white_ext}
    }
    cylinder {<0,0,0>, <0,0.05,0>, cos(asin(0.7)) texture {t_bowl_white_ext}}
  }

#declare gobowl_white_top=
  union {
    difference {
      sphere {<0,0,0> cos(asin(0.5))}
      plane {y,0}
      scale <1,.4,1>
      translate <0,.06,0>
    }
    cylinder {<0,0,0>, <0,0.06,0>, cos(asin(0.5))*0.8}
    texture {t_bowl_white_ext}
  }

#declare gobowl_white_closed = 
  union {
    object {gobowl_white_open}
    object {gobowl_white_top rotate y*70 translate <0,1.22-.06,0>}
  }



#macro fill_bowl_one_layer (bowl_size, level, stone_radius, stone_color, shift)
#local disc_radius = 0.7*bowl_size;
#local disc_height = level*bowl_size;
#local st=seed(18);
#local step = int(disc_radius/(stone_rad*2)) + 4;
#declare i=0;
#while (i<=step)
  #declare j=0;
  #while (j<=step)
    #local stone_x = (((i-step/2)+(j-2*div(j,2))/2)*stone_rad*2)+shift;
    #local stone_z = ((j-step/2)*stone_rad*1.65)+shift;
    #if ((stone_x*stone_x+stone_z*stone_z+stone_rad*stone_rad) < (.9*disc_radius*disc_radius))
      #if (stone_color = 1)
	object {w_stone(st)
	  rotate <rand(st)*40-20, 0, rand(st)*40-20>  
	  translate <stone_x, 0, stone_z>
	  translate y*disc_height}
      #else
	object {b_stone(st)
	  rotate <rand(st)*40-20, 0, rand(st)*40-20>  
	  translate <stone_x, 0, stone_z>
	  translate y*disc_height}
      #end
    #end
    #declare j=j+1;
  #end
  #declare i=i+1;
#end
#end // macro fill_bowl_one_layer


#macro fill_bowl (bowl_size, level, stone_radius, stone_color)
#local disc_radius = 0.7*bowl_size;
#local disc_height = (level-0.2)*bowl_size;

// First, we put a simple cylinder to hide hole between stones  
#if (stone_color = 1) 
  cylinder {<0,disc_height-0.001,0> <0,disc_height,0>, disc_radius pigment {color rgb 1}}
#else
  cylinder {<0,disc_height-0.001,0> <0,disc_height,0>, disc_radius pigment {color rgb 0}}
#end
fill_bowl_one_layer (bowl_size, level-0.1, stone_rad, stone_color, 0)
fill_bowl_one_layer (bowl_size, level, stone_rad, stone_color, -stone_rad)
#end // macro fill_bowl()
