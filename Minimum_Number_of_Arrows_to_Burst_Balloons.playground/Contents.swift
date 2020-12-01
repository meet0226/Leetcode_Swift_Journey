import UIKit

func findMinArrowShots(_ points: [[Int]]) -> Int {
    guard points.count > 1 else { return points.count }
    let points = points.sorted { $0[1] < $1[1] }
    var result = 1
    var index = 1
    var maxNumber = points[0][1]
    while index < points.count {
        if points[index][0] > maxNumber {
            result += 1
            maxNumber = points[index][1]
        }
        index += 1
    }

    return result
}

print(findMinArrowShots([[10, 16], [2, 8], [1, 6], [7, 12]]))
print(findMinArrowShots([[1, 2], [2, 3], [3, 4], [4, 5]]))
print(findMinArrowShots([[1, 2]]))
print(findMinArrowShots([[2, 3], [2, 3]]))
