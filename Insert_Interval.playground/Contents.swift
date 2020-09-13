import UIKit

func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    guard !newInterval.isEmpty else { return intervals }
    var intervals = intervals
    intervals.append(newInterval)
    intervals.sort(by: { $0.first! < $1.first! })
    var index = 0
    while index < (intervals.count - 1) {
        if intervals[index][1] < intervals[index + 1][0] {
            index += 1
        } else {
            let editedInterval = [intervals[index][0], max(intervals[index][1], intervals[index + 1][1])]
            intervals.remove(at: index + 1)
            intervals.remove(at: index)
            intervals.insert(editedInterval, at: index)
        }
    }
    return intervals
}

//print(insert([[1,3],[6,9]], [4,5]))
//print(insert([[1,3],[6,9]], [0,0]))
//print(insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,9]))
//print(insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8]))
//print(insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,7]))
//print(insert([], [5,7]))
print(insert([], []))
