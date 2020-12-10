//
//  Day3Solver.swift
//  AdventOfCode
//
//  Created by katunch on 07.12.20.
//

import Foundation

class Day3Solver {
    
    public init() { }
    
    public static let exampleData = """
    ..##.......
    #...#...#..
    .#....#..#.
    ..#.#...#.#
    .#...##..#.
    ..#.##.....
    .#.#.#....#
    .#........#
    #.##...#...
    #...##....#
    .#..#...#.#
    """
    
    public struct Position {
        var horizontal: Int = 0
        var vertical: Int = 0
    }
    
    public func solve(input: String, steps: Position = Position(horizontal: 3, vertical: 1)) {
        print("We have found \(numberOfTrees(input: input, steps: steps)) trees in the forrest.")
    }
    
    public func solve2(input: String) {
        let steps = [
            Position(horizontal: 1, vertical: 1),
            Position(horizontal: 3, vertical: 1),
            Position(horizontal: 5, vertical: 1),
            Position(horizontal: 7, vertical: 1),
            Position(horizontal: 1, vertical: 2)
        ]
        
        let result = steps.map { numberOfTrees(input: input, steps: $0) }.reduce(1) { (result, count) -> Int in
            return result * count
        }
        
        print ("The solution is \(result)")
        
    }
    
    private func numberOfTrees(input: String, steps: Position) -> Int {
        var currentPosition: Position = Position(horizontal: 0, vertical: 0)
        let numberOfLines = input.lines.count
        
        var numberOfTrees = 0
        while currentPosition.vertical < numberOfLines - 1 {
            var line = input.lines[currentPosition.vertical + steps.vertical]
            let horizontalPosition = currentPosition.horizontal + steps.horizontal
            
            while horizontalPosition >= line.count {
                line = line.appending(line)
            }
            
            let charAtPosition = String(line[line.index(line.startIndex, offsetBy: currentPosition.horizontal + steps.horizontal)])
            if charAtPosition == "#" {
                numberOfTrees += 1
            }
            currentPosition.vertical = currentPosition.vertical + steps.vertical
            currentPosition.horizontal = currentPosition.horizontal + steps.horizontal
        }
        return numberOfTrees
    }
    
}

