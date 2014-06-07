BATTLESHIPS:

1) Ship:

- is either a carrier (length 5), a battleship (length 4), a destroyer (*2) (length 3), a patrol boat (length 2)
- knows how many times it has been hit
- must be able to sink when hit all over its length

2) Grid:

- defines a 10x10 square
- identifies positions by two coordinates
- return hits and misses
- can contain ships
- stores the position of the ships

Collaborators: Ships

3) Board:

- contains two grids
- allows the player to see its ships on its board
- allows the player to see what he has hit or missed from the opponent's board

Collaborators: Grid

3) Player:

- has two grids, one to keep ships, one to show hits and misses
- has 5 ships
- places ships on the home grid
- calls shots on the opponent's grid
- looks into the opponent's grid to see which are the hits or misses

Collaborators: Ship, Grid

4) Game:

- initialise a new Game with two Player(s)
- allow a player to place ship(s) on his board
- allow a player to look into his opponents board to see where he shot at, but not seeing the ship(s)
- allow a player to shoot at the opponents board
- report if a player has won

Collaborators: Player