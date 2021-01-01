# Battle
A small 'battle' web application game.

## Motivation
A project to test the ability to pair program, TDD, OOD, in the web environment. Building an understanding of http request-response cycles, and MVC.

## Build status
[![Build Status](https://travis-ci.com/chriswhitehouse/Battle.svg?branch=main)](https://travis-ci.com/chriswhitehouse/Battle)

TO DO:

* Switching Turns
* Multiplayer
* Losing & Winning
* Killing the Global Variable

## Code style
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

## Screenshots
![Mock Up](https://github.com/chriswhitehouse/Battle/blob/main/screenshots/battle_final_mockup.png)
![Sign In](https://github.com/chriswhitehouse/Battle/blob/main/screenshots/Screenshot%202020-12-12%20at%2017.19.45.png)
![Play](https://github.com/chriswhitehouse/Battle/blob/main/screenshots/Screenshot%202020-12-12%20at%2017.19.59.png)
![Attack](https://github.com/chriswhitehouse/Battle/blob/main/screenshots/Screenshot%202020-12-12%20at%2017.20.19.png)
![Play Again](https://github.com/chriswhitehouse/Battle/blob/main/screenshots/Screenshot%202020-12-12%20at%2017.20.33.png)

## Tech/framework used
Ruby, Sinatra web framework. With Rpsec unit testing and Capybara feature tests.

## Features

### User Stories

#### User Story 1
```
As two Players,
So we can play a personalised game of Battle,
We want to Start a fight by entering our Names and seeing them
```
| Objects | Messages |
|---|---|
| Player | name |

#### User Story 2
```
As Player 1,
So I can see how close I am to winning
I want to see Player 2's Hit Points
```
| Objects | Messages |
|---|---|
| player_2 | hp |
#### User Story 3
```
As Player 1,
So I can win a game of Battle,
I want to attack Player 2, and I want to get a confirmation
```
| Objects | Messages |
|---|---|
| Game | attack(player_2) |
#### User Story 4
```
As Player 1,
So I can start to win a game of Battle,
I want my attack to reduce Player 2's HP by 10
```
| Objects | Messages |
|---|---|
| player_2 | receive_damage |
#### User Story 5
```
As two Players,
So we can continue our game of Battle,
We want to switch turns
```
| Objects | Messages |
|---|---|
| Game | switch_turns |
#### User Story 6
```
As Player 1,
So I can see how close I am to losing,
I want to see my own hit points
```
| Objects | Messages |
|---|---|
| player_1 | hp |
#### User Story 7
```
As Player 1,
So I can lose a game of Battle,
I want Player 2 to attack me, and I want to get a confirmation
```
| Objects | Messages |
|---|---|
| Game | attack(player_1) |
#### User Story 8
```
As Player 1,
So I can start to lose a game of Battle,
I want Player 2's attack to reduce my HP by 10
```
| Objects | Messages |
|---|---|
| player_1 | receive_damage |
#### User Story 9
```
As a Player,
So I can Lose a game of Battle,
I want to see a 'Lose' message if I reach 0HP first
```

## Code Example
Controller:

``` ruby
require "sinatra/base"
require "./lib/player"
require "./lib/game"

class Battle < Sinatra::Base
  enable :sessions

  get "/" do
    erb :index
  end

  post "/names" do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect "/play"
  end

  get "/play" do
    @game = $game
    erb :play
  end

  get "/attack" do
    @game = $game
    @game.attack(@game.player_2)
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
```


## Installation
Run `bundle` in the terminal to install necessary gems from the Gemfile.

## Tests
Feature tests:

* see players names renders on screen
* Player 1 can see Player 2 Hit points
* reduce Player 2 HP by 10

Unit tests:

Player:
* should return its name
* returning the HP
* #Receive_damage

Game:
* #player_1, retrieves the first player
* #player_2, retrieves the second player
* #Attack, damages the player

## How to use?
Run `rackup` from the command line. Enter player names. Player 1 can attack player 2.
