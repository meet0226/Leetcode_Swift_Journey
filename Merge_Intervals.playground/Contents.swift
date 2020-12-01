import UIKit

func merge(_ intervals: [[Int]]) -> [[Int]] {
    guard intervals.count > 1 else { return intervals }
    let intervals = intervals.sorted(by: { $0[0] < $1[0] })
    var result = [[Int]]()
    var startInterval = intervals[0][0], endInterval = intervals[0][1]
    var index = 0
    while index < intervals.count {
        if intervals[index][0] <= endInterval {
            endInterval = max(intervals[index][1], endInterval)
        } else {
            result.append([startInterval, endInterval])
            startInterval = intervals[index][0]
            endInterval = intervals[index][1]
        }
        if index == (intervals.count - 1) {
            result.append([startInterval, endInterval])
        }
        index += 1
    }
    return result
}

func merge2(_ intervals: [[Int]]) -> [[Int]] {
    guard !intervals.isEmpty else { return [] }
    var intervals = intervals.sorted(by: { $0[0] < $1[0] })
    var index = 0
    while index < (intervals.count - 1) {
        if intervals[index + 1][0] <= intervals[index][1] {
            let newInterval = [min(intervals[index][0], intervals[index + 1][0]), max(intervals[index + 1][1], intervals[index][1])]
            intervals.remove(at: index + 1)
            intervals.remove(at: index)
            intervals.insert(newInterval, at: index)
        } else {
            index += 1
        }
    }
    return intervals
}

print(merge([[1, 3], [4, 6], [8, 10], [15, 18]]))
print(merge([[1, 3], [2, 6], [8, 10], [15, 18]]))
print(merge([[5, 6], [4, 7], [2, 3], [1, 4]]))
print(merge([[1, 4], [4, 5]]))
