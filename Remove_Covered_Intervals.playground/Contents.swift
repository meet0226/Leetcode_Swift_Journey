import UIKit

func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
    guard intervals.count > 1 else { return intervals.count }
    var intervals = intervals.sorted(by: { $0[0] < $1[0] })
    var index = 0
    while index < (intervals.count - 1) {
        if intervals[index + 1][0] <= intervals[index][0],
           intervals[index + 1][1] >= intervals[index][1]
        {
            intervals.remove(at: index)
        } else if intervals[index + 1][0] >= intervals[index][0],
                  intervals[index + 1][1] <= intervals[index][1]
        {
            intervals.remove(at: index + 1)
        } else {
            index += 1
        }
    }
    return intervals.count
}

print(removeCoveredIntervals([[1, 4], [3, 6], [2, 8]]))
print(removeCoveredIntervals([[1, 4], [2, 3]]))
print(removeCoveredIntervals([[3, 10], [4, 10], [5, 11]]))
print(removeCoveredIntervals([[1, 2], [1, 4], [3, 4]]))
print(removeCoveredIntervals([[34335, 39239], [15875, 91969], [29673, 66453], [53548, 69161], [40618, 93111]]))
