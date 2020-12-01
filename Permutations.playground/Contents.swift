import UIKit

func permute(_ nums: [Int]) -> [[Int]] {
    guard !nums.isEmpty else { return [] }
    var nums = nums
    var output = [[Int]]()
    findPermutations(&output, &nums, 0, nums.count - 1)
    return output
}

func findPermutations(_ output: inout [[Int]], _ nums: inout [Int], _ start: Int, _ end: Int) {
    if start == end {
        output.append(nums)
    } else {
        for i in start ... end {
            nums.swapAt(start, i)
            findPermutations(&output, &nums, start + 1, end)
            nums.swapAt(start, i)
        }
    }
}

print(permute([1, 2, 3]))
