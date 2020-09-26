import UIKit

func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
    guard !timeSeries.isEmpty else { return 0 }
    var result = duration
    for i in 1..<timeSeries.count {
        result += min((timeSeries[i] - timeSeries[i-1]), duration)
    }
    return result
}

print(findPoisonedDuration([1,4], 2))
print(findPoisonedDuration([1,2,6], 2))
print(findPoisonedDuration([1,2], 2))
print(findPoisonedDuration([], 20000))
