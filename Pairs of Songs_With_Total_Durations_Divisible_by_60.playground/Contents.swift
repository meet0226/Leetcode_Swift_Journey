import UIKit

func numPairsDivisibleBy60(_ time: [Int]) -> Int {
    var remainders = [Int: [Int]]()
    var count = 0
    for t in time {
        let remainder = t % 60
        if remainder == 0 {
            count += (remainders[0]?.count ?? 0)
        } else {
            count += (remainders[60 - (remainder)]?.count ?? 0)
        }
        if remainders[remainder] == nil {
            remainders[remainder] = [t]
        } else {
            remainders[remainder]?.append(t)
        }
    }
    return count
}

print(numPairsDivisibleBy60([60,30,150,100,40,80,120]))
print(numPairsDivisibleBy60([30,20,150,100,40]))
print(numPairsDivisibleBy60([60,60,60]))
