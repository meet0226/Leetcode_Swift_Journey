
func checkPossibility(_ nums: [Int]) -> Bool {
    guard nums.count > 2 else { return true }
    var modifiedNumberOfElements = 0
    var index = nums.count - 1
    while index != 0 {
        if nums[index] < nums[index - 1] {
            modifiedNumberOfElements += 1
            if index > 1
                && index < nums.count - 1
                && nums[index + 1] < nums[index - 1]
                && nums[index - 2] > nums[index] {
                return false
            }
        }
        if modifiedNumberOfElements > 1 { return false }
        index -= 1
    }
    return true
}

print(checkPossibility([4,2,1]))
print(checkPossibility([5,2,3]))
print(checkPossibility([5,7,1,8]))
print(checkPossibility([3,4,2,3]))
print(checkPossibility([3,3,2,3]))
print(checkPossibility([-1,4,2,3]))
