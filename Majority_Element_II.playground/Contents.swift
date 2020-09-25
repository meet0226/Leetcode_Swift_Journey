import UIKit

func majorityElement(_ nums: [Int]) -> [Int] {
    guard !nums.isEmpty else { return [] }
    guard nums.count > 1 else { return nums }
    var output = Set<Int>()
    let nums = nums.sorted()
    var currentNumber = nums[0]
    var count = 1
    for num in nums[1...] {
        if currentNumber == num {
            count += 1
            if count > (nums.count/3) {
                output.insert(currentNumber)
            }
            continue
        }
        if count > (nums.count/3) {
            output.insert(currentNumber)
        }
        count = 1
        currentNumber = num
        if count > (nums.count/3) {
            output.insert(currentNumber)
        }
    }
    return Array(output)
}

print(majorityElement([1,1,1,3,3,2,2,2]))
print(majorityElement([3,2,3]))
print(majorityElement([1]))
print(majorityElement([1,2]))
print(majorityElement([2,2]))
print(majorityElement([6,5,5]))


