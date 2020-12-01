import UIKit

func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    guard !intervals.isEmpty else { return 0 }
    let sortedIntervals = intervals.sorted(by: { $0[1] < $1[1] })
    var maxValue = sortedIntervals.first![0]
    var nonUniqueIntervals = intervals.count
    for interval in sortedIntervals where maxValue <= interval[0] {
        maxValue = interval[1]
        nonUniqueIntervals -= 1
    }
    return nonUniqueIntervals
}

print(eraseOverlapIntervals([[1, 100], [11, 22], [1, 11], [2, 12]])) // 2
print(eraseOverlapIntervals([[0, 2], [2, 3], [3, 4], [1, 3]])) // 1
print(eraseOverlapIntervals([[1, 2], [1, 2], [1, 2]])) // 2
print(eraseOverlapIntervals([[1, 2], [2, 3]])) // 0
print(eraseOverlapIntervals([[1, 2], [2, 3], [3, 4], [-100, -2], [5, 7]])) // 0
print(eraseOverlapIntervals([])) /// 0
