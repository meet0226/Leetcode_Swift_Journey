import UIKit

func minDominoRotations(_ A: [Int], _ B: [Int]) -> Int {
    guard Set(A).count > 1, Set(B).count > 1 else { return 0 }
    var hashMapA = [Int: Int]()
    for value in A {
        if hashMapA[value] == nil {
            hashMapA[value] = 1
        } else {
            hashMapA[value]! += 1
        }
    }

    var hashMapB = [Int: Int]()
    for value in B {
        if hashMapB[value] == nil {
            hashMapB[value] = 1
        } else {
            hashMapB[value]! += 1
        }
    }

    var resultA = 0
    for dict in (hashMapA.sorted { $0.1 > $1.1 }) {
        var index = 0
        for i in 0..<A.count {
            if A[i] != dict.key && B[i] != dict.key {
                break
            }
            index += 1
        }
        if index == A.count {
            resultA = A.count - dict.value
        }
    }

    var resultB = 0
    for dict in (hashMapB.sorted { $0.1 > $1.1 }) {
        var index = 0
        for i in 0..<B.count {
            if B[i] != dict.key && A[i] != dict.key {
                break
            }
            index += 1
        }
        if index == B.count {
            resultB = B.count - dict.value
        }
    }

    return min(resultA,resultB) == 0 ? -1 : min(resultA,resultB)
}

print(minDominoRotations([2,1,2,4,2,2], [5,2,6,2,3,2]))
print(minDominoRotations([3,5,1,2,3], [3,6,3,3,4]))
print(minDominoRotations([1,1,1,1,1,1], [1,1,1,1,1,1]))
print(minDominoRotations([1,1,1,1,1,1], [1,2,3,4,5]))
