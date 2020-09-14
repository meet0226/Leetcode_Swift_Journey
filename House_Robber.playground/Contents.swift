import UIKit

func rob(_ nums: [Int]) -> Int {
    guard nums.count > 2 else { return nums.max() ?? 0 }
    var nums = nums
    nums[2] += nums[0]
    print(nums)
    for i in 3..<nums.count {
        nums[i] += max(nums[i - 2], nums[i - 3])
        print(nums)
    }
    return max(nums[nums.count - 1],nums[nums.count - 2])
}

func rob2(_ nums: [Int]) -> Int {
    var currentMax = 0
    var prevMax = 0
    for num in nums {
        let temp = currentMax
        currentMax = max(currentMax, prevMax+num)
        prevMax = temp
    }
    return currentMax
}

print(rob([2,7,9,3,1,2,7,9,3,1,2,7,9,3,1]))
print(rob([1,2,3,1]))
print(rob([2,1,1,2]))
