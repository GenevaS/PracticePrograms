##-------------------------------------------------------------##
## Text-based Battleship
## G. Smith
##-------------------------------------------------------------##
## Implements some functions that are required to play a game
## of battleship against the computer. A sample main program
## demonstates their use on a 7x7 board.
##-------------------------------------------------------------##

from random import randrange, random

##-------------------------------------------------------------##
## Function: playGame
## Inputs: A list of strings for ship names, a list of ints for
##         ship lengths, a list of characters for ship symbols
##         used on the game board, an int representing the size
##         of the game board (gridSize x gridSize)
## Outputs: None
##-------------------------------------------------------------##
## Initializes and runs a game of battleship between a human
## player and the computer.
##-------------------------------------------------------------##

def playGame(shipName, shipSize, shipSym, gridSize):
    playerLives = 0
    compLives = 0
    for i in range(len(shipSize)):
        playerLives += shipSize[i]
        compLives += shipSize[i]
    
    # Initialize empty grids for two players
    playerGrid = createEmptyGrid(gridSize, gridSize, "*")
    playerShots = createEmptyGrid(gridSize, gridSize, "~")
    compGrid = createEmptyGrid(gridSize, gridSize, "*")
    compShots = createEmptyGrid(gridSize, gridSize, "~")

    # Human player places ships
    print("It's your turn to place your ships Captain!\n")
    printGrid(playerGrid, playerShots)
    print("\n")
    setShips(playerGrid, playerShots, shipName, shipSize, shipSym)

    # Computer player places ships
    print("The land lubbers are moving their ships into position Captain!")
    randomizeShips(compGrid, shipName, shipSize, shipSym)
    print("They're ready to be scuppered Captain!")
    # DEBUG printGrid(compGrid, compShots)

    win = False
    while(not win):
        # Computer's turn
        newShot = False
        first = True
        while(not newShot):
            print("\n")
            if(first):
                print("They've got their sights on us Captain!")
                first = False
            x , y = computerShoot(gridSize)
            newShot = checkShot(x, y, compShots, shipSym)
        print("They've aimed at (" + str(x) + ", " + str(y) + ")!")
        first = True
        hit = checkHit(x, y, compShots, playerGrid, shipSym, False)
        printGrid(playerGrid, playerShots)
        
        if(hit):
            playerLives -= 1
        win = checkWin(playerLives)
        if(win):
            print("They got us Captain! We're done for!")
            break
        
        # Player's turn
        newShot = False
        while(not newShot):
            print("\n")
            x , y = playerShoot(gridSize)
            newShot = checkShot(x, y, playerShots, shipSym)
            if(not newShot):
                print("We've already tried that Captain!")
            else:
                print("Good idea Captain!")
        hit = checkHit(x, y, playerShots, compGrid, shipSym, True)
        printGrid(playerGrid, playerShots)
        
        if(hit):
            compLives -= 1            
        win = checkWin(compLives)
        if(win):
            print("We did it Captain! They're scuppered!")
            break

##-------------------------------------------------------------##
## Function: playerShoot
## Inputs: An int representing the size of the game board
## Outputs: A tuple representing an x, y coordinate
##-------------------------------------------------------------##
## Provides the mechanism for getting a game board coordinate
## from the human player and ensuring that it falls within the
## game board boundaries.
##-------------------------------------------------------------##

def playerShoot(gridSize):
    valid = False
    while(not valid):
        x, y = eval(input("Captain! Choose a coordinate and enter it in the form x, y: "))
        if (x < 0 or x >= gridSize):
            print("Our cannons don't reach that far Captain!")
        elif (y < 0 or y >= gridSize):
            print("Our cannons don't reach that far Captain!")
        else:
            print("Shoot at (" + str(x) + ", " + str(y) + ") skipper!")
            valid = True
    return (x, y)
    
##-------------------------------------------------------------##
## Function: computerShoot
## Inputs: An int representing the size of the game board
## Outputs: A tuple representing an x, y coordinate
##-------------------------------------------------------------##
## Generates a random set of coordinates as an x, y tuple.
##-------------------------------------------------------------##

def computerShoot(gridSize):
    x , y = randrange(0, gridSize), randrange(0, gridSize)
    # DEBUG print("Opponent shoots at (" + str(x) + ", " + str(y) + ")")
    return (x, y)
    
##-------------------------------------------------------------##
## Function: checkShot
## Inputs: Two ints representing an x, y coordinate, a grid
##         representing the shot taken by the player, a list of
##         symbols representing ships and misses
## Outputs: A boolean representing the shot state
##-------------------------------------------------------------##
## This function returns True if the character found at the
## (x, y) coordinate is not in the list of symbols that are used
## to mark a coordinate that has already been chosen. It returns
## False otherwise.
##-------------------------------------------------------------##

