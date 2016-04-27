// Tiled sphere macro
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
// File: tiled-sphere.inc
// Vers: 3.5
// Desc: Tile objects around a sphere with regular spacing
// Date: 08/2003
// Auth: Nicolas Rougier
// Cmd : 
// ---------------------------------------------------------------------------

// ========================================
//  Spheric to cartesian conversion macro
//   (angle in degrees)
// ========================================
#macro spheric_d (rho,theta,phi)
  <rho*sind(theta)*sind(phi), rho*cosd(theta), rho*sind(theta)*cosd(phi)>
#end

// ====================================================
//  Tile a sphere with object and regular spacing
//   object dimensions are taken from its bounding box
// ====================================================
//  _size  : Radius of the sphere
//  _object: Object to be used as tile
//  _msize : Size of the mortar as a percentage of _object size
//  _lshift: Control the placement of object along lateral axis
//            0 for perfect alignment, .5 for "perfect mis-alignment"
//  _hdev  : Standard deviation of altitude of object on the sphere
//  theta_start, theta_end, phi_start, phi_end: control sphere "completness"
//  _seed  : any number you like
#macro tiled_sphere (_size, _object, _msize, _lshift, _hdev, theta_start, theta_end, phi_start, phi_end, _seed)
// Get size of the object
#local Min = <0,0,0>;
#local Max = <0,0,0>;
Extents (_object, Min, Max)

// Center object and make it lie on ground (y=0)
#local _tile = object {_object translate -Min-<Max.x-Min.x, 0, Max.z-Max.z>/2}

// Get size of the object
#local _tile_size = Max-Min;

#local st          = seed (_seed);
#local shift       = 0;
#local theta       = theta_start;
#local theta_step  = 360/(2*pi*_size/_tile_size.z);
union {
  #while (theta < theta_end)
    #local ring_radius      = _size*abs(sind(theta));
    #local ring_perimeter   = 2*pi*ring_radius;
    #if (int (ring_perimeter/(_tile_size.x*2)) = 0)
      #local phi_step       = 361;
    #else
      #local phi_step       = 180 / int (ring_perimeter/(_tile_size.x*2));
    #end
    #local shift            = shift + _lshift;
    #local shift            = shift - int(shift);
    #local phi              = phi_start + shift*phi_step;      
    #while (phi <= phi_end)
      object {
	_tile
	scale (1-_msize)
	translate y*(_size + _tile_size.y*_hdev*rand(st))
	rotate <theta, phi, 0>
      }
      #local phi = phi+phi_step;
    #end
    #local theta = theta+theta_step;
  #end
}
#end // macro tiled_sphere
