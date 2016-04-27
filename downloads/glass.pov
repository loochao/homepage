// Copyright (C) 2003 Nicolas P. Rougier (rougier@loria.fr)
// Glass of water
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
// File: glass.pov
// Vers: 3.5
// Desc: A glass of water
// Date: 12/2003
// Auth: Nicolas Rougier
// Cmd : povray +Iglass.pov +w1000 +h500 +fn +am2 +a0.1 +P
// ---------------------------------------------------------------------------
#version 3.5;
#include "colors.inc"
#include "shapes.inc"
#include "glass.inc"


// ========================================
//  Notes
// ========================================

// ========================================
//  Switches & colors
// ========================================
#declare use_photon = 1;
#declare show_glass = 1;
#declare C_Sun       = <255,235,197>/255*1.7;
#declare C_SkyTop    = <132,164,255>/255;
#declare C_SkyBottom = <165,185,251>/255;

// ========================================
//  Settings
// ========================================
global_settings {
  assumed_gamma 1
  max_trace_level 100
  #if (use_photon)
    photons {
      spacing .005
      autostop 0
    }
  #end
  radiosity {
    pretrace_start 0.08
    pretrace_end   0.02
    count 600
    error_bound .1
    nearest_count 8
    recursion_limit 1
    gray_threshold 0
    minimum_reuse 0.015
    brightness 1.0
    adc_bailout 0.01/2
  }
}

// ========================================
//  Default settings
// ========================================
#default {
  texture {
    finish {
      ambient 0
      diffuse 1
    }
  }
}

// ========================================
//  Camera
// ========================================
#include "screen.inc"
#declare EyePos  = <12.0, 20.0, -25.0>;
#declare EyeLook = <0.0, 5.0,  0.0>;
#declare EyeAngle = 35;
Set_Camera(EyePos, EyeLook, EyeAngle)

// ========================================
//  Image information
// ========================================
#declare border_top     = 36;
#declare border_bottom  = 18;
#declare t_border  = texture {pigment {rgb 0 transmit .75} finish {ambient 1 diffuse 0}}
#declare t_text    = texture {pigment {rgb 1 } finish {ambient 1 diffuse 0}}

Screen_Plane (t_border, 0.01, <0, 1-border_top/image_height>, <1,1.01>)
Screen_Plane (t_border, 0.01, <0,-0.01>, <1, border_bottom/image_height>)

#declare _copyright = text {
  ttf "arial.ttf", "Copyright (c) 2003 Nicolas Rougier", 0.1, <0,0>
  scale 12/image_height texture {t_text}
} 
Screen_Object (_copyright, <1,0>, <12/image_width, 3/image_height>, true, 0.01 ) 

#declare _povray = text {
  ttf "arial.ttf", "Persistence Of Vision Raytracer", 0.1, <0,0>
  scale 15/image_height texture {t_text}
} 
Screen_Object (_povray, <0,1>, <12/image_width, 6/image_height>, true, 0.01 ) 

#declare _http = text {
  ttf "arial.ttf", "http://www.povray.org", 0.1, <0,0>
  scale 15/image_height texture {t_text}
} 
Screen_Object (_http, <1,1>, <12/image_width, 6/image_height>, true, 0.01 ) 

#declare _version = text {
  ttf "arial.ttf", "Official release 3.5c", 0.1, <0,0>
  scale 12/image_height texture {t_text}
} 
Screen_Object (_version, <0,1>, <12/image_width, 21/image_height>, true, 0.01 ) 


// ========================================
//  Sky
// ========================================
#macro GammaColor (Color,Gamma)
  rgb <pow(Color.red,Gamma),pow(Color.green,Gamma),pow(Color.blue,Gamma)>
#end
sky_sphere {
  pigment {
    function {min (1, max (0, y))}
    poly_wave 0.6
    color_map {
      [0 rgb C_SkyBottom]
      [1 rgb C_SkyTop]
    }
  }
}

// ========================================
//  Sun light
// ========================================
light_source {
  1000*y
  rgb C_Sun
  fade_power 2 fade_distance 1000
  area_light 10*x 10*z  5, 5 jitter adaptive 1 circular orient
  rotate -x*55
  rotate  y*45
  looks_like {
    sphere {
      0, 10 hollow
      pigment{rgbt 1} finish {diffuse 0 ambient 0} interior {media {emission 1000}}
    }
  }  
  #if (use_photon)
    photons {
      refraction on
      reflection on
    }
  #end
}


