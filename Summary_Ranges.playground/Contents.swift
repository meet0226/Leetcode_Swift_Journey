import UIKit

func summaryRanges(_ nums: [Int]) -> [String] {
    guard nums.count > 1 else {
        return nums.isEmpty ? [] : [String(nums[0])]
    }
    var output = [String]()
    var rangeStart = nums[0]
    var rangeEnd = nums[0]
    var index = 0
    while index < nums.count {
        if rangeEnd == nums[index] {
            if index == nums.count - 1 {
                if rangeStart == rangeEnd {
                    output.append("\(rangeStart)")
                } else {
                    output.append("\(rangeStart)->\(rangeEnd)")
                }
            }
            rangeEnd += 1
            index += 1
        } else {
            if rangeStart == (rangeEnd - 1) {
                output.append("\(rangeStart)")
            } else {
                output.append("\(rangeStart)->\(rangeEnd - 1)")
            }
            rangeStart = nums[index]
            rangeEnd = nums[index]
        }
    }
    return output
}

print(summaryRanges([0, 1, 2, 4, 5, 7]))
print(summaryRanges([0, 1, 2, 4, 5, 6, 7]))
print(summaryRanges([0, 1, 2, 3, 4, 5, 6, 7]))
