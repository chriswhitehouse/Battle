# Battle
A small 'battle' web application game.

## Motivation
A project to test the ability to pair program, TDD, OOD, in the web environment. Building an understanding of http request-response cycles, and MVC.

## Build status
Partially completed.

TO DO:

* Switching Turns
* Multiplayer
* Losing & Winning
* Killing the Global Variable

## Screenshots
![Sign In](https://github.com/chriswhitehouse/Battle/blob/main/Screenshot%202020-12-12%20at%2017.19.45.png)
![Play](https://github.com/chriswhitehouse/Battle/blob/main/Screenshot%202020-12-12%20at%2017.19.59.png)
![Attack](https://github.com/chriswhitehouse/Battle/blob/main/Screenshot%202020-12-12%20at%2017.20.19.png)
![Play Again](https://github.com/chriswhitehouse/Battle/blob/main/Screenshot%202020-12-12%20at%2017.20.33.png)

## Tech/framework used
Ruby, Sinatra web framework. With Rpsec unit testing and Capybara feature tests.

## Features
Attack the apposing player to reduce their health points.

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
