import UIKit

func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 1 else { return nums.count }
    var currentIndex = 0
    for i in 1..<nums.count {
        guard nums[currentIndex] != nums[i] else { continue }
        currentIndex += 1
        nums[currentIndex] = nums[i]
    }
    return currentIndex + 1
}

var intergerArray = [0,0,1,1,1,2,2,3,3,4] //[1,1,2]
print("Array Length - \(removeDuplicates(&intergerArray))")
