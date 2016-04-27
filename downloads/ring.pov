// Copyright (C) 2003 Nicolas P. Rougier (rougier@loria.fr)
// Ring & caustics
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
// File: ring.pov
// Vers: 3.5
// Desc: A ring with caustics
// Date: 12/2003
// Auth: Nicolas Rougier
// Cmd : povray +Iring.pov +w800 +h600 +fn +am2 +a0.01 +P
// ---------------------------------------------------------------------------
#version 3.5;
#include "colors.inc"
#include "shapes.inc"
#include "glass.inc"

// ========================================
//  Notes
// ========================================

// ========================================
//  Switches
// ========================================
#declare use_photon = 1;
#declare show_glass = 1;


// ========================================
//  Settings
// ========================================
global_settings{
  assumed_gamma 1.0
  max_trace_level 25
  #if (use_photon)
    photons {
      spacing .01
      autostop 0
      gather 0, 200
    }
  #end
  radiosity {
    pretrace_start 0.08
    pretrace_end   0.01
    count 600
    error_bound .25
    nearest_count 8
    recursion_limit 1
    gray_threshold 0
    minimum_reuse 0.015
    brightness 1.0
    adc_bailout 0.01/2
  }
}

// ========================================
//  Camera
// ========================================
#include "screen.inc"
#declare EyePos = <0,30,-50>;
#declare EyeLook = <0,0,0>;
#declare EyeAngle = 40;
Set_Camera(EyePos, EyeLook, EyeAngle)


// ========================================
//  Image information
// ========================================
#declare border_top     = 36;
#declare border_bottom  = 18;
#declare t_border = texture {pigment {rgb 0 transmit .75} finish {ambient 1 diffuse 0}}
#declare t_text   = texture {pigment {rgb 1 } finish {ambient 1 diffuse 0}}

Screen_Plane (t_border, 0.01, <0, 1-border_top/image_height>, <1,1.01>)
Screen_Plane (t_border, 0.01, <0,-0.01>, <1, border_bottom/image_height>)

#declare _copyright = text {
  ttf "arial.ttf", "Copyright (c) 2003 Nicolas Rougier", 0.1, <0,0>
  scale 0.02 texture {t_text}
} 
Screen_Object (_copyright, <1,0>, <0.005,0.005>, true, 0.01 ) 

#declare _povray = text {
  ttf "arial.ttf", "Persistence Of Vision Raytracer", 0.1, <0,0>
  scale 0.025 texture {t_text}
} 
Screen_Object (_povray, <0,1>, <0.01,0.01>, true, 0.01 ) 

#declare _http = text {
  ttf "arial.ttf", "http://www.povray.org", 0.1, <0,0>
  scale 0.025 texture {t_text}
} 
Screen_Object (_http, <1,1>, <0.01,0.01>, true, 0.01 ) 

#declare _version = text {
  ttf "arial.ttf", "Official release 3.5c", 0.1, <0,0>
  scale 0.02 texture {t_text}
} 
Screen_Object (_version, <0,1>, <0.01,0.035>, true, 0.01 ) 

// ========================================
//  Light
// ========================================
light_source {
  100*y rgb <.75,1,1>*1.1
  fade_distance 100 fade_power 2
  area_light <100, 0, 0> <0, 0, 100> 20,20  adaptive 0 jitter circular orient
  rotate -x*55
  rotate -y*45
  photons {reflection on area_light}
}
background {rgb 0.025}

// ========================================
//  Floor
// ========================================
plane {
  y,-2
  pigment {rgb .7}
  normal {bumps .02 scale .5}
  finish {ambient 0 diffuse 1}
}

// ========================================
//  The ring
// ========================================
union{
  torus {11, 1 translate  y}
  torus {11, 1 translate -y}
  cylinder {-y, y, 12 open}
  cylinder {-y, y, 10 open}
  pigment {rgb .1}
  finish {
    reflection .9
    specular 3
    roughness 0.0025
    ambient 0
    diffuse 1
  }
  photons {target reflection on}
}

