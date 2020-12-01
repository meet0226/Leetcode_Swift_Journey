import UIKit

func maxProfit(_ prices: [Int]) -> Int {
    guard !prices.isEmpty else { return 0 }
    var output = 0
    var maxPrice = prices.last!
    for index in stride(from: prices.count - 2, through: 0, by: -1) {
        if (maxPrice - prices[index]) > output {
            output = maxPrice - prices[index]
        }
        maxPrice = (prices[index] > maxPrice) ? prices[index] : maxPrice
    }
    return output
}

print(maxProfit([7, 1, 5, 3, 6, 4]))
print(maxProfit([7, 6, 4, 3, 1]))
print(maxProfit([3, 2, 6, 5, 0, 3]))
print(maxProfit([1, 4, 1, 4, 3, 1]))
