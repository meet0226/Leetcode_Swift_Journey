import UIKit

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    guard !candidates.isEmpty else { return [] }
    var result = [[Int]]()
    findCombination(candidates.sorted(), &result, [], target, 0)
    return result
}

func findCombination(_ candidates: [Int],_ result: inout [[Int]],_ combination: [Int],_ target: Int,_ startIndex: Int) {
    if target == 0 {
        result.append(combination)
        return
    }

    var combination = combination
    for i in startIndex..<candidates.count {
        guard target >= candidates[i] else { return }
        if i != startIndex, candidates[i] == candidates[i-1] { continue }
        combination.append(candidates[i])
        findCombination(candidates, &result, combination, target - candidates[i], i + 1)
        combination.removeLast()
    }
}

print(combinationSum2([10,1,2,7,6,1,5], 8))
print(combinationSum2([2,5,2,1,2], 5))
print(combinationSum2([1], 1))
print(combinationSum2([1], 4))
print(combinationSum2([1,2], 1))
print(combinationSum2([4,1,1,4,4,4,4,2,3,5], 10)) // [[1,1,3,5],[1,1,4,4],[1,2,3,4],[1,4,5],[2,3,5],[2,4,4]]
