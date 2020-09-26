import UIKit

func largestNumber(_ nums: [Int]) -> String {
    let strings = nums.map { String($0) }.sorted { $0 + $1 > $1 + $0 }
    return Int(strings.joined()) == 0 ? "0" : strings.joined()
}

print(largestNumber([3,30,34,5,9]))
print(largestNumber([3,30,34,5,90,9]))
print(largestNumber([0,0]))
