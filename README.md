BattleShips
====================

BattleShips is the Week 4 project I worked on at [Makers Academy](http://www.makersacademy.com).
The main aim of the project is creating an application which allows to play the famous [game](http://en.wikipedia.org/wiki/Battleship_\(game\)).

The domain model, as presented to us, can be described as so:

> Battleships (or Battleship) is a game where each player has a board upon which they can place a number of ships. The boards are 10x10 two dimensional grid.
>After each player has placed their ships on their own board they take turns to shoot on the opponents board. In each round, each player takes a turn to announce a target square in the opponent's grid which is to be shot at. The opponent announces whether or not the square is occupied by a ship, and if it is a hit they mark this on their own primary grid. The attacking player notes the hit or miss on their own tracking grid, in order to build up a picture of the opponent's fleet.
>When all of one player's ships have been hit the game finishes and the player who has ships remaining is the winner.

====================

The feature I implemented via TDD are:

  1. A Ship object, which contains coordinates, and can be hit and sunk.

  2. A Grid object, which allows the player to see their shots and their ships (if they are defending in that round).

  3. A Coordinate object, which is able to store and translate the coordinates needed to place the ships and target them.

  4. A Player object, which has 5 Ships, 2 Grids and 2 Coordinate systems. A player can be either active or inactive, and can place ships.

  5. A BattleShips object, which has 2 Players, and contains all the application logic and user interaction.

* The programming languages and technologies I used are:

  * Ruby
  * Rspec

====================

How to run the application:

  * From command line enter: 
```bash
git clone git@github.com:federicomaffei/battleships.git
cd battleships
ruby lib/battleships_ruby_app.rb
```

How to test the application:

  * From command line enter:
```bash
git clone git@github.com:federicomaffei/battleships.git
cd battleships
rspec
```
====================
Possible future adds to the features:

  * Throw exception messages when the user input is not consistent for coordinates and shots.

  * Add a choice at each shot so that the user can see the attacking grid only if he/she wants.


