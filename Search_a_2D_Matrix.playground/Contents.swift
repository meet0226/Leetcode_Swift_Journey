import UIKit

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard !matrix.isEmpty else { return false }
    guard !matrix[0].isEmpty else { return false }
    for row in matrix {
        guard let lastValue = row.last, target <= lastValue else { continue }
        guard row.contains(target) else { return false }
        return true
    }
    return false
}

print(searchMatrix([[1, 3, 5, 7], [10, 11, 16, 20], [23, 30, 34, 50]], 13))
print(searchMatrix([[1, 3, 5, 7], [10, 11, 16, 20], [23, 30, 34, 50]], 7))
print(searchMatrix([[1, 3, 5, 7], [10, 11, 16, 20], [23, 30, 34, 50]], 10))
print(searchMatrix([[1, 3, 5, 7], [10, 11, 16, 20], [23, 30, 34, 50]], 20))
print(searchMatrix([], 0))
