# ASP satisfiability solver for Pou Connect

## Overview

This repository contains an implementation of an ASP (Answer Set Programming) satisfiability solver for Pou Connect, a puzzle game. The game aims to connect all the cells of different colors in a given grid. The solver is written in the Clingo programming language and is designed to find a solution to the given Pou Connect puzzle configurations.

## Rules and constraints

The solver enforces various constraints and rules to ensure the generated solution is valid according to the Pou Connect puzzle rules. These include:
- No cell can be painted in two different colors (no overlapping paths).
- No cell can be reachable by itself (no cycles).
- All cells must be connected to some other cell.
- A valid solution must adhere to initial and final cell specifications (the final cell of a path must be reachable by the initial cell of the same path).

## Example usage

```bash
clingo main.lp puzzle_input.lp
```

The solver will output the solution in the form of paths from the initial cell to the final cell for each color. The solution will be displayed in the terminal.

Replace `puzzle_input.lp` with the desired input file. See examples in the `examples` folder. Feel free to experiment with different grid sizes and color configurations to test the solver's capabilities.
