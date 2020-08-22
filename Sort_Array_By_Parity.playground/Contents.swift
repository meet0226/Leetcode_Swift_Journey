import UIKit

func sortArrayByParity(_ A: [Int]) -> [Int] {
    var evenOutput = [Int]()
    let oddOutput = A.filter { (number) -> Bool in
        if number % 2 == 0 {
            evenOutput.append(number)
            return false
        }
        return true
    }
    return evenOutput + oddOutput
}

print(sortArrayByParity([3,1,2,4,5,6,7,8]))
