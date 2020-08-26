
func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
    guard !days.isEmpty, !costs.isEmpty, let lastDay = days.last else { return 0 }

    var eachDayPriceArray = Array(repeating: 0, count: lastDay + 1)
    for i in 1..<eachDayPriceArray.count {
        guard days.contains(i) else {
            eachDayPriceArray[i] = eachDayPriceArray[i - 1]
            continue
        }

        let firstPrice = eachDayPriceArray[i - 1] + costs[0]
        let secondPrice = eachDayPriceArray[max(i - 7, 0)] + costs[1]
        let thirdPrice = eachDayPriceArray[max(i - 30, 0)] + costs[2]

        eachDayPriceArray[i] = min(firstPrice, secondPrice, thirdPrice)
    }
    return eachDayPriceArray.last!
}

print(mincostTickets([1,4,6,7,8,20], [2,7,15]))
