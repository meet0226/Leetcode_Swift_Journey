
func maxProduct(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    guard nums.count > 1 else { return nums[0] }
    var maxValue = nums[0], minValue = nums[0], result = nums[0]
    for num in nums[1...] {
        if num < 0 {
            swap(&maxValue, &minValue)
        }
        maxValue = max(num, num * maxValue)
        minValue = min(num, num * minValue)
        result = max(result, maxValue)
    }
    return result
}

print(maxProduct([2, 3, -2, 4]))
print(maxProduct([-2, 0, -1]))
print(maxProduct([-2, 1, -3]))
print(maxProduct([2, 3, -1, 4, 5, -2, 1, 6, -3]))
print(maxProduct([2, 3, 0, 4, 5, -2, 1, 6, -3]))
print(maxProduct([2, 3, 0, 1, 2]))
