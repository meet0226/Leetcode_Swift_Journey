import UIKit

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var totalGas = 0
    var startPoint = 0
    var negativeTotalGas = 0
    for i in 0..<gas.count {
        totalGas += (gas[i] - cost[i])
        print(totalGas)
        if totalGas < 0 {
            negativeTotalGas += totalGas
            totalGas = 0
            startPoint = (i+1)
        }
    }
    return (totalGas + negativeTotalGas) < 0 ? -1 : startPoint
}

print(canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2]))
print(canCompleteCircuit([2,3,4], [3,4,3]))
print(canCompleteCircuit([5,1,2,3,4],[4,4,1,5,1]))
print(canCompleteCircuit([4,5,1,2,3],[1,4,4,1,5]))
print(canCompleteCircuit([5,1,2,3,4], [2,3,4,5,1]))

