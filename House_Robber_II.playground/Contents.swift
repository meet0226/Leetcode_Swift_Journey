import UIKit

func rob(_ nums: [Int]) -> Int {
    guard nums.count > 3 else { return nums.max() ?? 0 }
    var nums1 = Array(nums.dropFirst())
    var nums2 = nums.dropLast()
    nums1[2] += nums1[0]
    nums2[2] += nums2[0]
    for i in 3 ..< nums1.count {
        nums1[i] += max(nums1[i - 2], nums1[i - 3])
    }
    for i in 3 ..< nums2.count {
        nums2[i] += max(nums2[i - 2], nums2[i - 3])
    }
    return max(nums2.max() ?? 0, nums1.max() ?? 0)
}

print(rob([2, 1, 1, 3, 1, 2, 1]))
print(rob([2]))
print(rob([]))
print(rob([2, 1, 1]))
print(rob([1, 3, 2]))
print(rob([1, 2, 3, 1]))
print(rob([2, 1, 3, 4]))
print(rob([2, 1, 3, 4, 6, 8]))
