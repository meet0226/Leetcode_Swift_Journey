import UIKit

func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
    guard !nums.isEmpty else { return 0 }
    var result = 0
    for i in 0 ..< nums.count {
        guard nums[i] < k else { continue }
        result += 1
        var total = nums[i]
        for j in i + 1 ..< nums.count {
            print(total)
            if (total * nums[j]) < k {
                total *= nums[j]
                result += 1
                continue
            }
            break
        }
    }
    return result
}

func numSubarrayProductLessThanK1(_ nums: [Int], _ k: Int) -> Int {
    guard !nums.isEmpty else { return 0 }
    var result = 0
    var start = 0
    var currentTotal = 1
    for i in 0 ..< nums.count {
        currentTotal *= nums[i]
        while currentTotal >= k, start <= i {
            currentTotal /= nums[start]
            start += 1
        }
        result += (i - start + 1)
    }
    return result
}

print(numSubarrayProductLessThanK1([10, 5, 2, 6], 100))
print(numSubarrayProductLessThanK1([10, 500, 2, 6], 100))
print(numSubarrayProductLessThanK1([1, 1, 1], 1))