// ========================================
//  Plank floor
// ========================================
#declare wood_grain = pigment {
  wrinkles
  warp {cylindrical orientation y dist_exp 1}
  warp {turbulence 1.25}
  scale <.5,1,30> 
  warp {turbulence .25}
  scale <1,1,10> 
  warp {
    black_hole <0, 0.5, 0>, 1
    falloff 2
    strength 1.5
    repeat 7
    turbulence 2
    inverse
  }
}

#declare wood_normal = function {
  pigment {
    wrinkles
    warp {cylindrical orientation y dist_exp 1}
    warp {turbulence 1.25}
    scale <.5,1,30> 
    warp {turbulence .25}
    scale <1,1,5> 
    color_map {[0 rgb 0.0] [1 rgb 1.0]}
  }
}

#declare rseed = seed(3);
#macro plank (_width, _length, _thickness)
  #declare h = 1.15+rand(rseed)*.1;
  #declare woodmap = color_map {
    [0.00 GammaColor (<0.949, 0.792, 0.514 >,h)]
    [0.30 GammaColor (<0.855, 0.651, 0.376 >,h)]
    [0.60 GammaColor (<0.831, 0.596, 0.275 >,h)]
    [0.90 GammaColor (<0.620, 0.447, 0.204 >,h)]
  }
  #declare t_wood = texture {
    pigment {wood_grain color_map {woodmap} ramp_wave}
    normal {function{wood_normal(x,y,z).grey*.5}}
    finish {specular .1}
  }
  object {
    Round_Box_Union (<-_width/2, 0, -_length/2> <_width/2, _thickness, _length> .1)
    texture {t_wood scale .5 translate 100+rand(rseed)*100000 rotate x*(1+rand(rseed))}
  }
#end

#declare st=seed(3);
#declare n=16;
#declare i=0;
#while (i<n)
  object {
    plank (4, 40, 1)
    translate <(i-n/2)*4, rand(st)*.05, 0>
  }
  #declare i=i+1;
#end
plane {y,0 pigment {rgb 0}}

// ========================================
//  Glass of water
//   by Jaime Vives Piqueres
//      http://www.ignorancia.org
//  Slightly modified by me (material)
// ========================================
// ===== Glass material
#declare m_glass = material {
  texture{
    pigment {White*.99+Green*.01 filter 0.999}
    normal {bumps .1 scale 4}
    finish {
      diffuse 0
      ambient 0
      specular 1
      roughness 0.005
      reflection {.01, .9 fresnel}
      conserve_energy
    }
  }
  interior {ior 1.5 fade_distance 2 fade_power 1000 fade_color rgb<0,0.1,0.05>}
}

// ===== Water material
#declare m_water = material {
  texture {
    pigment {White filter 0.999}
    normal {waves .1}
    finish {
      reflection {.1, 1 fresnel}
      conserve_energy
      diffuse 0
      ambient 0
    }
  }
  interior {ior 1.3}
}

// ===== Glass hole
#declare glass_hole = merge {
  cone {<0,.9,0>, 2.5, <0,12.1,0>, 2.8}
  intersection {
    sphere {0, 1 scale <2.5,.25,2.5>}
    plane {y, 0}
    translate 1*y
  }
  hollow
}
// ===== Simple glass
#declare glass = merge {
  difference {
    cone {<0,0,0>, 2.8, <0,12,0>, 3}
    object {glass_hole}
  }
  intersection {
    merge {
      torus {2.3, .5}
      cylinder {<0,-.5,0>, <0,.5,0>, 2.3}
    }
    plane {y, 0.0001}
  }
  intersection {
    torus {2.9, .1 scale <1,.15,1>}
    plane {y, 0 inverse}
    translate 12*y
  }
  hollow
  translate .5*y
}

// ===== Liquid volume (water in this case)
#declare glass_content = difference{
  intersection {
    object {glass_hole}
    plane {y, 9}
  }
  merge {
    torus {2.3, 0.4}
    cylinder {<0,-.4,0>, <0,.4,0>, 2.3}
    translate 9.2*y
  }
  hollow
}

// Join it all to make the glass of water
#if (show_glass)
  union {
    object {glass material {m_glass}}
    object {glass_content material {m_water} scale .999999}
    #if (use_photon)
      photons {
	target
	refraction on
	reflection on
	collect off
      }
    #end
    scale .5
    translate <-3,1,0>
  }
#end


