# MATLAB Minesweeper Game 🟦💣

A fully functional Minesweeper game implemented in MATLAB with a graphical user interface.

## Features

- **Multiple Difficulty Levels**: Choose from different difficulty settings
- **Sound Effects**: Includes audio feedback for various game actions
  - Click sounds
- **Interactive GUI**: Easy-to-use graphical interface
- **Game Instructions**: Built-in help system
- **Restart Functionality**: Restart games at any time

## Files Overview

- `main.m` - Main entry point for the game
- `showInstructions.m` - Displays game instructions and start screen
- `getDifficulty.m` - Handles difficulty selection
- `startGame.m` - Initializes a new game
- `generateMinefield.m` - Creates the minefield layout
- `drawGameBoard.m` - Renders the game board
- `handleClick.m` - Processes user clicks on the board
- `revealZeros.m` - Handles revealing empty cells and adjacent cells
- `assignMineCounts.m` - Calculates numbers for each cell
- `updateGameBoard.m` - Updates the visual game board
- `endGame.m` - Handles game over scenarios
- `restartGame.m` - Resets the game for a new round
- `playSound.m` - Manages sound effects
- Audio files: `click.mp3`, `first.wav`, `flag.wav`, `mine.wav`, `win.wav`

## How to Run

1. Make sure you have MATLAB installed
2. Navigate to the project directory
3. Run the main script:
   ```matlab
   main
   ```
4. Follow the on-screen instructions to play

## How to Play

- Left-click to reveal a cell
- Right-click to flag/unflag a cell as a mine
- Numbers indicate how many mines are adjacent to that cell
- Reveal all non-mine cells to win
- Click on a mine and you lose!

## Requirements

- MATLAB (tested with R2024b)
- Audio support for sound effects

## Installation

1. Clone this repository
2. Open MATLAB
3. Navigate to the project folder
4. Run `main.m`

Enjoy playing Minesweeper! 🎯
