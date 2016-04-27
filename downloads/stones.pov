// Pebble stones
// Copyright (C) 2003 Nicolas P. Rougier (rougier@loria.fr)
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
// ---------------------------------------------------------------------------
// Persistence of Vision Ray Tracer Scene Description File
// File: stones.pov
// Vers: 3.5
// Desc: Four pebble stones
// Date: 06/2003
// Auth: Nicolas Rougier
// Cmd : povray +Istones.pov +w1200 +h600 +fn +am2 +a0.1 +P
// ---------------------------------------------------------------------------
#version 3.5;

// ========================================
//  Switches
// ========================================
#declare use_radiosity         = 1;
#declare use_area_light        = 1;
#declare rseed = seed (5);

// ========================================
//  Settings
// ========================================
global_settings {
  assumed_gamma 1.0
  #if (use_radiosity)
    radiosity {
	  pretrace_start 0.08
      pretrace_end 0.01
      count 600
      error_bound 0.025
      nearest_count 5
      recursion_limit 1
      low_error_factor .5
      gray_threshold 0.0
      minimum_reuse 0.015
      brightness 1.0
      adc_bailout 0.01/2
//      normal on
    }
  #end
}
// ========================================
//  Default settings
// ========================================

// ========================================
//  Camera
// ========================================
#declare EyePos  = <0.0, 20.0, -40.0>;
#declare EyeLook = <0.0, 0.0,  -1.0>;
camera {
  location  EyePos
  direction 1.5*z
  right     x*image_width/image_height
  look_at   EyeLook
  angle 10
}

// ========================================
//  Light
// ========================================
light_source {
  80*y
  color rgb <1.0, 0.99, 0.98>*1  
  #if (use_area_light)
	area_light <10,0,0> <0,0,10> 20,20 circular orient jitter adaptive 2
  #end
  parallel 
  point_at 0
  rotate -x*25
  rotate  y*45
}

// ========================================
//  Sky
// ========================================
sky_sphere {pigment {rgb <0.97,0.98,0.99>}}
    
// ========================================
//  Ground
// ========================================    
#if (use_radiosity)
  light_group {
    plane {
      y,-1
	  texture {pigment {rgb 1} finish {ambient 0.01 diffuse 1}}
    }
  }
#else
    plane {
      y,-1
      texture {pigment {rgb 1} finish {ambient 0 diffuse 1}}
    }  
#end

// ========================================
//  Pebble texture (adapted from T_Stone8)
// ========================================        
#declare T_Pebble_a = texture {
  pigment {
    granite
    turbulence 0.6
    color_map {
      [0.000  color rgbt <0.729, 0.502, 0.451, 0.306>]
      [0.153  color rgbt <0.769, 0.686, 0.592, 0.792>]
      [0.398  color rgbt <0.843, 0.753, 0.718, 0.396>]
      [0.559  color rgbt <0.780, 0.667, 0.561, 0.976>]
      [0.729  color rgbt <0.741, 0.659, 0.576, 0.820>]
      [1.000  color rgbt <0.729, 0.502, 0.451, 0.306>]
    }
  }
}
#declare T_Pebble_b = texture {
  pigment {
    granite
    warp {turbulence 1.5}
    scale <5,1,1>
    color_map {
      [0.000 color rgbt <0.812, 0.812, 0.812, 0.835>]
      [0.216 color rgbt <0.745, 0.843, 0.835, 0.847>]
      [0.241 color rgbt <0.404, 0.337, 0.337, 0.463>]
    }
  }
}
#declare T_Pebble =
    texture {pigment {color rgb 1}}
    texture {T_Pebble_a scale <2, 3, 2> rotate <0, 0, -30>}
    texture {T_Pebble_b scale <5, 3, 4>  finish {phong 1 diffuse 1 /*phong_size 90*/}}
        

// ========================================
//  Pebble stone macro
// ========================================        
#macro spheric (rho,theta,phi)
  <rho*sin(theta)*sin(phi), rho*cos(theta), rho*sin(theta)*cos(phi)>
#end
#macro pebble (n)
  blob {
    threshold .5
    sphere {0, .75, .75}
    #local i = 0;
    #while (i< n)
      #local rho   = .25+.05*rand (rseed);
      #local theta = rand(rseed)*2*pi;
      #local phi   = rand(rseed)*2*pi;
      sphere {spheric(rho, theta, phi), .75, .75}
      #local i=i+1;
    #end
    scale <1,.3,1>
    translate -.7*y
  }
#end

// ========================================
//  Scene
// ========================================        
union {
  object {pebble(20) translate -2.75*x}
  object {pebble(20) translate -1.00*x translate .75*y}
  object {pebble(20) translate  1.00*x}
  object {pebble(20) translate  2.75*x}
  texture {
    T_Pebble
    normal {bumps .75 scale .01}
  }
}

