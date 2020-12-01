import UIKit

func findMaximumXOR(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    var output = 0
    for i in 0 ..< (nums.count - 1) {
        for j in (i + 1) ..< nums.count {
            if (nums[i] ^ nums[j]) > output {
                output = nums[i] ^ nums[j]
            }
        }
    }
    return output
}

print(findMaximumXOR([3, 10, 5, 25, 2, 8]))
