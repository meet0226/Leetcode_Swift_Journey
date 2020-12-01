import UIKit

// func minCostToMoveChips(_ position: [Int]) -> Int {
//    guard Set(position).count > 1 else { return 0 }
//    let evenPosition = position.filter { $0 % 2 == 0 }.count
//    let oddPosition = position.count - evenPosition
//    return min(oddPosition, evenPosition)
// }

func minCostToMoveChips(_ position: [Int]) -> Int {
    let evenPosition = position.reduce(0) { $0 + ($1 % 2 == 0 ? 1 : 0) }
    return min(position.count - evenPosition, evenPosition)
}

print(minCostToMoveChips([1, 2, 3]))
print(minCostToMoveChips([1, 2, 3, 4]))
print(minCostToMoveChips([2, 2, 2, 2, 2]))
print(minCostToMoveChips([2, 2, 2, 3, 3]))
print(minCostToMoveChips([1, 1_000_000_000]))
print(minCostToMoveChips([2, 2, 3, 3, 4, 5, 5, 5, 5, 6, 6, 7, 7, 7, 7, 7, 8, 8, 9]))
print(minCostToMoveChips([2, 10000]))
