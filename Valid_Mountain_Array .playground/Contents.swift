import UIKit

func validMountainArray(_ A: [Int]) -> Bool {
    let count = A.count
    if count < 3 { return false }

    var index = 1
    while index < A.count && A[index - 1] < A[index] {
        index += 1
    }

    if index == 1 || index == count { return false } // did not find a valid peak
    while index < A.count && A[index - 1] > A[index] {
        index += 1
    }

    return index == count // after 2 interactions, index should be at the end
}

print(validMountainArray([0,3,2,1]))
print(validMountainArray([4,4,3,2,1]))
print(validMountainArray([3,5,5]))
print(validMountainArray([1,3,2]))
