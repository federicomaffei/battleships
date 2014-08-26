BATTLESHIPS:

1) Ship:

- is either a carrier (length 5), a battleship (length 4), a destroyer (*2) (length 3), a patrol boat (length 2).
- is a made by coordinates that can be hit by the opponent.
- must sink when hit all over its length.

2) Grid:

- defines a 10x10 square.
- identifies positions by two coordinates.
- shows to the defending player its ships and the opponent shots, and only the shots to the attacking player.

3) Coordinate:

- stores all the coordinate related to the ships.
- translates all the coordinates entered by the user to indexes understandable by the application.

4) Player:

- has two grids, one to keep ships, one to show hits and misses.
- has 5 ships.
- places ships on the home grid.
- can be either active (attacking) and inactive (defending).

Collaborators: Ship, Grid, Coordinate

5) BattleShips:

- handles a new BattleShips game with two Player(s).
- allow a player to place ship(s) on his board.
- allow a player to shoot at the opponents board.
- report if a player has won the game.

Collaborators: Player