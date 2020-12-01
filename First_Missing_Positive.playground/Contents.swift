import UIKit

func firstMissingPositive(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 1 }
    for i in 1 ... nums.count {
        if !nums.contains(i) {
            return i
        }
    }
    return nums.count + 1
}

print(firstMissingPositive([3, 4, -1, 1]))
print(firstMissingPositive([0, 1, 2, 3]))
print(firstMissingPositive([1, 2, 3, 4]))
