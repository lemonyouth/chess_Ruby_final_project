# Chess Game in Ruby

Welcome to the Chess Game in Ruby! This project provides a simple implementation of a chess game using Ruby. 

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Setup](#setup)
- [Usage](#usage)
- [Save and Load](#save-and-load)

## Introduction

This chess game is designed to be a flexible and extendable project for learning and experimenting with Ruby programming. It includes a variety of classes representing different chess pieces, a chessboard, and a game manager to handle the flow of the game.

## Features

- Object-oriented design with classes for each chess piece (Pawn, Rook, Knight, Bishop, Queen, King).
- A Board class to manage the state of the chessboard and validate moves.
- A Game class to orchestrate the overall flow of the game, including player turns and game conditions.

## Setup

To get started, follow these steps:

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/lemonyouth/chess-game-ruby.git
2. Navigate to the project directory:
   cd chess-game-ruby

3. Run the game:
    ruby main.rb

## Usage

- Follow the on-screen instructions for player turns.
- Enjoy playing chess with your friends!

## Save and Load
You can save the current game state to a file and reload it later. Use the following methods:

- To save the game:
    game.save_to_file('saved_game.yaml')
- To load a saved game:
    loaded_game = Game.new
    loaded_game.load_from_file('saved_game.yaml')


