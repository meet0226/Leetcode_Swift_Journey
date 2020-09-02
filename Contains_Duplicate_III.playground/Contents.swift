

func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
    guard k > 0, nums.count > 1 else { return false }
    var indexes = [Int](0 ..< nums.count)
    indexes = indexes.sorted { nums[$0] < nums[$1] }

    for i in 0 ..< nums.count {
        for j in (i + 1) ..< nums.count {
            if (nums[indexes[j]] - nums[indexes[i]]) > t {
                 break
            }
            if abs(indexes[j] - indexes[i]) <= k {
                return true
            }
        }
    }
    return false
}

print(containsNearbyAlmostDuplicate([1,2,3,1], 3, 0))
print(containsNearbyAlmostDuplicate([1,0,1,1], 1, 2))
print(containsNearbyAlmostDuplicate([1,5,9,1,5,9], 2, 3))
print(containsNearbyAlmostDuplicate([2,2], 3, 0))


