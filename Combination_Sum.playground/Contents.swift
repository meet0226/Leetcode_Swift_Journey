import UIKit

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var output = [[Int]]()
    var tempArray = [Int]()
    createOutput(&tempArray, &output, target, candidates, 0)
    return output
}

func createOutput(_ tempArray: inout [Int], _ output: inout [[Int]], _ target: Int,_ candidates: [Int], _ index: Int) {
    if target < 0 { return }
    if target == 0 {
        output.append(tempArray)
        return
    }

    for i in index..<candidates.count {
        if candidates[i] == 0 { continue }
        tempArray.append(candidates[i])
        createOutput(&tempArray, &output, target - candidates[i], candidates, i)
        tempArray.removeLast()
    }
}

print(combinationSum([2,3,6,7], 7))
print(combinationSum([2,3,5], 8))
print(combinationSum([2], 1))
print(combinationSum([1], 1))
print(combinationSum([1], 2))
