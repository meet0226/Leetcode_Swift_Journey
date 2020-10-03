import UIKit

func findPairs(_ nums: [Int], _ k: Int) -> Int {
    guard nums.count > 1 else { return 0 }
    let nums = nums.sorted()
    var output = Set<[Int]>()
    for i in 0..<(nums.count-1) {
        for j in i+1..<nums.count {
            if (nums[j] - nums [i]) > k {
                break
            }

            if nums[j]-nums[i] == k {
                output.insert([nums[i],nums[j]].sorted())
                break
            }
        }
    }
    return output.count
}

print(findPairs([1,2,3,4,5], 1))
print(findPairs([3,1,4,1,5], 2))
print(findPairs([1], 1))
print(findPairs([1,3,1,5,4], 0))
print(findPairs([1,2,4,4,3,3,0,9,2,3], 3))
print(findPairs([-1,-2,-3], 1))
