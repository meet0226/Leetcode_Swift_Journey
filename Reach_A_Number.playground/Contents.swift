import UIKit

func reachNumber(_ target: Int) -> Int {
    let target = abs(target)
    var step = 0
    var sum = 0
    while (sum < target) || ((sum - target) % 2 != 0) {
        step += 1
        sum += step
    }
    return step
}

print(reachNumber(5))
