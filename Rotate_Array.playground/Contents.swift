import UIKit

func rotate(_ nums: inout [Int], _ k: Int) {
    var finalArray = [Int](repeating: 0, count: nums.count)
    for i in 0..<nums.count {
        var newIndex = i + k
        if newIndex >= nums.count {
            newIndex = (i + k) - (((i+k)/nums.count)*nums.count)
        }
        finalArray[newIndex] = nums[i]
    }
    nums = finalArray
}

var array1 = [1,2,3,4,5,6,7]
rotate(&array1, 3)

var array = [1,2]
rotate(&array, 3)

var array2 = [1,2,3]
rotate(&array2, 3)

var array3 = [1,2,3,4,5]
rotate(&array3, 3)


