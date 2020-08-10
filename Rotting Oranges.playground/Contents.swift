/**
 In a given grid, each cell can have one of three values:

 the value 0 representing an empty cell;
 the value 1 representing a fresh orange;
 the value 2 representing a rotten orange.
 Every minute, any fresh orange that is adjacent (4-directionally) to a rotten orange becomes rotten.

 Return the minimum number of minutes that must elapse until no cell has a fresh orange.  If this is impossible, return -1 instead.

 Example 1:
 Input: [[2,1,1],[1,1,0],[0,1,1]]
 Output: 4
 Example 2:

 Input: [[2,1,1],[0,1,1],[1,0,1]]
 Output: -1
 Explanation:  The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.
 Example 3:

 Input: [[0,2]]
 Output: 0
 Explanation:  Since there are already no fresh oranges at minute 0, the answer is just 0.


 Note:
 - 1 <= grid.length <= 10
 - 1 <= grid[0].length <= 10
 - grid[i][j] is only 0, 1, or 2.
 */

import UIKit

func orangesRotting(_ grid: [[Int]]) -> Int {
    struct Orange {
        var location = (0,0)
        var status = 0
    }
    var minutes = 0
    guard grid.count > 0 else { return minutes }
    var oranges = [Orange]()
    for row in 0..<grid.count {
        for column in 0..<grid[row].count {
            let orange = Orange(location: (row, column), status: grid[row][column])
            oranges.append(orange)
        }
    }
    guard oranges.filter({ $0.status == 1 }).count > 0 else { return 0 }
    var rottenOranges = oranges.filter { $0.status == 2 }
    guard rottenOranges.count > 0 else { return -1 }
    while rottenOranges.count > 0 {
        var newRottenOranges = [Orange]()
        for rottenOrange in rottenOranges {
            let (row, column) = rottenOrange.location
            let firstNewRottenOrange = Orange(location: (row, column + 1),
                                               status: 2)
            let secondNewRottenOrange = Orange(location: (row + 1, column),
                                              status: 2)
            let thirdNewRottenOrange = Orange(location: (row - 1, column),
                                              status: 2)
            let fourthNewRottenOrange = Orange(location: (row, column - 1),
                                               status: 2)
            for i in 0..<oranges.count where
                (oranges[i].location == firstNewRottenOrange.location &&
                    oranges[i].status == 1) {
                        newRottenOranges.append(firstNewRottenOrange)
                        oranges[i] = firstNewRottenOrange
            }
            for i in 0..<oranges.count where
                (oranges[i].location == secondNewRottenOrange.location &&
                    oranges[i].status == 1) {
                        newRottenOranges.append(secondNewRottenOrange)
                        oranges[i] = secondNewRottenOrange
            }
            for i in 0..<oranges.count where
                (oranges[i].location == thirdNewRottenOrange.location &&
                    oranges[i].status == 1) {
                        newRottenOranges.append(thirdNewRottenOrange)
                        oranges[i] = thirdNewRottenOrange
            }
            for i in 0..<oranges.count where
                (oranges[i].location == fourthNewRottenOrange.location &&
                    oranges[i].status == 1) {
                        newRottenOranges.append(fourthNewRottenOrange)
                        oranges[i] = fourthNewRottenOrange
            }
        }
        if newRottenOranges.count > 0 {
            minutes += 1
        }
        rottenOranges = newRottenOranges
    }

    let freshOranges = oranges.filter { ($0.status == 1) }
    return freshOranges.count > 0 ? -1 : minutes
}

let input1 = [[1,2]]
print(orangesRotting(input1))

let input2 = [[2,1,1],[0,1,1],[1,0,1]]
print(orangesRotting(input2))

let input3 = [[0,2]]
print(orangesRotting(input3))

let input4  = [[2,1,1],[1,1,0],[0,1,1]]
print(orangesRotting(input4))

let input5  = [[1]]
print(orangesRotting(input5))

let input6  = [[0]]
print(orangesRotting(input6))