def checkShot(x, y, shotGrid, symList):
    if (shotGrid[y][x] not in symList):
        new = True
    else:
        new = False
    return new

##-------------------------------------------------------------##
## Function: checkHit
## Inputs: Two ints representing an (x, y) coordinate, a grid
##         representing the shots taken by the player, a grid
##         representing the opponents game board, a list of
##         game piece symbols, a boolean representing if this is
##         the human player
## Outputs: A boolean representing if a ship has been hit
##-------------------------------------------------------------##
## Compares the (x,y) coordinate with the opponent's game board.
## If there is a character there matching an entry in the symbol
## list, it prints a confirmation message, otherwise it prints
## that there was a miss. The both grids are updated in place 
## with the shot.
##-------------------------------------------------------------##

def checkHit(x, y, shotGrid, enemyGrid, symList, player):
    coordinate = enemyGrid[y][x]
    if (coordinate not in symList):
        if(player):
            print("We missed Captain!")
        else:
            print("They missed us Captain!")
        shotGrid[y][x] = symList[len(symList) - 1]
        hit = False
    else:
        if(player):
            print("We hit the blooming whales Captain!")
        else:
            print("Captain! We took a hit!")
        shotGrid[y][x] = coordinate
        hit = True
    enemyGrid[y][x] = "X"
    return hit

##-------------------------------------------------------------##
## Function: checkWin
## Inputs: An int representing the remaining lives of a player
## Outputs: A boolean representing a win
##-------------------------------------------------------------##
   
def checkWin(lives):
    if(lives == 0):
        win = True
    else:
        win = False
    return win   

##-------------------------------------------------------------##
## Function: setShips
## Inputs: Two lists of lists representing the two sides of a
##         battleship board, a list of ship names, a list of ship
##         sizes, a list of ship symbols
## Outputs: None
##-------------------------------------------------------------##
## Contains the logic and error checking for placing ships on
## the human player's boards. The second piece of the game board
## is required for outputing the updated board to the screen when
## a ship is successfully placed.
##-------------------------------------------------------------##

def setShips(grid, shotGrid, shipName, shipSize, shipSym):
    for i in range(len(shipName)):
        # Loop for same ship while there is invalid input or a collision
        collide = True
        validXY = False
        validDir = False
        # Loops while there is a collision of ship pieces on the board
        while (collide):
            # Loops while the player enters invalid cooridinates
            while(not validXY):
                x, y = eval(input("Enter the starting co-ordinates for your " + shipName[i] + " (size " + str(shipSize[i]) + ") in the form startX, startY: "))
                if(x >= len(grid) or y >= len(grid)):
                    print("Starting coordinates are not within board boundaries.")
                else:
                    validXY = True
            # Loops while the player chooses a ship orientation that would cause it to fall off the board
            while(not validDir):
                orient = input("Enter a direction to orient the ship (h or v): ")
                if(orient not in ["h", "v"]):
                    print("Invalid direction. Enter one of h (horizontal) or v (vertical)")
                elif(orient == "h" and (x + shipSize[i] >= len(grid)) and (x - shipSize[i] < 0)):
                    print("Invalid direction. Ship extends off board.")
                elif(orient == "v" and (y + shipSize[i] >= len(grid)) and (y - shipSize[i] < 0)):
                    print("Invalid direction. Ship extends off board.")
                else:
                    validDir = True

            # Check if the combination of coordinate and direction fills unoccupied places on the board     
            collide = checkShip(grid, x, y, orient, shipSize[i], shipSym[i], shipSym, True)
            
            # Print the updated board
            print("\n")
            printGrid(grid, shotGrid)
            print("\n")

##-------------------------------------------------------------##
## Function: randomizeShips
## Inputs: A list of lists representing the placement side of the
##         battleship board, a list of ship names, a list of ship
##         sizes, a list of ship symbols
## Outputs: None
##-------------------------------------------------------------##
## Contains the logic and error checking for placing ships on
## the computer player's boards.
##-------------------------------------------------------------##
            
