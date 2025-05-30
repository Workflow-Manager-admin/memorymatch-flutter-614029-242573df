# Memory Match Game

A Flutter implementation of the classic memory card matching game.

## Features

- Card flipping mechanics with smooth animations
- Score tracking (moves and matches)
- Timer to track game duration
- Multiple difficulty levels
- Clean, minimal UI design

## Requirements

- Flutter SDK
- For Linux desktop:
  - GTK3 development libraries
  - A display server (X11 or Wayland)
  - Required packages: `ninja-build`, `clang`, `cmake`, `libgtk-3-dev`

## Running the App

1. Ensure all dependencies are installed:
   ```bash
   sudo apt-get install ninja-build clang cmake libgtk-3-dev
   ```

2. Run the app:
   ```bash
   flutter run
   ```

Note: This app requires a graphical display to run. It cannot run in headless environments.

## Game Instructions

1. Click on cards to flip them and reveal their symbols
2. Try to match pairs of identical symbols
3. Complete the game by matching all pairs
4. Track your progress with the moves counter and timer
5. Choose different difficulty levels for more challenge

## Color Scheme

- Primary: #1976D2 (Blue)
- Secondary: #FFFFFF (White)
- Accent: #FFC107 (Amber)

## Architecture

The app follows a clean architecture with:
- Models: `MemoryCard`, `GameState`
- Widgets: `GameBoard`, `MemoryCardWidget`, `GameHeader`, `GameControls`
- Screens: `MemoryGameScreen`

Each component is designed to be modular and maintainable, with clear separation of concerns.
