import UIKit

func find132pattern(_ nums: [Int]) -> Bool {
    guard nums.count > 2 else { return false }
    var minArray = [Int](repeating: 0, count: nums.count)
    minArray[0] = nums[0]
    for i in 1 ..< nums.count {
        minArray[i] = min(minArray[i - 1], nums[i])
    }
    var stack = [Int]()
    for j in stride(from: nums.count - 1, through: 0, by: -1) {
        if nums[j] > minArray[j] {
            while !stack.isEmpty, stack.last! <= minArray[j] {
                stack.removeLast()
            }
            if !stack.isEmpty, stack.last! < nums[j] { return true }
        }
        stack.append(nums[j])
    }
    return false
}

print(find132pattern([1, 2, 3, 4]))
print(find132pattern([3, 1, 4, 2]))
print(find132pattern([-1, 3, 2, 0]))
print(find132pattern([3, 5, 0, 3, 4]))
print(find132pattern([-2, 1, 2, -2, 1, 2]))
