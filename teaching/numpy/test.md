# Numpy tutorial

[![](https://zenodo.org/badge/doi/10.5281/zenodo.28817.png)](http://dx.doi.org/10.5281/zenodo.28817)

Sources are available from [github](https://github.com/rougier/numpy-tutorial).

All code and material is licensed under a [Creative Commons
Attribution-ShareAlike 4.0](http://creativecommons.org/licenses/by-sa/4.0).

Tutorial can be read at
<http://www.labri.fr/perso/nrougier/teaching/numpy/numpy.html>

See also:

* [Matplotlib tutorial](http://www.labri.fr/perso/nrougier/teaching/matplotlib/matplotlib.html)
* [100 Numpy exercices](http://www.labri.fr/perso/nrougier/teaching/numpy.100/index.html)

## Introduction

NumPy is the fundamental package for scientific computing with Python.
It contains among other things:

* a powerful N-dimensional array object
* sophisticated (broadcasting) functions
* tools for integrating C/C++ and Fortran code
* useful linear algebra, Fourier transform, and random number capabilities

Besides its obvious scientific uses, NumPy can also be used as an efficient
multi-dimensional container of generic data. Arbitrary data-types can be
defined and this allows NumPy to seamlessly and speedily integrate with a wide
variety of projects. We are going to explore numpy through a simple example,
implementing the Game of Life.

## The Game of Life

Numpy is slanted toward scientific computing and we'll consider in this section
the [game of life](http://en.wikipedia.org/wiki/Conway's_Game_of_Life) by John
Conway which is one of the earliest example of cellular automata (see figure
below). Those cellular automaton can be conveniently considered as array of
cells that are connected together through the notion of neighbours.  We'll show
in the following sections implementation of this game using pure python and
numpy in order to illustrate main differences with python and numpy.

![**Figure 1** Simulation of the game of life.](figures/game-of-life.png)

This is an excerpt from
[wikipedia](http://en.wikipedia.org/wiki/Cellular_automaton) entry on Cellular
Automaton.

  The Game of Life, also known simply as Life, is a cellular automaton devised
  by the British mathematician John Horton Conway in 1970. It is the best-known
  example of a cellular automaton. The "game" is actually a zero-player game,
  meaning that its evolution is determined by its initial state, needing no
  input from human players. One interacts with the Game of Life by creating an
  initial configuration and observing how it evolves.

  The universe of the Game of Life is an infinite two-dimensional orthogonal
  grid of square cells, each of which is in one of two possible states, live or
  dead. Every cell interacts with its eight neighbours, which are the cells
  that are directly horizontally, vertically, or diagonally adjacent. At each
  step in time, the following transitions occur:

  1. Any live cell with fewer than two live neighbours dies, as if by
     needs caused by underpopulation.
  2. Any live cell with more than three live neighbours dies, as if
     by overcrowding.
  3. Any live cell with two or three live neighbours lives, unchanged, to
     the next generation.
  4. Any dead cell with exactly three live neighbours becomes a
     live cell.

The initial pattern constitutes the seed of the system. The first generation
is created by applying the above rules simultaneously to every cell in the seed
– births and deaths happen simultaneously, and the discrete moment at which
this happens is sometimes called a tick.  (In other words, each generation is a
pure function of the one before.)  The rules continue to be applied repeatedly
to create further generations.

We'll first use a very simple setup and more precisely, we'll use the
[glider](http://en.wikipedia.org/wiki/Glider_(Conway's_Life)) pattern that is
known to move one step diagonally in 4 iterations as illustrated below:

This property will help us debug our scripts.

### The way of python

**Note**: We could have used the more efficient
          [python array interface](http://docs.python.org/2/library/array.html)
          but people may be more familiar with the list object.

In pure python, we can code the Game of Life using a list of lists
representing the board where cells are supposed to evolve:

    >>> Z = [[0,0,0,0,0,0],
             [0,0,0,1,0,0],
             [0,1,0,1,0,0],
             [0,0,1,1,0,0],
             [0,0,0,0,0,0],
             [0,0,0,0,0,0]]

This board possesses a `0` border that allows to accelerate things a bit
by avoiding to have specific tests for borders when counting the number
of neighbours. First step is to count neighbours:

```
def compute_neigbours(Z):
    shape = len(Z), len(Z[0])
    N  = [[0,]*(shape[0])  for i in range(shape[1])]
    for x in range(1,shape[0]-1):
        for y in range(1,shape[1]-1):
        N[x][y] = Z[x-1][y-1]+Z[x][y-1]+Z[x+1][y-1] \
                + Z[x-1][y]            +Z[x+1][y]   \
                + Z[x-1][y+1]+Z[x][y+1]+Z[x+1][y+1]
    return N
```

To iterate one step in time, we then simply count the number of neighbours for
each internal cell and we update the whole board according to the 4 rules:

```
def iterate(Z):
    N = compute_neighbours(Z)
    for x in range(1,shape[0]-1):
        for y in range(1,shape[1]-1):
             if Z[x][y] == 1 and (N[x][y] < 2 or N[x][y] > 3):
                 Z[x][y] = 0
             elif Z[x][y] == 0 and N[x][y] == 3:
                 Z[x][y] = 1
    return Z
```

*Note**: The `show` command is supplied witht he script.

