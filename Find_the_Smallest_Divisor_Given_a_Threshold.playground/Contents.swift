import UIKit

func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
    var minimumDivisor = 1
    var maximumDivisor = nums.max()!
    while minimumDivisor < maximumDivisor {
        let mid = minimumDivisor + ((maximumDivisor - minimumDivisor) / 2)
        let sum = nums.reduce(0) { $0 + Int(ceilf(Float($1) / Float(mid))) }
        if sum <= threshold {
            maximumDivisor = mid
        } else {
            minimumDivisor = mid + 1
        }
    }
    return minimumDivisor
}

print(smallestDivisor([1, 2, 5, 9], 17))
print(smallestDivisor([2, 3, 5, 7, 11], 11))
print(smallestDivisor([1, 2, 5, 9], 6))
print(smallestDivisor([19], 5))