def randomizeShips(grid, shipName, shipSize, shipSym):
    for i in range(len(shipName)):
        collide = True
        validXY = False
        validDir = False
        # DEBUG print("Place ship " + shipName[i])
        # Loop for same ship while there is invalid input or a collision
        while (collide):
            x, y = randrange(0, len(grid)), randrange(0, len(grid))

            # Randomize a value and map it to "h" and "v" orientations
            num = round(random())
            if(num == 0):
                orient = "h"
            else:
                orient = "v"

            # Ensure that the randomized values result in a placement that is on the game board
            if(orient == "h" and (x + shipSize[i] >= len(grid)) and (x - shipSize[i] < 0)):
                collide = True
            elif(orient == "v" and (y + shipSize[i] >= len(grid)) and (y - shipSize[i] < 0)):
                collide = True
            else:
                # DEBUG print("(" + str(x) + ", " + str(y) + "), " + orient)
                collide = checkShip(grid, x, y, orient, shipSize[i], shipSym[i], shipSym, False)

##-------------------------------------------------------------##
## Function: checkShip
## Inputs: A list of lists representing the player's ship board,
##         two ints representing an (x, y) coordinate, a character
##         "h" or "v" representing the ship orientation, an int
##         representing the length of the ship (assume width = 1),
##         a character representation of the ship name, a list of
##         all symbols used to represent ships, a boolean that
##         determines if collision information should be displayed
##         on screen
## Outputs: A boolean representing the collision state
##-------------------------------------------------------------##
## Determines if a ship can be placed on the game board without
## colliding with another already placed ship or extending off
## the sides of the game board. If the ship can be placed
## without collision, the player's board is updated in place and
## the function returns False. Else, the game board is unchanged
## and True is returned.
##-------------------------------------------------------------##

def checkShip(grid, x0, y0, orient, size, sym, symList, show):
    gridCopy = grid
    collide = True
    xInc, yInc = 1,0
    x, y = x0, y0
    
    # Default increments are for horizontal placement; switch if vertical 
    if (orient == "v"):
        xInc, yInc = yInc, xInc

    # Reverses incrementation if the (+) direction results in an invalid ship placement
    if(x + size > len(grid)):
        xInc = xInc * -1
    if(y + size > len(grid)):
        yInc = yInc * -1

    # Check for collisions
    clear = True 
    for j in range(size):
        if(gridCopy[y][x] not in symList):
            x += xInc
            y += yInc
        else:
            clear = False
            if(show):
                print("Collision at (" + str(x) + ", " + str(y) + ")")
            break
    # if there have not been any collisions, place the ship
    if(clear):
        collide = False
        for j in range(size):
            grid[y0][x0] = sym
            x0 += xInc
            y0 += yInc
        # DEBUG printGrid(grid, grid)
    return collide

##-------------------------------------------------------------##
## Function: createEmptyGrid
## Inputs: Rows in grid, columns in grid, filler symbol
## Outputs: A list of lists representing a rows x columns grid
##-------------------------------------------------------------##
## Creates a grid of x rows and y columns filled with a symbol
## sym.
##-------------------------------------------------------------##

def createEmptyGrid(x, y, sym):
    grid = []
    row = []
    for i in range(x):
        for j in range(y):
            row.append(sym)
        grid.append(row)
        row = []
    return grid

##-------------------------------------------------------------##
## Function: printGrid
## Inputs: Two square matrices (represented as a list of lists)
## Outputs: None
##-------------------------------------------------------------##
## Outputs two square matrices side-by-side to the screen. They
## Are formatted in the style of a Battleship board with the
## player's ships on the left and the player's attempted shots
## on the right.
##-------------------------------------------------------------##

def printGrid(shipGrid, shotGrid):
    row = "  | "
    for i in range(len(shipGrid)):
        row += str(i) + " "

    row += "    | "
    for i in range(len(shotGrid)):
        row += str(i) + " "
    print(row)

    row = "  |"
    for i in range(len(shipGrid)*2):
        row += "-"
    row += "     |"
    for i in range(len(shotGrid)*2):
        row += "-"
    print(row)
    
    row = ""
    for i in range(len(shipGrid)):
        row = str(i) + " | "
        for j in range(len(shipGrid[i])):
            row += shipGrid[i][j] + " "
        row += "  " + str(i) + " | "
        for k in range(len(shotGrid[i])):
            row += shotGrid[i][k] + " "
        print(row)

## ---------------- MAIN ---------------- ##

def main():
    # Parameters for one version of Battleship with a 7x7 board
    shipName = [ "Aircraft Carrier", "Cruiser", "Destroyer" ]
    shipSize = [ 5, 3, 2 ]
    # The last symbol must be the one used to mark 'misses'
    shipSym = [ "A", "C", "D", "X" ]
    gridSize = 7
    
    playGame(shipName, shipSize, shipSym, gridSize)
    
main()
