import UIKit

func search(_ nums: [Int], _ target: Int) -> Int {
    var startIndex = 0
    var endIndex = nums.count - 1
    while startIndex <= endIndex {
        let middleIndex = startIndex + (endIndex - startIndex) / 2
        if target < nums[middleIndex]{
            endIndex = middleIndex - 1
        }else if target > nums[middleIndex]{
            startIndex = middleIndex + 1
        }else{
            return middleIndex
        }
    }
    return -1
}

print(search([-1,0,3,5,9,12], 9))
print(search([-1,0,3,5,9,12], 0))
print(search([-1,0,3,5,9,12], 3))
print(search([-1,0,3,5,9,12], 10))
print(search([-1,0,3,5,9,12], 1))
print(search([-1,0,3,5,9,12], -1))
print(search([-1,0,3,5,9,12], 12))
print(search([-1,0,3,5,9,12], 5))
print(search([-1,0,3,5,9,12,14], 12))
