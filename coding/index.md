---
layout: page
order: 03
title: CODING
permalink: /coding/index.html
---

# Coding

You'll find below a collection of software, libraries or recipes I've coded
over several years. Unless stated otherwise, permission is granted to copy,
distribute and/or modify these software under the terms of the BSD
license. Most of these projects are also available from my
[**github**](https://github.com/rougier) page.



# Computational Neuroscience

## DANA

DANA is a python framework for distributed, asynchronous, numerical and
adaptive computing. The computational paradigm supporting the dana framework is
grounded on the notion of a unit that is a essentially a set of arbitrary
values that can vary along time under the influence of other units and
learning. Each unit can be connected to any other unit (including itself) using
a weighted link and a group is a structured set of such homogeneous units.

[**→ Article**](https://hal.archives-ouvertes.fr/hal-00718780)  
[**→ Documentation**](http://dana.loria.fr)  
[**→ GitHub repository**](https://github.com/rougier/ten-rules)  


## Neural field with finite propagation speed

In collaboration with Axel Hutt, we've been studying the spatio-temporal
activity propagation which obeys an integral-differential equation in two
spatial dimensions that involves a finite transmission speed,
i.e. distance-dependent delays and derived a fast numerical scheme that allow
to quickly simulate numerically such equations. This python script implements
this numerical integration using python, numpy and scipy library.

[**→ Article**](https://hal.archives-ouvertes.fr/inria-00533067)  
[**→ GitHub repository**](https://github.com/rougier/ten-rules)  


## Dynamic Self-Organizing Maps

In collaboration with Yann Boniface, we designed a variation of the
self-organising map where the time-dependency learning function has been
replaced. This allows for on-line and continuous learning on both static and
dynamic data distributions. The newly proposed algorithm does not fit the
magnification law and the vector density is not proportional to the density of
the distribution as in most vector quantisation algorithms.

[**→ Article**](https://hal.archives-ouvertes.fr/inria-00495827)  
[**→ GitHub repository**](https://github.com/rougier/dynamic-som)  


## Classical Artificial Neural Networks

Here are some standard neural networks written in python. They were made to be
simple and useful for students. Each script is self-contained and is around a
hundred of lines. Numpy is required for simulation and matplotlib for visualization.

* Perceptron
* Multi layer perceptron
* Elman recurrent network
* Jordan recurrent network
* Adaptive Resonance Theory
* Self organizing map
* Neural gas

[**→ GitHub repository**](https://github.com/rougier/neural-networks)


# Scientific Visualization

## Glumpy

Glumpy is a python/OpenGL library for the fast vizualization of numpy arrays,
(mainly two dimensional) that has been designed with efficiency in mind. If you
want to draw nice figures for inclusion in a scientific article, you'd better
use matplotlib. If you want to have a sense of what's going on in your
simulation while it is running, then maybe glumpy can help you.

[**→ Website**](http://glumpy.github.io)  
[**→ Documentation**](http://glumpy.readthedocs.org/en/latest/)  
[**→ GitHub repository**](https://github.com/glumpy/glumpy)  

## Gallery

My small alternative matplotlib gallery. If you want to contribute, clone the
gallery repository and submit a pull request to add a new example.

[**→ Website**]({{site.baseurl}}/coding/gallery/index.html)  
[**→ Github repository**](https://github.com/rougier/gallery)  


## Glipy

Glipy is an OpenGL IPython/Python terminal whose goal is to create a
comprehensive environment for interactive and exploratory computing. To support
this goal, glipy has two main components: an interactive Python terminal and an
architecture for embedding various graphical elements directly within the
terminal.

[**→ Website**]({{site.baseurl}}/coding/glipy)  
[**→ <i class="fa fa-file-archive-o"></i> Sources**]({{site.baseurl}}/coding/glipy/dist/glipy-beta.tar.gz)  

## Scigl

SciGL (Scientific OpenGL Visualization ToolKit) aims at facilitating the
development of scientific visualization by providing a set of C++ classes for
rapid prototyping of scientific visualization software. It has not been
designed as a library since the goal of SciGL is to try to offer a minimal set
of objects without the need for any kind of installation. A large number of
examples is provided to show how one can use parts of SciGL components to suit
its own needs.

[**→ Website**]({{site.baseurl}}/coding/scigl)  
[**→ <i class="fa fa-file-archive-o"></i> Sources**]({{site.baseurl}}/coding/software/scigl.tgz)

## Terminal visualization

Since modern terminals are able to handle up to 256 colors, it is thus quite
easy to visualize a 2-dimensional numpy array as long as it fits within the
terminal. It might come handy to quickly check how an array looks like.

[**→ <i class="fa fa-file-archive-o"></i> Sources**]({{site.baseurl}}/downloads/numpy_imshow.py)  


# Python

## Freetype python bindings

Freetype python provides bindings for the FreeType library. Only the high-level
API is bound.

[**→ GitHub repository**](https://github.com/rougier/freetype-py)  
[**→ Documentation**](http://freetype-py.readthedocs.org/en/latest/)  


## AntTweakBar python bindings

atb-python offers python bindings for the AntTweakBar library which is small
and easy-to-use C/C++ library that allows programmers to quickly add a light
and intuitive graphical user interface into graphic applications based on
OpenGL, DirectX 9 or DirectX 10 to interactively tweak their parameters
on-screen.

[**→ <i class="fa fa-file-archive-o"></i> Sources**]({{site.baseurl}}/downloads/atb-python.tgz)  


## Scientific Article using ReST

A modified rs2html.py to write a scientific article using the ReST format.

[**→ Website**]({{site.baseurl}}/coding/article/article.html)  
[**→ <i class="fa fa-file-archive-o"></i> Sources**]({{site.baseurl}}/coding/article/rst2html.py)  


## Glydget, a pyglet GUI toolkit

Glydget is a(nother) pyglet GUI toolkit dedicated to "debugging" or scientific
computing. It is far from a complete GUI system (like kytten or simplui) but
rather aims at a quick and fast solution for displaying/editing variables and
pressing buttons.

[**→ <i class="fa fa-file-archive-o"></i> Sources**]({{site.baseurl}}/downloads/glydget.tgz)


## Pyroom

Pyroom is a fullscreen editor written in Python and GTK featuring full screen
multidocument text editor, small set of shortcuts, simple help page for
shortcuts and different styles / colorsets available. More recent versions are
available at [pyroom.org](http://pyroom.org).

[**→ <i class="fa fa-file-archive-o"></i> Sources** (GTK)]({{site.baseurl}}/downloads/pyroom.py)  
[**→ <i class="fa fa-file-archive-o"></i> Sources** (Pyglet)]({{site.baseurl}}/downloads/pyroom-pyglet.tgz)  


## Wordle

Inspired by the wordle site, I made a quick try in python using cairo, numpy
and pyglet to get more or less the same result. The script allows you to save
the image as well as a clickable map to link each word to a specific link. Code
can be improved in a lot of different ways so feel free to modify it.

[**→ <i class="fa fa-file-archive-o"></i> Sources**]({{site.baseurl}}/downloads/wordle.py)  


# Miscellaneous

## Freetype-GL

OpenGL/FreeType is a simple engine for displaying a unicode text using a
(single) vertex buffer. The idea is simply to tightly pack every necessary
glyphs into a single texture and to generate a single vertex buffer to draw the
text.

[**→ GitHub repository**](https://github.com/rougier/freetype-gl)

## Emacs octicons

The octicon font by github (https://github.com/styleguide/css/7.0) provides
some nice icons embedded in a font. This package gives an easier access to them
and must be used with the relevant face (octicons).

[**→ GitHub repository**](https://github.com/rougier/emacs-octicons)

## Emacs powerline

Inspired by the VIM powerline, I've coded a small powerline-like for
emacs. Original sources are available from the emacswiki. Since then, Donald
Ephraim has rewritten this package and his version uses many of the techniques
in the original but tries to make it easier to add new things.

[**→ Emacs wiki**](http://www.emacswiki.org/emacs/PowerLine)


## Hills screensaver

[Hills screensaver]({{site.baseurl}}/downloads/hills-linux.tgz) let you gently drift over
rolling grassy hills, using ARB multitexture, heightmap and lightmap. It
requires SDL and OpenGL and should work with xscreensaver and
gnome-screensaver. Chris Kent has ported hills to OSX and made a screensaver
out of it (sources). Nick Ziztmann has since released
[an updated version](https://github.com/nickzman/hills).

## GNUBiff

GNUBiff is a mail notification program that checks for mail and displays
headers when new mail has arrived. GNUbiff features include multiple mailbox
support, pop3, apop, imap4, mh, qmail and mailfile support, SSL & certificates
support, GNOME & GTK support and many other features.

[**→ Website**](http://gnubiff.sourceforge.net)


# Outdated

## 3615 Gen 4 challenge

There was a demo challenge in 1990 for a French Magazine (Génération 4). Here
is my [modest contribution](http://pouet.net/prod.php?which=26985) and a
[direct link]({{site.baseurl}}/downloads/wildchip.prg) to the program. You'll need an Atari ST
emulator if you want to see it.

## GFA Punchs

There was a challenge in the late eighties to write programs in less than 20
lines of GFA basic. They were published in a French magasine (STMag). Here is
[disk image]({{site.baseurl}}/downloads/Punchs.msa) (.msa) with a lot of them. You can also
browse it [online]({{site.baseurl}}/downloads/Punchs/).