let Day3Input = """
......#..##..#...#...#.###.....
#..#............#..........#...
..........#....#..........#....
....#..#.#..........#..#.....#.
#.......#...#......#........###
#####........#.#....##..##..#..
......#.#..#..#..##.#..#.##....
.#..#.#..............##....##..
..##......#....#........#...###
...#....#.#....#.#..#......#..#
..................#.....#.....#
#.#...#...#....#............#.#
.#...#.....#...##........#.....
...#....#........#..#....#..###
#...##.....##.#.#...........#.#
.###........#.#.#.........#....
...#.............###.....#.#..#
.####.#..#....#.....#.........#
.#.#........#.#.....#.....#....
.#.......#................##.##
...#.#..#...###.....#....#..##.
...#....##..#............##...#
#...#............######...#.##.
.........#........#.#...#..##..
.....###..#.#.....##.#.#......#
..#.#...#.#..#.#.##..#.....#.#.
..#......#.#....#...#..........
..#...#.....#.#...##.....#.....
.##...........####........##...
....#............#.#...........
.....####.........#.##....###..
#..#..#.#..............#.#.....
...#.#........#.........#......
......#.#.#...#.....#....#.....
........#.#...#####..#..#......
.....#.#....#....#...........##
.#...#.........#.......##......
.#.##..##......#...............
...#.....#.......#.#.#.........
.........#..#...#...#.#.##....#
.#......##....#..#.........#...
....#.....#........#.........##
......#...........##...........
.....#..............###.#....#.
........#..#...#..#..#..#..#.#.
.#.....#.##.#..#..#.#.....#....
...#....#...#.#.....##.#...#..#
#..#......#..#.###...........#.
.##...##.#........#.#......#.#.
...#.#..#.#.......#..###...##..
#.......#.#....#..........#....
.#.....#..#.#.#..#..#........#.
.#...#......#.#...#.##.....#.##
...######..#.#....#.........##.
#.#.......................#....
..#..##...#...#.#..##.......#..
.##..#.......##......##.#..#...
#.#....##.......#..#...........
..#...#............#..#........
........#.#.........#...#..#..#
.#...###...............##...#..
...........#.....#....#....###.
#..#....##..#................##
...#.#..#..##......#....##....#
...#.##...#....#..#....#.......
#...##..##.#.........#...#....#
.##........###.#..........#....
..#..#..#...#.##..#.#......#...
.......##..#....###.##.....#..#
#....#...#.#.....#..###....##..
.#.......#.........#....#.#..#.
.........#.......#.#.......#...
..........#...##..#...#....#.##
..#........#.......#...........
#....#.....##......#....#.#...#
......#.....#....#.....#..#....
.#....##...#...##..............
..#....#......#...#....#...#...
#....###...##..#.#....##......#
..#.......#.........#..#......#
...#...#.##.......#....##..#...
..#.#...#.##..#..#..#...#.#...#
.#.........###....#....#.....#.
.#.##.#..##..#...........#....#
....##..#..##.#.......#....#..#
....#..#.........##..#......#.#
..........#.#.#....##.#......##
.##...#....###...#..........#..
#..#.....#..#.#.#.#..#......#.#
......#....#......##.#......#.#
...#.....#.......#....#.......#
.#.#................#..........
......#..#..#...............##.
##......#...#.####....#.#.#....
...#..##............#....#.....
..#..#.#...#..................#
.##.#.#..##.###.....#..#.......
..#...#.#...#......#..#........
.###..........##...###..##..#..
#.#...#........#.......##......
..##...#........#....##...##...
.......#.##.....#.#.##..#..##..
........#............#....##...
...#.#.#..#.........#.#.......#
..#..##.##...#.##...#....#...#.
.....##.#...##............##...
.#...#.###....#.......#...#...#
.......#######.#....#.....#.#..
......#.......#............##..
.....#...........#......#.....#
........#....#.##.#............
.#........#.......##.#.#....#..
#.....#..####.#................
.....#.......................##
.#.....#..##.#..##........#.#.#
#...##....#..##................
......##.###..........#.....#..
.#........#...#..............##
..#..........###.........#.....
....#.....##....#..#..#.#.#....
....#.......#.##...#.####.#....
#........#............#.##.....
..#......##.....#..#...#.......
..#......###...#.##......#..#..
#..#..#............#..#.###....
...##.........#..##...#..#.#...
..#.###..#.##.#........#..#....
......#..###.#........#........
.#....#.#..#.....#..#..#.......
#.....##.##...#...###.#.#..#.#.
.#....#..#.........#..#....###.
......##.####...#....#........#
##..#........#..#..##...#......
#.........#.........#...#..#.#.
..........#...................#
###....#....#....#......###...#
#....##........#..###.#..#.....
.#......#.....#.#.........#..#.
...#.......##.....#.........###
..............#........#.....##
....#.#..#.....###.#....##.....
.........#..##.#....#.#........
...#....#.......#.#.#..#.#....#
...........#...#..........#.#..
#.................##........###
####..#.#..#...#.....###.......
..#.#......##.#.......#........
.......##........#..#.....#..#.
...#..#......#..#.#.......###..
#....#...##..#.#.#.#.........#.
....#....#....#.#..#..........#
...###........#.#.###......##..
................#.....#.#...##.
..#..#.###...........#...###.#.
.........................#..#.#
#...#..#..##.###.....##.##.#...
...#..................#.#....#.
......#..##.#.......#.......#..
.##....#.#................#....
.#...#..#.#.#....##....#.......
.##......#.....#..........#....
..#...........#..##.........#..
....#.#...........#..........##
....#.#.#...........#.#........
......#.....#..#....##....##...
............##...##......#.#.##
#.#.....#..#....#..#...#.#...#.
.#...###..#..#.......#.......#.
.....#..#.##.....#....#...#....
##.....#..##.......##..#.#.#..#
....#.#......##....#.....#..###
.#...#.#......#.##...#..##.....
.#...#...#......##..#..#...#.#.
.#.........#....##...###...##..
###.....#......####.....#.#....
.....#..##.##................#.
.#.................#...#..##.#.
....#....#..#.......#.....#....
.##....#..#..#.....###.#..#..#.
#.#.......#.....##...#.....#...
#.#........#.#.###...#....#....
.#.....#.....##.#...#..#.......
..###.#............#...##.###..
.....#.....#..#..##............
.#.#..#.#..##..#....#...##.....
.#...........#..#.......#...#.#
#.#.#.#.....##....#............
...#.................#.#......#
.....##.............#...#.#....
.##......#.#....#..........#.#.
.#.##.......##...#...#.....#.#.
#...#.#........#......##....#.#
#....##....#....#...#..#..#.#.#
......#..........#...#.....#..#
#..#....#....#..##.#..#.#...#..
......#..#.#....#.....#.#..#..#
...#.#...###........#.#......##
..#............................
...#.#..##...##...#...#......##
...#.####......#.........#....#
.#...#.#...##....#......#.#....
.#.....##..##.#................
.#...............#.............
......#.....#...#..##..##......
...#..##.......#.......#..#.#.#
......##.....#..#.....#...#.#.#
........##........#.#........##
.#....#.....###..#.......#...#.
#...#....#.........#.......#...
...##..#........#####.#........
###..#....#.#..#...#.####......
..#..........#.#.............#.
#......#.#....#.#.#....#.##....
.#.#.#.............#....#...#..
......#.....#.#...#..###.#..#..
.....#..#............#...#...##
..#......###..#........#.#.....
#..##......#.#.#.#...........#.
#..#...##.##.....#....#..#.....
...##.#..........#.#....#...#..
.#.#.#.#..#.#...#......#.......
....#......###.#...............
.........#...#....#...#.#....#.
##.#.........#...##............
........#..........#.#...#.....
..#........#....#.......#......
#..#...............#..#...##.#.
#........#.....##.#..#....#...#
..##....#....#.#...........##..
....#.#.........#..#.....#..#..
.......##....#.#.#....###.#....
......#....#.#...#..#.........#
.....##..#....#.#......#.#.#...
#.##..##.#.......#..#...##.#.##
........#.#..#...##.#.#..#.....
#..#......#......#...#.#..#....
.....#......#.#....##....##....
....#.##...##..#..........##.#.
.#....#.......#.........#......
.#.......#.#...#...............
....#.##.......#.##..#.##..#...
#..#.......#.....#..#..........
..#.##.......#....#.#..##..#...
.#.....#...##.#.#..#...#.......
.......#.........#......#.#....
#.##.....##.......#....#.......
##.#.#.........##..#.....#....#
....#.#.#.#....#..#..##.......#
#...#...........#.#............
...#...#.#..#..##..............
......#.......#.........#..#.#.
#.....##.#....#...#..#.........
#...#..###.##..###...##.....#..
#....#.#.#...#.#..........#....
................#.#....#.....##
#.##..............####.....#.##
................#.....#........
#...#..#......#.....#......#...
.........##...........#...#...#
#.#....#...##.....#.....#..#..#
.....#...##..##.............#..
....###.#.......#.........#...#
..#.......#......#..#...#.#....
#.#....#......#.##....#.##.#...
.#.#...#.......#.#...#.##..#...
..........#......#.....#.......
........#...#.....#...##...#.#.
.....##....#.##..#........#.##.
..........##.....#..#........#.
.#....#..#.......#.##..........
.#..#..#...#...#........#.##...
.#...#.##.......#...#........#.
.....#....#.............#..#...
...#....##...#...#.....##......
#.#####.........##...#.....#...
......#.......#....#.....#..#..
..#..............#.#..#..#.....
....#.................#...#....
###.#..##.#....#...#.#......#.#
..##......#.#........#.#...##..
.....#...#...#..#.#..#..##..#..
.##...#......#...#...##.#...#..
.......###.#...........##.##...
.#.##..#.#.###.......#..##...#.
..#....#.......#..##......#....
.#....#.#..#..#.#.#....#...#...
..........##....#....#.#.......
.....#.......#.#..###.#.###....
.#.#....#.##..#.#..#.....#.#.#.
....#.....#.#.#............#...
.###....#...##......##..###..#.
...#.#..#.....#...#....##..#...
.#.#....#..........#...##.....#
#.....##...#........#.#..##..#.
.......#....#.#..........#...#.
.........#..#.#.###.........##.
..................#.#....#....#
....#....#.#..#.......###.##.##
....#...#.................#....
...#..#####.......#.#..##.##...
##.#....#...............#..#...
....#..........#...........#.#.
..##.#.##.#..#.#....#..........
.....#....#....##.#....#....#.#
.......#..##.....###...#....#.#
.#.......#..#.#.#...........#..
.#...........##.#.##....#.#....
....#.#....#.#.#......##.......
.........##......#.#.....###...
........#.#...#.##.....#.##.##.
##.#..##.#.........#....#......
.#.#.#....#..........#.#....#..
....###.........#.#.#..........
#..#....##.....#...............
#.##....#.#...#.....#......#.#.
............#.##........#......
.....#.#.....##..##............
.##..........#.......#......#..
...##..##......#.....#..#....##
.##.##...#.................##..
#....#.#........#..#....#..##.#
....##..##......#....###.#.#..#
.....#....#..#..#...##...#...#.
"""