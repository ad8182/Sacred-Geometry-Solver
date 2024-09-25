# Sacred-Geometry-Solver
A solver for the Pathfinder 1st edition feat: Sacred Geometry, written by Andrew Dantone

See the details of the feat here: https://www.d20pfsrd.com/feats/general-feats/sacred-geometry/

## Currently Implemented: 
* Prompts the user for a target spell level to determine prime constant targets.
* Repeatedly prompts user for dice rolls until the user inputs an empty roll, at which point the program assumes the user is done inputting rolls (We dont know what level their character is and thus cannot determine how many rolls they need to input unless we seperately ask them).
* Takes the set of inputed dice rolls and re-orders them in every possible permutation.
* Runs a Depth First search to find the prime constants. (We need to search every possible space to trly determine that we cannot reach a prime constant, and since the feat dictates that all numbers must be used the solution will always be at the lowest depth, thus BFS has a better best time complexity and an equal worst time complexity than DFS in this problem.
* Returns if it was possible to reach one of the targeted constants.

## Planned Implementations:
* The BFS algorithm needs to be overhauled for 2 reasons. First I would like it to return the way to get the number as right now it just returns if its possible or not, this would be an easy fix if not for the second issue. Secondly the algorithm does not account for the fact that you are allowed to use parenthesis because I did not realize that was allowed by the feat when designing the algorithm.
* Create a User Interface instead of using command prompts to get the info from the user, preferably this will be programed in a different language and linked together.
* Incorperate a dice roller into the system so the user can either enter their own dice rolls, or have the program "roll" a prompted ammount of "dice" for them.
* Examine the overall efficency of the solution and overhaul for better time complexity if needed.

## Usage
### System Requirements
* Matlab version R2024a or later.
* Have all of the files in this directory in one folder that Matlab has access to

### Running The Program
Run Sacred_Geometry.m with no input arguments
The program will prompt the user for several inputs for the target spell level and dice rolls.
* If the user does somthing unexpected the program will send the user a custom error message explaining what went wrong.
* Otherwise once the user input is done the program will print whether Sacred Geometry was successful or not.
