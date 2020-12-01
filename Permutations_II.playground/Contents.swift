import UIKit

func permuteUnique(_ nums: [Int]) -> [[Int]] {
    guard !nums.isEmpty else { return [] }
    var nums = nums
    var output = Set<[Int]>()
    findPermutations(&output, &nums, 0, nums.count - 1)
    return Array(output)
}

func findPermutations(_ output: inout Set<[Int]>, _ nums: inout [Int], _ start: Int, _ end: Int) {
    if start == end {
        output.insert(nums)
    } else {
        for i in start ... end {
            if i != start, nums[start] == nums[i] { continue }
            nums.swapAt(start, i)
            findPermutations(&output, &nums, start + 1, end)
            nums.swapAt(start, i)
        }
    }
}

print(permuteUnique([1, 2, 3]))
print(permuteUnique([1, 1, 2]))
